import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/utiles/constans.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'lib/Assets/pexels-oleksandr-p-7599735 1.png',
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: screenWidth * 0.70,
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(screenWidth * 0.06),
                  topRight: Radius.circular(screenWidth * 0.06),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: Column(
                  children: [
                    SizedBox(height: screenWidth * 0.06),
                    Text(
                      "Tailor Your Search",
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: Color(0xff2F2F2F),
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.inter().fontFamily,
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.03),
                    Text(
                      "Crafting Comprehensive Contracts to Secure Your Investments in Lands, Homes, and Construction Projects.",
                      style: TextStyle(
                          color: Color(0xff9E9E9E),
                        fontSize: screenWidth * 0.03,
                          fontWeight: FontWeight.w400,
                        fontFamily: GoogleFonts.inter().fontFamily,

                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
