import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Material(
            color: Colors.transparent,
            child: Divider(
              color: Color(0xff1A2225),
              endIndent: screenWidth * 0.0025, // نسبة تقريبية لـ 1/400
              indent: screenWidth * 0.15, // نسبة تقريبية لـ 60/400
              thickness: screenHeight * 0.00125, // نسبة تقريبية لـ 1/800
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025), // نسبة تقريبية لـ 10/400
          child: Text(
            'Or Login With',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: screenWidth * 0.03, // نسبة تقريبية لـ 12/400
              color: Color(0xff00AA5B),
              fontFamily: GoogleFonts.inter().fontFamily,
            ),
          ),
        ),
        Expanded(
          child: Material(
            color: Colors.transparent,
            child: Divider(
              color: Color(0xff1A2225),
              endIndent: screenWidth * 0.15, // نسبة تقريبية لـ 60/400
              indent: screenWidth * 0.0025, // نسبة تقريبية لـ 1/400
              thickness: screenHeight * 0.00125, // نسبة تقريبية لـ 1/800
            ),
          ),
        ),
      ],
    );
  }
}
