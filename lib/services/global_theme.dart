import 'package:flutter/material.dart';
import 'package:mobile/utils/color_constants.dart';
import 'package:mobile/widgets/text_styles.dart';

ThemeData GlobalTheme() {
  return ThemeData(
    fontFamily: 'Manrope',
    buttonTheme: ButtonThemeData(
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: BorderSide(
          width: 1,
        ),
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      splashRadius: 0,
    ),
    scaffoldBackgroundColor: ColorConstants.slate[25],
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
          (states) => EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
        ),
        minimumSize: MaterialStateProperty.resolveWith<Size>(
          (states) => Size.zero,
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (states) {
            if (states.contains(MaterialState.hovered)) {
              return ColorConstants.flowerBlue[400];
            } else if (states.contains(MaterialState.pressed)) {
              return ColorConstants.flowerBlue[500];
            } else if (states.contains(MaterialState.disabled)) {
              return ColorConstants.slate[200];
            } else {
              return ColorConstants.flowerBlue[600];
            }
          },
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1.5,
          color: ColorConstants.slate[500]!,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 14,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      hintStyle: body5TextStyle(color: ColorConstants.slate[400]),
    ),
  );
}
