import 'package:flutter/material.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF606267), Color(0xFF0A0B0D)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 30.0,
            top: 30.0,
            right: 30.0,
            bottom: 10.0,
          ),
          child: child,
        ),
      ),
    );
  }
}
