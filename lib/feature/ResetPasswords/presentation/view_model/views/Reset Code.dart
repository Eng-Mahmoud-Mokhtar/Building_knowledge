import 'package:building/feature/ResetPasswords/presentation/view_model/views/widgets/code.dart';
import 'package:building/feature/ResetPasswords/presentation/view_model/views/widgets/verifyButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../core/utiles/Assets_Data.dart';

class ResetCode extends StatelessWidget {
  const ResetCode({Key? key}) : super(key: key);

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
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04), // نسبة تقريبية لـ 16/400
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.0625), // نسبة تقريبية لـ 50/800
                  Center(
                    child: Image.asset(
                      AssetsData.Logo,
                      width: screenWidth * 0.375, // نسبة تقريبية لـ 150/400
                      height: screenHeight * 0.12, // نسبة تقريبية لـ 120/800
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03), // نسبة تقريبية لـ 24/800
                  Text(
                    'Reset Code',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04, // نسبة تقريبية لـ 16/400
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.inter().fontFamily,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.0125), // نسبة تقريبية لـ 10/800
                  Text(
                    'We have sent a verification code to\nkhalid@gmail.com. please check \nand enter the code below',
                    style: TextStyle(
                      fontSize: screenWidth * 0.03, // نسبة تقريبية لـ 12/400
                      color: Color(0xff9E9E9E),
                      fontWeight: FontWeight.w500,
                      fontFamily: GoogleFonts.inter().fontFamily,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.025), // نسبة تقريبية لـ 20/800
                  Code(),
                  SizedBox(height: screenHeight * 0.025), // نسبة تقريبية لـ 20/800
                  Text(
                    'Didn\'t receive the code?',
                    style: TextStyle(
                      fontSize: screenWidth * 0.03, // نسبة تقريبية لـ 12/400
                      color: Color(0xff9E9E9E),
                      fontWeight: FontWeight.w500,
                      fontFamily: GoogleFonts.inter().fontFamily,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Click here to',
                        style: TextStyle(
                          fontSize: screenWidth * 0.03, // نسبة تقريبية لـ 12/400
                          color: Color(0xff9E9E9E),
                          fontWeight: FontWeight.w500,
                          fontFamily: GoogleFonts.inter().fontFamily,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          ' Re-send code',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: screenWidth * 0.03, // نسبة تقريبية لـ 12/400
                            fontFamily: GoogleFonts.inter().fontFamily,
                            color: Color(0xff00AA5B),
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xff00AA5B),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.025), // نسبة تقريبية لـ 20/800
                  VerifyButton(),
                  SizedBox(height: screenHeight * 0.025), // نسبة تقريبية لـ 20/800
                ],
              ),
            ),
            Positioned(
              top: screenHeight * 0.0625, // نسبة تقريبية لـ 50/800
              left: screenWidth * 0.04, // نسبة تقريبية لـ 16/400
              child: IconButton(
                icon: Icon(Icons.arrow_back,color: Colors.black, size: screenWidth * 0.0375), // نسبة تقريبية لـ 15/400
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
