import 'package:flutter/material.dart';
import 'package:flutter_samples/src/dribbble_sample/movie_tickets/models/movie_tickets_model.dart';

class MovieDates extends StatefulWidget {
  
  MovieDates({
    super.key,    
    required this.currentPage
  });

  final int currentPage;

  @override
  _MovieDatesState createState() => _MovieDatesState();

}

const Color _colorButtons = Color(0xFF5E01FF);

class _MovieDatesState extends State<MovieDates> with SingleTickerProviderStateMixin {

  final shadows = [
    BoxShadow(
      color: _colorButtons.withOpacity(0.5),
      blurRadius: 20,
      spreadRadius: 5,
      offset: Offset(0, 5), // Shadow position
    )
  ];

  final textShadows = [
    Shadow(
      color: Colors.red.shade900.withOpacity(1.0),
      offset: Offset(1.0, 1.0),
      blurRadius: 5.0,
    ),
  ];

  void _controllerListener() {
    setState(() {
      
    });
  }
  
  int selectedDate = -1;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 200), upperBound: 0.1);
    _controller.addListener(_controllerListener);
    super.initState();    
  }
  
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [        
        Text('Choose Date', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.0)),
        Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 16.0),
          child: Container(
            height: 95,
            child: ListView(            
              scrollDirection: Axis.horizontal,
              children: [
                for (var i = 0; i < popularList[widget.currentPage].showDates.length; i++)
                  Transform.scale(
                    scale: selectedDate == i ? 1 - _controller.value : 1,
                    child: GestureDetector(
                      onTapDown: (_) {
                        setState(() {
                          selectedDate = i;
                        });
                        _controller.forward();
                      },
                      onTapUp: (_) {
                        _controller.reverse();
                      },
                      child: Container(
                        width: 110,
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.only(top: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: selectedDate == i ? _colorButtons : null,
                          border: selectedDate == i ? null : Border.all(width: 1, color: Colors.grey.shade300),
                          boxShadow: selectedDate == i ? shadows : []
                        ),
                        child: Column(
                          children: [
                            Text(popularList[widget.currentPage].showDates[i].day, 
                              style: TextStyle(
                                fontWeight: FontWeight.w500, 
                                color: Colors.grey.shade300, 
                                fontSize: 18.0,
                                shadows: selectedDate == i ? textShadows : []
                              )
                            ),
                            Text(popularList[widget.currentPage].showDates[i].date, 
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20.0)),
                          ],
                        ),
                      ),
                    ),
                  )
              ]
            )
          ),
        ),
      ],
    );
  }
}