import 'package:flutter/material.dart';

class ColorConstants {
  static const primary = {
    100: Color(0xFFBBDEFB),
    200: Color(0xFF90CAF9),
    300: Color(0xFF64B5F6),
    400: Color(0xFF2196F3),
    500: Color(0xFF1E88E5),
    600: Color(0xFF1976D2),
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
    )
  };

  static const base = {
    100: Colors.black,
    00: Colors.white,
  };
}
