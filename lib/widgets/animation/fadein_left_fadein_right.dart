import 'package:flutter/material.dart';

class FadeInLeftFadeOutRight extends StatefulWidget {
  final Widget child;
  final int duration;

  const FadeInLeftFadeOutRight(
      {super.key, required this.child, required this.duration});

  @override
  State<FadeInLeftFadeOutRight> createState() => _FadeInLeftFadeOutRightState();
}

class _FadeInLeftFadeOutRightState extends State<FadeInLeftFadeOutRight>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: widget.duration), vsync: this);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(1, 0))
        .animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _controller,
        child: widget.child,
      ),
    );
  }
}
