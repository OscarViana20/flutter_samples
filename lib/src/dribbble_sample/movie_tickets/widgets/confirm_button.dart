import 'package:flutter/material.dart';
import 'package:flutter_samples/src/dribbble_sample/movie_tickets/pages/movie_ticket_page.dart';
import 'package:flutter_samples/src/dribbble_sample/movie_tickets/widgets/scale_page_route.dart';

class ConfirmButton extends StatefulWidget {
  ConfirmButton({super.key});

  @override
  _ConfirmButtonState createState() => _ConfirmButtonState();
}

class _ConfirmButtonState extends State<ConfirmButton>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  bool _hideText = false;

  final shadows = [
    BoxShadow(
      color: Color(0xFF5E01FF).withOpacity(0.5),
      blurRadius: 20,
      spreadRadius: 5,
      offset: Offset(0, 5), // Shadow position
    )
  ];

  void _callBack() {
    _hideText = false;
    _controller.reverse();
  }

  void _animationListener() {
    if (_controller.isCompleted) {
      Navigator.of(context).push(
        ScalePageRoute(
          widget: MovieTicketPage(voidCallback: _callBack),
          size: MediaQuery.of(context).size,
        ),
      );
    }
  }

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 50));
    _animation = Tween<double>(begin: 330, end: 60).animate(_controller)
      ..addListener(_animationListener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Center(
        child: InkWell(
          onTap: () {
            _controller.forward();
            setState(() {
              _hideText = true;
            });
          },
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Container(
                alignment: Alignment.center,
                height: 60,
                width: _animation.value,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Color(0xFF5E01FF),
                    borderRadius: BorderRadius.circular(300 - _animation.value),
                    boxShadow: shadows),
                child: _hideText
                    ? SizedBox.shrink()
                    : Text("Confirm Choise",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
              );
            },
          ),
        ),
      ),
    );
  }
}
