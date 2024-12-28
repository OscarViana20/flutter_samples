import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      color: Colors.blue.shade700,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: kToolbarHeight / 2),
                Row(
                  children: [
                    CircleAvatar(radius: 50, backgroundImage: AssetImage('assets/images/avatar.jfif')),
                  ],
                ),
                SizedBox(height: kToolbarHeight / 2),
                Row(
                  children: [
                    Text('Hola,\nIván', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
                  ],
                ),
                SizedBox(height: kToolbarHeight),
                Row(
                  children: [
                    Icon(Icons.home_outlined, size: 25.0, color: Colors.white),
                    SizedBox(width: 10),
                    Text('Principal', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white))
                  ],
                ),
                SizedBox(height: kToolbarHeight / 2),
                Row(
                  children: [
                    Icon(Icons.explore_outlined, size: 25.0, color: Colors.white),
                    SizedBox(width: 10),
                    Text('Explorar', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white))
                  ],
                ),
                SizedBox(height: kToolbarHeight / 2),
                Row(
                  children: [
                    Image.asset('assets/images/playstation/ps_game.png',
                      fit: BoxFit.fill,
                      width: 40,
                      height: 25,
                      color: Colors.white,
                    )
                  ],
                ),
                SizedBox(height: kToolbarHeight / 2),
                Row(
                  children: [
                    Icon(Icons.gamepad_outlined, size: 25.0, color: Colors.white),
                    SizedBox(width: 10),
                    Text('Juegos', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white))
                  ],
                ),
                SizedBox(height: kToolbarHeight / 2),
                Row(
                  children: [
                    Icon(Icons.my_library_books, size: 25.0, color: Colors.white),
                    SizedBox(width: 10),
                    Text('Biblioteca', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white))
                  ],
                ),
                SizedBox(height: kToolbarHeight / 2),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: kToolbarHeight * 1.2,
                child: Image.asset('assets/images/playstation/ps_logo.png',
                  fit: BoxFit.cover,
                  color: Colors.white,
                )
              )
            )
          ],
        ),
      ),
    );
  }
}