import 'package:building/core/utiles/constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../login/presentation/view_model/views/login.dart';
class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account ?',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: screenWidth * 0.03,
            color: Colors.black87,
            fontFamily: GoogleFonts.inter().fontFamily,
          ),
        ),
        SizedBox(width: screenWidth * 0.0125),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
          },
          child: Text(
            'Sign in',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: screenWidth * 0.03,
                fontFamily: GoogleFonts.inter().fontFamily,
                color: KprimaryColor,
                decoration: TextDecoration.underline,
                decorationColor: KprimaryColor
            ),
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
