import 'package:building/feature/ResetPasswords/presentation/view_model/views/widgets/buttonReset.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../core/utiles/Assets_Data.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../login/presentation/view_model/views/widgets/textFieldEmail.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

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
                      width: screenWidth * 0.375,
                      height: screenHeight * 0.12,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03), // نسبة تقريبية لـ 24/800
                  Text(
                    'Forgot Password',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04, // نسبة تقريبية لـ 16/400
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.inter().fontFamily,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.0125),
                  Text(
                    'Enter your phone number below to\nreceive a 4-digit reset code',
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff9E9E9E),
                      fontFamily: GoogleFonts.inter().fontFamily,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.03125),
                  TextFieldEmail(),
                  SizedBox(height: screenHeight * 0.03375),
                  ButtonSendCode(),
                ],
              ),
            ),
            Positioned(
              top: screenHeight * 0.0625,
              left: screenWidth * 0.04,
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
