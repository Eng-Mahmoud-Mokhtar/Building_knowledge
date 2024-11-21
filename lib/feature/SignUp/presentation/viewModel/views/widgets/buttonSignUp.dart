import 'package:building/feature/login/presentation/view_model/views/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ButtonSignUp extends StatelessWidget {
  const ButtonSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff00AA5B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),child: SizedBox(
      height: screenWidth * 0.12,
      child: Center(
        child: Text(
          'Create account',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: screenWidth * 0.035,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontFamily: GoogleFonts.inter().fontFamily,
          ),
        ),
      ),
    ),
    );
  }
}
