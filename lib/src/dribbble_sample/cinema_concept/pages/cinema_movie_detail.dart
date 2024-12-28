import 'package:flutter/material.dart';
import 'package:flutter_samples/src/dribbble_sample/cinema_concept/models/cinema_concept_model.dart';

class CinemaMovieDetail extends StatefulWidget {
  CinemaMovieDetail({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  State<CinemaMovieDetail> createState() => _CinemaMovieDetailState();
}

class _CinemaMovieDetailState extends State<CinemaMovieDetail> {
  ScrollController _scrollController = ScrollController();
  double offset = 0.0;

  @override
  void initState() {
    _scrollController.addListener(() {
      setState(() {
        offset = _scrollController.offset;
        print('offset $offset');
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF222222),
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                backgroundColor: Color(0xFF222222),
                expandedHeight: size.height * 0.50,
                floating: true,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    titlePadding: EdgeInsets.only(left: 20, bottom: 10),
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                            width: size.width / 3,
                            child: Text(widget.movie.description,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 1.0),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.0, vertical: 2.0),
                                  child: Text('3D',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12))),
                            ),
                            SizedBox(width: 5.0),
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 1.0),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.0, vertical: 2.0),
                                  child: Text('IMAX',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12))),
                            )
                          ],
                        )
                      ],
                    ),
                    background: Stack(children: [
                      Positioned(
                          left: 0,
                          top: 0,
                          right: 0,
                          bottom: 0,
                          child: Image.asset(widget.movie.backgroud!,
                              fit: BoxFit.fill)),
                      Positioned(
                          bottom: 0,
                          width: size.width,
                          height: kToolbarHeight * 1.5,
                          child: Container(
                              decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xFF222222),
                                  spreadRadius: 55,
                                  blurRadius: 30),
                            ],
                          )))
                    ])),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.watch_later_outlined,
                          color: Color(0xFFa39766)),
                      SizedBox(width: 10.0),
                      Text('2hr 11Min',
                          style: TextStyle(fontSize: 15.0, color: Colors.grey)),
                      SizedBox(width: 40.0),
                      Text('Action / Superheros',
                          style: TextStyle(fontSize: 15.0, color: Colors.grey)),
                    ],
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                      color: Colors.white,
                      width: 0.2,
                    ))),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Details',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          Padding(
                            padding: EdgeInsets.only(top: 15.0),
                            child: Container(
                              height: 170,
                              child: Row(
                                children: [
                                  Hero(
                                      tag: '${widget.movie.id}',
                                      child: Container(
                                          width: 130,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.asset(
                                                  widget.movie.image,
                                                  fit: BoxFit.fill)))),
                                  SizedBox(width: 50),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text('Directed by: ',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16)),
                                          Text('Peinton Reed',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15)),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('Censor Rating: ',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16)),
                                          Text('13+',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15)),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('Language: ',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16)),
                                          Text('English',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15)),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('Subtitle: ',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16)),
                                          Text('Spanish',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15)),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                    color: Colors.white,
                    width: 0.2,
                  ))),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.0),
                          child: Text('Story',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                              'As Scott Land balances being both a Super Hero and a father. Hope van Dyne and Dr. Hank Pym present and urgent new mission that the Ant-Man fighting alongside The Wasp to uncover secrets from their past',
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.grey)),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                    color: Colors.white,
                    width: 0.2,
                  ))),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.0),
                          child: Text('Story',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                              'As Scott Land balances being both a Super Hero and a father. Hope van Dyne and Dr. Hank Pym present and urgent new mission that the Ant-Man fighting alongside The Wasp to uncover secrets from their past',
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.grey)),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                    color: Colors.white,
                    width: 0.2,
                  ))),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.0),
                          child: Text('Story',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                              'As Scott Land balances being both a Super Hero and a father. Hope van Dyne and Dr. Hank Pym present and urgent new mission that the Ant-Man fighting alongside The Wasp to uncover secrets from their past',
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.grey)),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                    color: Colors.white,
                    width: 0.2,
                  ))),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.0),
                          child: Text('Story',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                              'As Scott Land balances being both a Super Hero and a father. Hope van Dyne and Dr. Hank Pym present and urgent new mission that the Ant-Man fighting alongside The Wasp to uncover secrets from their past',
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.grey)),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                    color: Colors.white,
                    width: 0.2,
                  ))),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.0),
                          child: Text('Story',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                              'As Scott Land balances being both a Super Hero and a father. Hope van Dyne and Dr. Hank Pym present and urgent new mission that the Ant-Man fighting alongside The Wasp to uncover secrets from their past',
                              style: TextStyle(
                                  fontSize: 15.0, color: Colors.grey)),
                        )
                      ],
                    ),
                  ),
                )
              ]))
            ],
          ),
          _customAppBar(context, size)
          /*Container(
            width: size.width,
            height: size.height,
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: size.width,
              height: size.height * 0.60,
              child: Image.asset(movie.backgroud, fit: BoxFit.fill),
            ),
          ),          
          _customAppBar(context, size),
          Positioned(
            top: size.height * 0.45,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(                
                color: Color(0xFF222222).withOpacity(0.5),
                boxShadow: [
                  BoxShadow(color: Colors.black, spreadRadius: 55, blurRadius: 65),
                ],
              )
            )
          ),
          Positioned(
            left: 0,
            right: 0,
            top: size.height * 0.35,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: size.width/2,
                        child: Text(movie.description, style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold))
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
                              child: Text('3D', style: TextStyle(color: Colors.grey))
                            ),
                          ),
                          SizedBox(width: 5.0),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
                              child: Text('IMAX', style: TextStyle(color: Colors.grey))
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.watch_later_outlined, color: Color(0xFFa39766)),
                        SizedBox(width: 10.0),
                        Text('2hr 11Min', style: TextStyle(fontSize: 15.0, color: Colors.grey)),
                        SizedBox(width: 40.0),
                        Text('Action / Superheros', style: TextStyle(fontSize: 15.0, color: Colors.grey)),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.white,
                          width: 0.2,
                        )
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Text('Details', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          height: 170,
                          child: Row(
                            children: [
                              Hero(
                                tag: '${movie.id}',
                                child: Container(
                                  width: 130,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(movie.image, fit: BoxFit.fill)
                                  )
                                )
                              ),
                              SizedBox(width: 50),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text('Directed by: ', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16)),
                                      Text('Peinton Reed', style: TextStyle(color: Colors.grey, fontSize: 15)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Censor Rating: ', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16)),
                                      Text('13+', style: TextStyle(color: Colors.grey, fontSize: 15)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Language: ', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16)),
                                      Text('English', style: TextStyle(color: Colors.grey, fontSize: 15)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Subtitle: ', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16)),
                                      Text('Spanish', style: TextStyle(color: Colors.grey, fontSize: 15)),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Colors.white,
                            width: 0.2,
                          )
                        )
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text('As Scott Land balances being both a Super Hero and a father. Hope van Dyne and Dr. Hank Pym present and urgent new mission that the Ant-Man fighting alongside The Wasp to uncover secrets from their past', 
                          style: TextStyle(fontSize: 15.0, color: Colors.grey)
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          )*/
        ],
      ),
    );
  }

  Widget _customAppBar(BuildContext context, Size size) {
    return Positioned(
        top: kToolbarHeight / 1.7,
        left: 10,
        right: 10,
        child: Container(
          width: size.width,
          height: kToolbarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFa39766),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                      child:
                          Icon(Icons.chevron_left_rounded, color: Colors.white),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  )),
              Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFa39766),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(Icons.search, color: Colors.white),
                  ))
            ],
          ),
        ));
  }
}
