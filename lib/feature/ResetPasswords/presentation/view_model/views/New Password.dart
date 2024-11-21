import 'package:building/feature/ResetPasswords/presentation/view_model/views/widgets/ResetButton.dart';
import 'package:building/feature/ResetPasswords/presentation/view_model/views/widgets/textFieldConfirmPassword.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../core/utiles/Assets_Data.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../login/presentation/view_model/views/widgets/textFieldPassword.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
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
                    'Create new password',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04, // نسبة تقريبية لـ 16/400
                      color: Color(0xff2F2F2F),
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.inter().fontFamily,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.0125), // نسبة تقريبية لـ 10/800
                  Text(
                    'Your new password must be different\nfrom previous used passwords.',
                    style: TextStyle(
                      fontSize: screenWidth * 0.03, // نسبة تقريبية لـ 12/400
                      color: Color(0xff9E9E9E),
                      fontWeight: FontWeight.w500,
                      fontFamily: GoogleFonts.inter().fontFamily,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.025), // نسبة تقريبية لـ 20/800
                  TextFieldPassword(),
                  SizedBox(height: screenHeight * 0.015), // نسبة تقريبية لـ 12/800
                  ConfirmPassword(),
                  SizedBox(height: screenHeight * 0.04), // نسبة تقريبية لـ 32/800
                  ResetButton(),
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
