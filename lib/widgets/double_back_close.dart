import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DoubleBackToCloseApp extends StatefulWidget {
  final Widget child;

  const DoubleBackToCloseApp({super.key, required this.child});

  @override
  State<DoubleBackToCloseApp> createState() => _DoubleBackToCloseAppState();
}

class _DoubleBackToCloseAppState extends State<DoubleBackToCloseApp> {
  DateTime currentBackPressTime = DateTime.now();
  DateTime now = DateTime.now();

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "loh nda tau");
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: widget.child,
    );
  }
}
