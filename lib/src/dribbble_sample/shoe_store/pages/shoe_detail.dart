import 'package:flutter/material.dart';

import '../models/shoe.dart';
import '../widgets/dot_matrix.dart';
import '../widgets/layout_page.dart';
import '../widgets/shoe_app_bar.dart';

class SlowMaterialPageRoute extends MaterialPageRoute {
  SlowMaterialPageRoute({
    required WidgetBuilder builder,
  }) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(
        milliseconds: 700,
      );
}

class ShoeDetail extends StatefulWidget {
  const ShoeDetail({
    super.key,
    required this.size,
    required this.index,
  });

  final int index;
  final Size size;

  @override
  State<ShoeDetail> createState() => _ShoeDetailState();
}

class _ShoeDetailState extends State<ShoeDetail>
    with SingleTickerProviderStateMixin {
  late double descPage;
  late double titlePage;
  late double currentPage;

  late final PageController descController;
  late final PageController pageController;
  late final PageController titleController;

  late Animation animationButtons;
  late Animation animationOpacity;
  late Animation animationHorizontal;
  late AnimationController animationController;

  void _shoeScrollListener() {
    setState(() => currentPage = pageController.page ?? 0.0);
  }

  void _shoeTextListener() {
    setState(() => titlePage = titleController.page ?? 0.0);
  }

  void _shoeDescListener() {
    setState(() => descPage = descController.page ?? 0.0);
  }

  void _setupFirstAnimations() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 900),
    );

    animationOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut));

    animationHorizontal = Tween<double>(begin: -widget.size.width, end: 0.0)
        .animate(CurvedAnimation(
            parent: animationController, curve: Curves.easeInOut));

    animationButtons = Tween<double>(begin: -widget.size.height, end: 40.0)
        .animate(CurvedAnimation(
            parent: animationController, curve: Curves.easeInOut));

    animationController.forward();
  }

  @override
  void initState() {
    super.initState();
    titleController = PageController(initialPage: widget.index);
    pageController = PageController(initialPage: widget.index);
    descController = PageController(initialPage: widget.index);

    pageController.addListener(_shoeScrollListener);
    titleController.addListener(_shoeTextListener);
    descController.addListener(_shoeDescListener);

    currentPage = widget.index.toDouble();
    titlePage = widget.index.toDouble();
    descPage = widget.index.toDouble();
    _setupFirstAnimations();
  }

  @override
  void dispose() {
    pageController.removeListener(_shoeScrollListener);
    titleController.removeListener(_shoeTextListener);
    descController.removeListener(_shoeDescListener);

    animationController.dispose();
    titleController.dispose();
    pageController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appBarHeight = kTextTabBarHeight * 1.5;
    return LayoutPage(
      child: Stack(
        children: [
          ShoeAppBar(showBack: true),
          Positioned(
            left: 0,
            right: 0,
            top: appBarHeight,
            child: Stack(
              children: [
                _buildTitle(),
                _buildRanking(),
                _matrix1(),
                _matrix2(),
                _buildBrand(),
                _buildShoe(),
                _favoriteIcon(),
              ],
            ),
          ),
          AnimatedBuilder(
            animation: animationController,
            builder: (context, index) {
              return Positioned(
                left: 0,
                top: 380 + appBarHeight,
                right: animationHorizontal.value,
                child: Container(
                  height: 155.0,
                  child: Stack(
                    children: [
                      _buildDescription(),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            _optionSelector(['10 UK']),
                            SizedBox(height: 15.0),
                            _optionSelector(
                              ['Color'],
                              icon: Icon(
                                Icons.square,
                                color: Color(0xFFEA413B),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          _buildButtons(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return SizedBox(
      height: 100,
      child: PageView.builder(
        itemCount: shoes.length,
        controller: titleController,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final opacity = (1 - (index - titlePage).abs()).clamp(0.0, 1.0);
          return Opacity(
            opacity: opacity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shoes[index].name,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  shoes[index].detail,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildRanking() {
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, index) {
          return Positioned(
            top: 0,
            right: animationHorizontal.value,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white12,
                border: Border.all(color: Colors.white24),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 15.0),
                    Text(
                      '${shoes[currentPage.toInt()].ranking}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _matrix1() {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, index) {
        return Positioned(
          top: 70,
          left: animationHorizontal.value + 10,
          child: Opacity(
            opacity: 1.0 * animationOpacity.value,
            child: DotMatrix(rows: 5, columns: 3, dotSize: 4, spacing: 8),
          ),
        );
      },
    );
  }

  Widget _matrix2() {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, index) {
        return Positioned(
          left: animationHorizontal.value,
          bottom: 0,
          child: Opacity(
            opacity: 1.0 * animationOpacity.value,
            child: Container(
              height: 220,
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                gradient: LinearGradient(
                  colors: [Color(0xFFFF835B), Color(0xFFEA413B)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: DotMatrix(
                  rows: 11,
                  columns: 10,
                  dotSize: 4,
                  spacing: 11,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBrand() {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, index) {
        return Positioned(
          right: animationHorizontal.value,
          top: 90,
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..translate(90.0, 0.0)
              ..rotateZ(270 * 3.14 / 180),
            child: Text(
              "NIKE",
              style: TextStyle(
                fontSize: 130,
                fontWeight: FontWeight.bold,
                color: Colors.black87.withOpacity(0.25),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildShoe() {
    return SizedBox(
      height: 380,
      child: PageView.builder(
        itemCount: shoes.length,
        controller: pageController,
        onPageChanged: (value) {
          titleController.animateToPage(
            value,
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 300),
          );
          descController.animateToPage(
            value,
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 300),
          );
        },
        itemBuilder: (context, index) {
          return Hero(
            tag: 'shoe-${widget.index}',
            child: Image.asset(
              shoes[index].image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          );
        },
      ),
    );
  }

  Widget _favoriteIcon() {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, index) {
        return Positioned(
          right: animationHorizontal.value,
          bottom: 10,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 7.0),
            decoration: BoxDecoration(
              color: Colors.white12,
              border: Border.all(color: Colors.white10),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Icon(Icons.favorite, color: Colors.red),
          ),
        );
      },
    );
  }

  Widget _optionSelector(List<String> options, {Icon? icon}) {
    return Container(
      height: 35.0,
      padding: EdgeInsets.only(left: 12.0),
      decoration: BoxDecoration(
        color: Colors.white12,
        border: Border.all(color: Colors.white30),
        borderRadius: BorderRadius.all(Radius.circular(13.0)),
      ),
      child: Row(
        children: [
          if (icon != null) ...[
            icon,
            SizedBox(width: 10.0),
          ],
          DropdownButton(
            value: options[0],
            items: options.map((option) {
              return DropdownMenuItem(
                value: option,
                child: Text(
                  option,
                  style: TextStyle(fontSize: 11.0, color: Colors.white),
                ),
              );
            }).toList(),
            onChanged: null,
            underline: SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Positioned(
          left: animationHorizontal.value,
          bottom: 0,
          child: Opacity(
            opacity: 1.0 * animationOpacity.value,
            child: SizedBox(
              height: 130.0,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                itemCount: shoes.length,
                controller: descController,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final opacity =
                      (1 - (index - descPage).abs()).clamp(0.0, 1.0);
                  return Opacity(
                    opacity: opacity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Text(
                              '\$${shoes[index].currentPrice.toInt()}',
                              style: TextStyle(
                                fontSize: 25.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              '\$${shoes[index].beforePrice.toInt()}',
                              style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                decorationColor: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '25%OFF',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFEA413B),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          '${shoes[index].description}',
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildButtons() {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Positioned(
          left: 0,
          right: 0,
          bottom: animationButtons.value,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildButton('Add to Cart', Colors.white, Color(0xFF606267)),
              _buildButton('Buy Now', Colors.black, Colors.white),
            ],
          ),
        );
      },
    );
  }

  Widget _buildButton(String text, Color textColor, Color backgroundColor) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(Size(130.0, 50.0)),
        padding: WidgetStateProperty.all(EdgeInsets.all(20.0)),
        backgroundColor: WidgetStateProperty.all(backgroundColor),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
        ),
      ),
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
