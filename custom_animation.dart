// custom_animation.dart
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    // set home to the FadingScalingWidget
    home: FadingScalingWidget(),
  ));
}

class FadingScalingWidget extends StatefulWidget {
  @override
  _FadingScalingWidgetState createState() => _FadingScalingWidgetState();
}

class _FadingScalingWidgetState extends State<FadingScalingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    // _fadeAnimation fades the widget in and out
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    // _scaleAnimation scales the widget size
    _scaleAnimation = Tween<double>(begin: 0.5, end: 5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    // _rotateAnimation rotates the widget from 0 to 360 degrees
    _rotateAnimation = Tween<double>(begin: 0.0, end: 2 * pi).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // wrap the widget in an AnimatedBuilder
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            // return an Opacity widget with the _fadeAnimation value
            return Opacity(
              opacity: _fadeAnimation.value,
              child: Transform.scale(
                scale: _scaleAnimation.value,
                child: Transform.rotate(
                  angle: _rotateAnimation.value,
                  child: Container(
                    color: Colors.green,
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
