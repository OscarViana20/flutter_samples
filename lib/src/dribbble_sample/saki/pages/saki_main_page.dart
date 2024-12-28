import 'package:flutter/material.dart';
import 'package:flutter_samples/src/dribbble_sample/saki/constants/colors.dart';
import 'package:flutter_samples/src/dribbble_sample/saki/models/saki_model.dart';

import 'saki_detail_page.dart';

const _initialPage = 1.0;

class SakiMainPage extends StatefulWidget {
  @override
  _SakiMainPageState createState() => _SakiMainPageState();
}

class _SakiMainPageState extends State<SakiMainPage>
    with SingleTickerProviderStateMixin {
  final _pageController =
      PageController(viewportFraction: 0.50, initialPage: _initialPage.toInt());

  late AnimationController _animationController;
  late Animation<double> _animationScale;
  late Animation<double> _animationOut;
  late Animation<double> _animationButtons;

  double selected = _initialPage;

  void _pageScrollListener() {
    setState(() {
      selected = _pageController.page!;
    });
  }

  @override
  void initState() {
    _pageController.addListener(_pageScrollListener);

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _animationScale = Tween(begin: 1.0, end: 2.5).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.75, curve: Curves.decelerate)));

    _animationOut = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.75, curve: Curves.decelerate)));

    _animationButtons = CurvedAnimation(
        parent: _animationController, curve: Interval(0.75, 1.0));

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _onShowDetail(BuildContext context, Saki saki) async {
    await _animationController.forward();

    Navigator.of(context)
        .push(PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            reverseTransitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, animation1, _) {
              return FadeTransition(
                  opacity: animation1, child: SakiDetailPage(saki: saki));
            }))
        .then((value) => _animationController.reset());
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: CustomAppBar(opacity: _animationButtons.value),
            body: Stack(
              children: [
                PageView.builder(
                    itemCount: sakiList.length,
                    controller: _pageController,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final saki = sakiList[index];
                      final value = index == selected
                          ? _animationScale.value
                          : _animationOut.value;
                      return GestureDetector(
                        child: _animatedImage(saki, value),
                        onTap: () => _onShowDetail(context, saki),
                      );
                    }),
                _bottomButtons()
              ],
            ),
          );
        });
  }

  Widget _animatedImage(Saki saki, double value) {
    final size = MediaQuery.of(context).size;
    final diameter = size.width * 0.70;
    return Transform.scale(
      scale: value,
      child: Center(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(diameter),
              child: Hero(
                  tag: saki.name,
                  child: Image.asset(saki.imagePath,
                      fit: BoxFit.cover, height: diameter, width: diameter)))),
    );
  }

  Widget _bottomButtons() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 15 - (100 * _animationButtons.value),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black26, blurRadius: 1, spreadRadius: 2)
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: buttons),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.now_widgets_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            'HOME',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: Icon(
                    Icons.folder,
                    color: Colors.grey,
                  )),
                  Expanded(child: Icon(Icons.menu_book, color: Colors.grey)),
                  Expanded(child: Icon(Icons.person_sharp, color: Colors.grey))
                ],
              ),
            )),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({required this.opacity});

  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 1 - opacity,
      child: AppBar(
          elevation: 10.0,
          toolbarHeight: kToolbarHeight + 10,
          automaticallyImplyLeading: false,
          titleSpacing: 20.0,
          title: Row(children: [
            Text(
              'Welcome back! ',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
            Text(
              'saki',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            )
          ]),
          actions: [
            CircleAvatar(
              radius: 25,
              backgroundColor: buttons,
              child: Text(
                'js',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            SizedBox(
              width: 5.0,
            )
          ]),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
