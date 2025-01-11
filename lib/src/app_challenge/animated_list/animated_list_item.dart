import 'package:flutter/material.dart';

import 'constants/animation_type.dart';
import 'widgets/circular_animation.dart';
import 'widgets/explosion_animation.dart';
import 'widgets/fade_animation.dart';
import 'widgets/flip_animation.dart';
import 'widgets/scale_animation.dart';
import 'widgets/spiral_animation.dart';

class AnimatedListItem extends StatefulWidget {
  AnimatedListItem({
    super.key,
    required this.index,
    required this.child,
    required this.animationType,
    this.speedFactor = 1.0,
    this.exitAnimation = true,
    this.curve = Curves.easeOut,
    this.duration = const Duration(milliseconds: 500),
    this.animationDirection = AnimationDirection.left,
  });

  final int index;
  final Curve curve;
  final Widget child;
  final Duration duration;
  final bool exitAnimation;
  final double speedFactor;
  final AnimationType animationType;
  final AnimationDirection animationDirection;

  @override
  State<AnimatedListItem> createState() => _AnimatedListItemState();
}

class _AnimatedListItemState extends State<AnimatedListItem> {
  static final Set<int> _animatedIndices = {};
  late bool _shouldAnimateExit;

  @override
  void initState() {
    super.initState();
    _shouldAnimateExit = widget.exitAnimation;
  }

  @override
  Widget build(BuildContext context) {
    // Si ya se animó, retorna el elemento directamente
    if (!_shouldAnimateExit && _animatedIndices.contains(widget.index)) {
      return widget.child;
    }

    // Marca el índice como animado en entrada si no es de salida
    if (!_shouldAnimateExit) {
      _animatedIndices.add(widget.index);
    }

    return _buildAnimation(widget.animationType, widget.child, widget.index);
  }

  Widget _buildAnimation(AnimationType type, Widget child, int index) {
    switch (type) {
      case AnimationType.spiral:
        return SpiralAnimation(
          child: child,
          index: index,
          curve: widget.curve,
          duration: widget.duration,
          speedFactor: widget.speedFactor,
          direction: widget.animationDirection,
        );
      case AnimationType.flip:
        return FlipAnimation(
          child: child,
          index: index,
          curve: widget.curve,
          duration: widget.duration,
          speedFactor: widget.speedFactor,
          direction: widget.animationDirection,
        );
      case AnimationType.fade:
        return FadeAnimation(
          child: child,
          index: index,
          curve: widget.curve,
          duration: widget.duration,
          speedFactor: widget.speedFactor,
          direction: widget.animationDirection,
        );
      case AnimationType.scale:
        return ScaleAnimation(
          child: child,
          index: index,
          curve: widget.curve,
          duration: widget.duration,
          speedFactor: widget.speedFactor,
        );
      case AnimationType.explosion:
        return ExplosionAnimation(
          child: child,
          index: index,
          curve: widget.curve,
          duration: widget.duration,
          speedFactor: widget.speedFactor,
          direction: widget.animationDirection,
        );
      case AnimationType.circular:
        return CircularAnimation(
          child: child,
          index: index,
          curve: widget.curve,
          duration: widget.duration,
          speedFactor: widget.speedFactor,
          direction: widget.animationDirection,
        );
      default:
        return child;
    }
  }
}
