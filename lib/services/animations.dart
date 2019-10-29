import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';

class FadeIn extends StatelessWidget {
  FadeIn({this.child, this.duration, this.delay});

  final Widget child;
  final int duration;
  final int delay;

  @override
  Widget build(BuildContext context) {
    return ControlledAnimation(
      delay: Duration(milliseconds: delay ?? 0),
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: duration ?? 500),
      builder: (context, opacity) => AnimatedOpacity(
        duration: Duration(milliseconds: duration ?? 500),
        opacity: opacity,
        child: child,
      ),
    );
  }
}

class FadeInWithScale extends StatelessWidget {
  FadeInWithScale({this.child, this.duration, this.delay});

  final Widget child;
  final double duration;
  final int delay;

  @override
  Widget build(BuildContext context) {
    return ControlledAnimation(
      playback: Playback.PLAY_FORWARD,
      delay: Duration(milliseconds: delay ?? 0),
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: duration ?? 500),
      builder: (context, zeroToOne) {
        return Transform.scale(
          scale: zeroToOne,
          child: AnimatedOpacity(
            duration: Duration(milliseconds: duration ?? 500),
            opacity: zeroToOne,
            child: child,
          ),
        );
      },
    );
  }
}

class FadeInWithTranslate extends StatelessWidget {
  FadeInWithTranslate(
      {this.child,
      this.duration,
      this.translateXStart,
      this.translateXEnd,
      this.translateYStart,
      this.translateYEnd,
      this.delay,
      this.opacityStart,
      this.opacityEnd,
      this.isX});

  final Widget child;
  final double translateXStart;
  final double translateXEnd;
  final double translateYStart;
  final double translateYEnd;
  final int duration;
  final int delay;
  final bool isX;
  final double opacityStart;
  final double opacityEnd;

  @override
  Widget build(BuildContext context) {
    final translateStart = isX ? translateXStart : translateYStart;
    final translateEnd = isX ? translateXEnd : translateYEnd;
    return ControlledAnimation(
      delay: Duration(milliseconds: delay ?? 0),
      tween: MultiTrackTween([
        Track("translate").add(
          Duration(milliseconds: duration ?? 500),
          Tween<double>(begin: translateStart, end: translateEnd),
        ),
        Track("opacity").add(
          Duration(milliseconds: duration ?? 500),
          Tween<double>(begin: opacityStart ?? 0.0, end: opacityEnd ?? 1.0),
        )
      ]),
      duration: Duration(milliseconds: duration ?? 500),
      builder: (context, animations) => Transform.translate(
        offset: Offset(isX ? animations['translate'] : 0,
            isX ? 0 : animations['translate']),
        child: AnimatedOpacity(
          duration: Duration(milliseconds: duration ?? 500),
          opacity: animations['opacity'],
          child: child,
        ),
      ),
    );
  }
}
