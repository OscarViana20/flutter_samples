import 'package:flutter/material.dart';
import 'animated_list_item.dart';
import 'constants/animation_type.dart';

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
              return AnimatedListItem(
                index: index,
                speedFactor: 1.0,
                exitAnimation: true,
                curve: Curves.easeInCubic,
                animationType: AnimationType.spiral,
                duration: const Duration(milliseconds: 600),
                animationDirection: index.isEven
                    ? AnimationDirection.left
                    : AnimationDirection.right,
                child: Container(
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
                    trailing:
                        Icon(Icons.favorite, size: 30, color: Colors.pink),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class AnimatedBackground extends StatefulWidget {
  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5))
          ..repeat(reverse: true);

    _colorAnimation = ColorTween(begin: Colors.blueGrey, end: Colors.deepPurple)
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                _colorAnimation.value ?? Colors.blueGrey,
                Colors.black87,
              ],
            ),
          ),
        );
      },
    );
  }
}
