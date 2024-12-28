import 'package:flutter/material.dart';
import 'package:flutter_samples/src/app_challenge/play_station/models/playstation_model.dart';
import 'package:flutter_samples/src/app_challenge/play_station/pages/game_detail_page.dart';
import 'package:flutter_samples/src/app_challenge/play_station/widgets/app_bar.dart';
import 'package:flutter_samples/src/app_challenge/play_station/widgets/search.dart';

const _initialPage = 0.0;

class PlayStationPage extends StatefulWidget {
  PlayStationPage({required this.function});

  final VoidCallback function;

  @override
  State<PlayStationPage> createState() => _PlayStationPageState();
}

class _PlayStationPageState extends State<PlayStationPage> {
  final _pageController =
      PageController(viewportFraction: 0.90, initialPage: _initialPage.toInt());

  @override
  void initState() {
    super.initState();
  }

  void _onShowDetail(BuildContext context, Recommended recommended) async {
    Navigator.of(context).push(PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        reverseTransitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation1, _) {
          return FadeTransition(
              opacity: animation1,
              child: GameDateilPage(recommended: recommended));
        }));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(context),
      body: Column(
        children: [
          AppBarWidget(function: () => widget.function.call()),
          SingleChildScrollView(
            child: Column(
              children: [
                SearchWidget(),
                Container(
                  height: size.height * 0.35,
                  child: PageView.builder(
                      itemCount: recommendList.length,
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final item = recommendList[index];
                        return GestureDetector(
                          onTap: () => _onShowDetail(context, item),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Stack(
                                children: [
                                  Image.asset(
                                    item.image,
                                    fit: BoxFit.cover,
                                    width: size.width,
                                    height: size.height * 0.35,
                                  ),
                                  Positioned(
                                      top: 10,
                                      right: 10,
                                      child: Icon(Icons.favorite,
                                          color: Colors.white, size: 35.0)),
                                  Positioned(
                                      bottom: 0,
                                      child: Container(
                                        width: size.width,
                                        height: kToolbarHeight / 2.5,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black,
                                                spreadRadius: 15,
                                                blurRadius: 55),
                                          ],
                                        ),
                                      )),
                                  Positioned(
                                      bottom: 20,
                                      left: 20,
                                      right: 20,
                                      child: Text(item.description,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 28)))
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/playstation/spider_man.jfif',
                            fit: BoxFit.cover,
                            width: size.width,
                            height: size.width * 0.33,
                          ),
                          Positioned(
                              left: 20,
                              top: 20,
                              right: size.width / 2.2,
                              child: Text('Marvel’s Spider-Man: Miles Morales',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)))
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Más Juegos',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      Container(
                        height: size.width * 0.25,
                        child: ListView.builder(
                            itemCount: gameList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final item = gameList[index];
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    item.image,
                                    fit: BoxFit.cover,
                                    width: size.width * 0.3,
                                    height: size.width * 0.3,
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      fixedColor: Colors.blueAccent,
      unselectedItemColor: Colors.grey,
      currentIndex: 2,
      onTap: null,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 25.0,
            ),
            label: 'Principal'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.explore_outlined,
              size: 25.0,
            ),
            label: 'Explorar'),
        BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/playstation/ps_game.png',
              fit: BoxFit.fill,
              width: 40,
              height: 25,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.gamepad_outlined,
              size: 25.0,
            ),
            label: 'Juegos'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.my_library_books,
              size: 25.0,
            ),
            label: 'Biblioteca')
      ],
    );
  }
}
