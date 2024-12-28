import 'package:flutter/material.dart';
import 'package:flutter_samples/src/app_challenge/play_station/models/playstation_model.dart';
import 'package:flutter_samples/src/app_challenge/play_station/widgets/app_bar.dart';
import 'package:flutter_samples/src/app_challenge/play_station/widgets/search.dart';

class GameDateilPage extends StatelessWidget {

  GameDateilPage({
    required this.recommended
  });

  final Recommended recommended;

  @override
  Widget build(BuildContext context) {    
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          AppBarWidget(backAction: true),
          SearchWidget(showBackButton: false),
          Expanded(
            child: Container(
              color: Colors.black87,
              child: Stack(
                children: [
                  Container(
                    height: size.height * 0.30,
                    child: Image.asset(this.recommended.banner,
                      fit: BoxFit.fill,
                      width: size.width,
                      height: size.height * 0.30,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    top: size.height / 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                        child: Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: size.width * 0.7,
                                      child: Text(this.recommended.description, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 28))
                                    ),
                                    Icon(Icons.favorite, color: Colors.blue.shade900, size: 35.0)
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10.0),
                                        child: Image.asset(this.recommended.image,
                                          fit: BoxFit.cover,
                                          width: size.width * 0.45,
                                          height: size.width * 0.45,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 20.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              Text('Activision', style: TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold)),
                                              SizedBox(height: 5.0,),
                                              Text('US\$59.99', style: TextStyle(color: Colors.blue, fontSize: 28, fontWeight: FontWeight.bold)),
                                              SizedBox(height: 5.0,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Icon(Icons.blur_circular_sharp, size: 20, color: Colors.black),
                                                  SizedBox(
                                                    width: size.width * 0.3,
                                                    child: Text('Juego offline activado')
                                                  )
                                                ],
                                              ),
                                              SizedBox(height: 5.0,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Icon(Icons.person, size: 20, color: Colors.black),
                                                  SizedBox(
                                                    width: size.width * 0.3,
                                                    child: Text('1 - 4 jugadores')
                                                  )
                                                ],
                                              ),
                                              SizedBox(height: 5.0,),
                                              ElevatedButton(
                                                onPressed: () {}, 
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.orange.shade900,
                                                  padding: EdgeInsets.all(12.0),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(18),            
                                                    side: BorderSide(color: Color.fromRGBO(175, 160, 227, 1))
                                                  )
                                                ),
                                                child: Text('COMPRAR', style: TextStyle(color: Colors.white))
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Container(
                                      color: Colors.blue.shade700,
                                      height: size.width * 0.3,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Image.asset('assets/images/playstation/e10.png',
                                              fit: BoxFit.fill,
                                              width: size.width * 0.2,
                                              height: size.width * 0.25,
                                            ),
                                            SizedBox(
                                              width: size.width * 0.55,
                                              child: Text('Lenguaje, Referencia al alcohol, Travesuras cómicas, Violencia de dibujos animados.',
                                                style: TextStyle(color: Colors.white, fontSize: 15))
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ),
                      ),
                    )
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}