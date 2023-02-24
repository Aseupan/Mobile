import 'package:flutter/material.dart';

class FadeOutToRight extends StatelessWidget {
  final Widget child;
  final double opacity;

  const FadeOutToRight({
    Key? key,
    required this.child,
    this.opacity = 0.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: child),
        Positioned.fill(
          child: ClipRect(
            child: OverflowBox(
              alignment: Alignment.centerRight,
              maxWidth: double.infinity,
              child: Opacity(
                opacity: opacity,
                child: Container(
                  color: Colors.black,
                  width: 100, // Adjust this value as needed
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
