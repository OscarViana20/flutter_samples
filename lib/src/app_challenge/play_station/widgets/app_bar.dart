import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget {

  AppBarWidget({
    this.function,
    this.backAction = false
  });

  final bool backAction;
  final VoidCallback? function;

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  
  bool _activate = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight * 1.5,
      padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            color: Colors.black,
            icon: Icon(_activate ? Icons.close : widget.backAction == false ? Icons.menu : Icons.arrow_back, size: 35),
            onPressed: () {
              _activate = !_activate;
              widget.function?.call();
            
              if (widget.backAction) {
                Navigator.of(context).pop();
              }
            },
          ),
          Container(
            child: Image.asset('assets/images/playstation/ps_logo.png',
              fit: BoxFit.cover
            )
          ),
          CircleAvatar(radius: 25, backgroundImage: AssetImage('assets/images/avatar.jfif')),
        ],
      ),
    );
  }
}