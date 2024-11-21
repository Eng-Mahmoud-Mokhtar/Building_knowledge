import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../core/utiles/Assets_Data.dart';
import 'button.dart';

class Congratulations extends StatelessWidget {
  const Congratulations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.0625),
                  Center(
                    child: Image.asset(
                      AssetsData.Logo,
                      width: screenWidth * 0.315,
                      height: screenHeight * 0.12,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.125),
                  Image.asset(
                    'lib/Assets/Group 16.png',
                    height: screenHeight * 0.24875,
                    width: screenWidth * 0.4825,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Text(
                    'Congratulations!',
                    style: GoogleFonts.inter(
                      fontSize: screenWidth * 0.045,
                      color: Color(0xff2F2F2F),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Text(
                    'Your password has been changed. \n successfully',
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: Color(0xff9E9E9E),
                      fontWeight: FontWeight.w500,
                      fontFamily: GoogleFonts.inter().fontFamily,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Button(),
                  SizedBox(height: screenHeight * 0.03),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
