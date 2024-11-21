import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Reset Code.dart';
class ButtonSendCode extends StatelessWidget {
  const ButtonSendCode({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResetCode()),
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
                'Send Code',
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
          ),
        ],
    );
  }
}
