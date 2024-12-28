import 'package:flutter/material.dart';
import 'package:flutter_samples/src/dribbble_sample/cinema_concept/models/cinema_concept_model.dart';
import 'package:flutter_samples/src/dribbble_sample/cinema_concept/pages/cinema_movie_page.dart';

class CinemaConceptMain extends StatelessWidget {
  const CinemaConceptMain({super.key});

  void _onShowDetail(BuildContext context) async {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        reverseTransitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation1, _) {
          return FadeTransition(opacity: animation1, child: CinemaMovie());
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xFF0f0f11),
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Cinema XXI',
            style: TextStyle(fontSize: 20, color: Color(0xFFa39766)),
          ),
          backgroundColor: Color(0xFF3d332c),
          leading: BackButton(color: Colors.white),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.search, color: Colors.white),
            )
          ],
        ),
        bottomNavigationBar: _bottomNavigationBar(context),
        body: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 50,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Color(0xFF3d332c),
                        border: Border(
                          top: BorderSide(
                            color: Colors.white,
                            width: 0.2,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Color(0xFFa39766),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'Jakarta',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_downward_sharp,
                            color: Colors.white,
                            size: 15.0,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.white,
                            width: 0.2,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 10.0,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'm bik',
                                  style: TextStyle(color: Color(0xFFa39766)),
                                ),
                                Text(
                                  'Rp 200,000',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xFFa39766),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                  vertical: 2.0,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.folder_outlined,
                                      color: Color(0xFFa39766),
                                    ),
                                    Text(
                                      'Top up',
                                      style:
                                          TextStyle(color: Color(0xFFa39766)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.image, color: Color(0xFFa39766)),
                                Padding(
                                  padding: EdgeInsets.only(left: 15.0),
                                  child: Text('Popular Now',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                )
                              ],
                            ),
                            Text('See all',
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xFFa39766))),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: size.height * 0.26,
                      child: PageView(
                        padEnds: false,
                        scrollDirection: Axis.horizontal,
                        controller: PageController(
                            viewportFraction: 0.8, initialPage: 0),
                        children: [
                          for (int i = 0; i < popularNow.length; i++)
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Stack(
                                  children: [
                                    Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        child: Image.asset(popularNow[i].image,
                                            fit: BoxFit.fill)),
                                    Positioned(
                                        left: 10.0,
                                        right: 10.0,
                                        bottom: 10.0,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(popularNow[i].description,
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    color: Colors.white)),
                                            Text('Now showing',
                                                style: TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.white))
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.image, color: Color(0xFFa39766)),
                                Padding(
                                  padding: EdgeInsets.only(left: 15.0),
                                  child: Text('Now Showing',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                )
                              ],
                            ),
                            GestureDetector(
                                onTap: () => _onShowDetail(context),
                                child: Text('See all',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xFFa39766)))),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
            Positioned(
              left: 0,
              right: 0,
              bottom: -1,
              child: Container(
                height: size.height * 0.28,
                child: PageView(
                  padEnds: false,
                  scrollDirection: Axis.horizontal,
                  controller:
                      PageController(viewportFraction: 0.42, initialPage: 0),
                  children: [
                    for (int i = 0; i < nowShowing.length; i++)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          child: Container(
                            color: Color(0xFF222222),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: Image.asset(nowShowing[i].image,
                                        fit: BoxFit.fill)),
                              ),
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0xFF222222),
      fixedColor: Color(0xFFa39766),
      unselectedItemColor: Colors.grey,
      currentIndex: 0,
      onTap: null,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.movie_creation,
              size: 25.0,
            ),
            label: 'Movies'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.local_movies,
              size: 25.0,
            ),
            label: 'Trailers'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.credit_card,
              size: 25.0,
            ),
            label: 'Tickets'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline_sharp,
              size: 25.0,
            ),
            label: 'Account'),
      ],
    );
  }
}
