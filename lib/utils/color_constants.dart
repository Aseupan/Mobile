import 'package:flutter/material.dart';

class ColorConstants {
  static const primary = {
    100: Color(0xFFECF5FD),
    200: Color(0xFFDAECFC),
    300: Color(0xFFB4D8F8),
    400: Color(0xFF8FC5F5),
    500: Color(0xFF69B1F1),
    600: Color(0xFF449EEE),
    700: Color(0xFF367EBE),
    800: Color(0xFF295F8F),
    900: Color(0xFF1B3F5F),
  };

  static const slate = {
    25: Color(0xFFF9FAFB),
    50: Color(0xFFF0F3F9),
    100: Color(0xFFE9EFF7),
    200: Color(0xFFD7DFE9),
    300: Color(0xFFAFBACA),
    400: Color(0xFF8897AE),
    500: Color(0xFF5E718D),
    600: Color(0xFF455468),
    700: Color(0xFF3D4A5C),
    800: Color(0xFF2D3643),
    900: Color(0xFF1C222B),
  };
  static const secondary = {
    100: Color(0xFFFFFDED),
    200: Color(0xFFFFFBDC),
    300: Color(0xFFFFF6B8),
    400: Color(0xFFFFF295),
    500: Color(0xFFFFED71),
    600: Color(0xFFFFE94E),
    700: Color(0xFFCCBA3E),
    800: Color(0xFF998C2F),
    900: Color(0xFF665D1F),
  };
  static const flowerBlue = {
    100: Color(0xFFECF5FD),
    200: Color(0xFFDAECFC),
    300: Color(0xFFB4D8F8),
    400: Color(0xFF8FC5F5),
    500: Color(0xFF69B1F1),
    600: Color(0xFF449EEE),
    700: Color(0xFF367EBE),
    800: Color(0xFF295F8F),
    900: Color(0xFF1B3F5F),
    1000: Color(0xFF0E2030),
  };

  static const gradient = {
    'blue1': LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xff449EEE),
        Color(0xff8FC5F5),
      ],
      stops: [
        0.0,
        1.0,
      ],
      transform: GradientRotation(135 * 3.141592 / 180),
    ),
    'blue2': LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xff449EEE),
        Color(0xff8FC5F5),
      ],
      stops: [
        0.0,
        1.0,
      ],
      transform: GradientRotation(11.45 * 3.141592 / 180),
    ),
    3: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFF449EEE), Color(0xFF8FC5F5)],
      stops: [0.4107, 1.0],
      tileMode: TileMode.clamp,
      transform: GradientRotation(55.13 * 3.14159 / 180.0),
    ),
    'white': LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.2126, 0.9539],
      colors: [
        Color(0xFFE9EFF7),
        Color(0xFFFFFFFF),
      ],
      transform: GradientRotation(308.74 * (3.14159 / 180)),
    ),
    'strong': LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.0268, 0.999],
      colors: [
        Color(0xFF299AFE),
        Color(0xFF7CFFFF),
      ],
      transform: GradientRotation(356.09 * (3.14159 / 180)),
    ),
  };

  static const base = {
    100: Colors.black,
    '00h': Colors.white,
  };
}
