import 'package:amazing_animated_widget/amazing_animated_widget.dart';
import 'package:flutter/material.dart';

class AnimatedPage extends StatelessWidget {
  AnimatedPage({super.key});

  final List<String> items = List.generate(100, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Amazing Animated List'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return AmazingAnimatedWidget(
                index: index,
                speedFactor: 1.0,
                exitAnimation: true,
                curve: Curves.easeInCubic,
                animationType: AnimationType.spiral,
                duration: const Duration(milliseconds: 600),
                animationDirection: index.isEven
                    ? AnimationDirection.left
                    : AnimationDirection.right,
                child: _buildItem(index),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildItem(int index) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.purpleAccent.withOpacity(0.6),
            Colors.pinkAccent.withOpacity(0.6),
          ],
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: Offset(2, 4),
            color: Colors.black26,
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ListTile(
        subtitle: Text(
          'Subtitle for ${items[index]}',
          style: TextStyle(
            color: Colors.white70,
            fontStyle: FontStyle.italic,
          ),
        ),
        title: Text(
          items[index],
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Icon(Icons.star, size: 30, color: Colors.amber),
        trailing: Icon(Icons.favorite, size: 30, color: Colors.pink),
      ),
    );
  }
}
