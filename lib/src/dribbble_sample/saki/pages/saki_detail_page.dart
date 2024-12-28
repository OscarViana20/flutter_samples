import 'package:flutter/material.dart';
import 'package:flutter_samples/src/dribbble_sample/saki/models/saki_model.dart';
import 'package:flutter_samples/src/dribbble_sample/saki/pages/saki_settings_page.dart';

class SakiDetailPage extends StatefulWidget {
  const SakiDetailPage({
    super.key,
    required this.saki,
  });

  final Saki saki;

  @override
  _SakiDetailPageState createState() => _SakiDetailPageState();
}

class _SakiDetailPageState extends State<SakiDetailPage>
    with SingleTickerProviderStateMixin {
  final ValueNotifier<bool> notifierBottomBarVisible = ValueNotifier(false);

  late AnimationController _animationController;
  late Animation<double> _animationScale;
  late Animation<double> _animationIn;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _animationScale = Tween(begin: 2.5, end: 1.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.5, 0.75, curve: Curves.decelerate)));

    _animationIn = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.75, 1.0, curve: Curves.decelerate)));

    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifierBottomBarVisible.value = true;
    });

    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          return Scaffold(
            body: Stack(
              children: [
                CustomScrollView(slivers: <Widget>[
                  _crearAppbar(context, widget.saki),
                  SliverList(
                      delegate: SliverChildListDelegate([
                    SizedBox(
                      height: 10.0,
                    ),
                    _storie(widget.saki)
                  ])),
                ]),
                _bottomButtons(context)
              ],
            ),
          );
        });
  }

  Widget _crearAppbar(BuildContext context, Saki saki) {
    return SliverAppBar(
      elevation: 2.0,
      expandedHeight: 250.0,
      pinned: true,
      backgroundColor: Color(saki.backgroundColor),
      actions: [
        IconButton(
            icon: Icon(Icons.share), color: Colors.black, onPressed: () => {})
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: _animatedImage(context, saki),
      ),
    );
  }

  Widget _animatedImage(BuildContext context, Saki saki) {
    final size = MediaQuery.of(context).size;
    final dynamicSize = 0.70 + (2.5 - _animationScale.value);
    final diameter = size.width * (dynamicSize > 1 ? 1 : dynamicSize);
    return Transform.scale(
      scale: _animationScale.value,
      child: Center(
          child: Stack(
        children: [
          Hero(
              tag: saki.name,
              child: Image.asset(saki.imagePath,
                  fit: BoxFit.fill, height: diameter, width: diameter)),
          _shadow(context, saki)
        ],
      )),
    );
  }

  Widget _shadow(BuildContext context, Saki saki) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      top: 0,
      child: Container(
        width: size.width,
        height: kToolbarHeight / 3,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color(saki.backgroundColor),
                spreadRadius: 15,
                blurRadius: 30),
          ],
        ),
      ),
    );
  }

  Widget _storie(Saki saki) {
    return Opacity(
      opacity: _animationIn.value,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          children: [
            Text(saki.title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10.0),
            RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                    text: saki.storie,
                    style: TextStyle(color: Colors.black, fontSize: 18))),
          ],
        ),
      ),
    );
  }

  Widget _bottomButtons(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: notifierBottomBarVisible,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
                heroTag: 'fav_2',
                backgroundColor: Colors.black,
                child: Icon(Icons.shopping_cart),
                onPressed: () {
                  _openSettings(context);
                })
          ],
        ),
      ),
      builder: (context, value, child) {
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 350),
          left: 0,
          right: 0,
          bottom: value ? 0.0 : -kToolbarHeight * 1.5,
          child: child!,
        );
      },
    );
  }

  void _openSettings(BuildContext context) async {
    notifierBottomBarVisible.value = false;
    await Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        pageBuilder: (_, animation1, __) {
          return FadeTransition(opacity: animation1, child: SakiSettingsPage());
        }));
    notifierBottomBarVisible.value = true;
  }
}
