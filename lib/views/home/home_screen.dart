import 'package:flutter/material.dart';
import 'package:mobile/views/home/layout/backdrop_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: BackdropHome(),
      body: Stack(
        children: [
          BackdropHome(),
          // SingleChildScrollView(),
        ],
      ),
    );
  }
}
