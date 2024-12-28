import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {

  SearchWidget({
    this.showBackButton = false
  });

  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (showBackButton) ... [
          Container(
            height: kToolbarHeight,
            child: IconButton(
              color: Colors.blue,
              icon: Icon(Icons.chevron_left_rounded, size: 40),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          )
        ],
        Expanded(
          child: Padding(
            padding: showBackButton ? 
              const EdgeInsets.fromLTRB(0.0, 5.0, 30.0, 15.0) : 
              const EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 15.0),
            child: Container(
              height: kToolbarHeight * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xffDADADA),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey.shade500,
                      size: 30,
                    ),
                    SizedBox(width: 10,),
                    Text('Buscar juego', 
                      style: TextStyle(
                        fontSize: 22, 
                        fontWeight: FontWeight.w500, 
                        color: Colors.grey.shade500
                      ),
                    )
                  ],
                ),
              ),
            ),
        ),
      ],
    );
  }
}