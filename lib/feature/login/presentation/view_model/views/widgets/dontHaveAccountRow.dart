import 'package:building/core/utiles/constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../SignUp/presentation/viewModel/views/SignUp.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don’t have an account?',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: screenWidth * 0.03, // نسبة تقريبية لـ 12/400
            color: Colors.black87,
            fontFamily: GoogleFonts.inter().fontFamily,
          ),
        ),
        SizedBox(width: screenWidth * 0.0125), // نسبة تقريبية لـ 5/400
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUp()),
            );
          },
          child: Text(
            'Sign up',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: screenWidth * 0.03, // نسبة تقريبية لـ 12/400
              fontFamily: GoogleFonts.inter().fontFamily,
              color:KprimaryColor,
              decoration: TextDecoration.underline,
              decorationColor: KprimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
