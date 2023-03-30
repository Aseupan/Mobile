import 'package:flutter/material.dart';

class FadeInFromLeft extends StatefulWidget {
  final Widget child;
  final int delay;
  final Duration duration;

  const FadeInFromLeft(
      {super.key,
      required this.child,
      this.delay = 0,
      this.duration = const Duration(milliseconds: 500)});

  @override
  State<FadeInFromLeft> createState() => _FadeInFromLeftState();
}

class _FadeInFromLeftState extends State<FadeInFromLeft>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
      reverseDuration: widget.duration,
    );
    _animation = Tween<Offset>(
      begin: Offset(-1.0, 0),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    Future.delayed(Duration(milliseconds: widget.delay), () {
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: SlideTransition(
        position: _animation,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
