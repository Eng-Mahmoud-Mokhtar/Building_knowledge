import 'package:building/core/utiles/constans.dart';
import 'package:flutter/cupertino.dart';

class FaceGoogleApple extends StatelessWidget {
  const FaceGoogleApple({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: screenWidth * 0.12,
            height: screenWidth * 0.12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenWidth * 0.015),
              border: Border.all(
                color: KprimaryColor,
              ),
            ),
            child: FractionallySizedBox(
              widthFactor: 0.50,
              heightFactor: 0.50,
              child: Image.asset(
                'lib/Assets/Facebook-icon.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        SizedBox(width: screenWidth * 0.06),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: screenWidth * 0.12,
            height: screenWidth * 0.12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenWidth * 0.015),
              border: Border.all(
                color: KprimaryColor,
              ),
            ),
            child: FractionallySizedBox(
              widthFactor: 0.50,
              heightFactor: 0.50,
              child: Image.asset(
                'lib/Assets/Google-icon.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        SizedBox(width: screenWidth * 0.06),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: screenWidth * 0.12,
            height: screenWidth * 0.12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(screenWidth * 0.015),
              border: Border.all(
                color: KprimaryColor,
              ),
            ),
            child: FractionallySizedBox(
              widthFactor: 0.50,
              heightFactor: 0.50,
              child: Image.asset(
                'lib/Assets/Apple-icon.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
