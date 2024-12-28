import 'package:flutter/material.dart';

import '../models/bank_card.dart';
import '../widgets/add_card_section.dart';
import '../widgets/bottom_section.dart';
import '../widgets/header_section.dart';

class BankManagerMain extends StatefulWidget {
  const BankManagerMain({super.key});

  @override
  State<BankManagerMain> createState() => _BankManagerMainState();
}

class _BankManagerMainState extends State<BankManagerMain> {
  late final PageController pageController;

  int currentPage = 1;

  double xOffset = 0.0;
  double pageOffset = 1.0;
  double verticalPos = 0.0;

  void _pageListener() {
    final size = MediaQuery.of(context).size;
    setState(() {
      pageOffset = pageController.page!;
      xOffset = pageOffset < 1 ? 0 : size.width * (1 - pageOffset);
    });
  }

  // llama de forma continua durante el deslizamiento
  void _onVerticalDragUpdate(DragUpdateDetails details) {
    final height = MediaQuery.of(context).size.height;
    setState(() {
      verticalPos += details.primaryDelta!;
      verticalPos = verticalPos.clamp(0, height * 0.77);
    });
  }

  // llama al levantar el dedo
  void _onVerticalDragEnd(DragEndDetails details) {
    final height = MediaQuery.of(context).size.height;
    final isMax = details.primaryVelocity! > 500 || verticalPos > height / 1.5;
    setState(() {
      verticalPos = isMax ? height * 0.77 : 0.0;
    });
  }

  @override
  void initState() {
    pageController = PageController(
      initialPage: 1,
      viewportFraction: 0.9,
    )..addListener(_pageListener);
    super.initState();
  }

  @override
  void dispose() {
    pageController.removeListener(_pageListener);
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          HeaderSection(
            pageOffset: pageOffset,
            verticalPos: verticalPos,
            onVerticalDragEnd: _onVerticalDragEnd,
            onVerticalDragUpdate: _onVerticalDragUpdate,
          ),
          BottomSection(
            pageOffset: pageOffset,
            currentPage: currentPage,
            verticalPos: verticalPos,
          ),
          AddCardSection(
            xOffset: xOffset,
            pageOffset: pageOffset,
            verticalPos: verticalPos,
          ),
          _buildCardsSection(),
        ],
      ),
    );
  }

  Widget _buildCardsSection() {
    return Positioned(
      left: 0,
      right: 0,
      top: 185.0 + verticalPos,
      bottom: 110.0 - verticalPos,
      child: PageView.builder(
        controller: pageController,
        itemCount: bankCards.length + 1,
        physics: const BouncingScrollPhysics(),
        onPageChanged: (value) {
          setState(() => currentPage = value);
        },
        itemBuilder: (context, index) {
          if (index == 0) {
            return SizedBox.shrink();
          }
          return GestureDetector(
            onVerticalDragEnd: _onVerticalDragEnd,
            onVerticalDragUpdate: _onVerticalDragUpdate,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  image: DecorationImage(
                    image: AssetImage(bankCards[index - 1].image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
