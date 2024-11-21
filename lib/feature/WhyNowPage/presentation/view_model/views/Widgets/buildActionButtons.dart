import 'dart:ui';
import 'package:flutter/cupertino.dart';

Widget buildActionButtons(double screenWidth) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      buildActionButton(screenWidth, 'lib/Assets/FeatureApartment/logos_whatsapp-icon.png', Color(0xff6cd46e)),
      SizedBox(width: screenWidth * 0.015),
      buildActionButton(screenWidth, 'lib/Assets/FeatureApartment/Vector (6).png', Color(0xffE6F7EF)), // اللون الأخضر
    ],
  );
}
Widget buildActionButton(double screenWidth, String iconPath, Color bgColor) {
  return GestureDetector(
    onTap: () {
    },
    child: Container(
      width: screenWidth * 0.1,
      height: screenWidth * 0.1,
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: AspectRatio(
          aspectRatio: 2,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Image.asset(iconPath),
          ),
        ),
      ),
    ),
  );
}
