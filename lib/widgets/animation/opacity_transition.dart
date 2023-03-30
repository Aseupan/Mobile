import 'package:flutter/material.dart';

class OpacityTransitionWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const OpacityTransitionWidget({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
  }) : super(key: key);

  @override
  State<OpacityTransitionWidget> createState() =>
      _OpacityTransitionWidgetState();
}

class _OpacityTransitionWidgetState extends State<OpacityTransitionWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _opacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_animationController);

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: widget.child,
    );
  }
}
