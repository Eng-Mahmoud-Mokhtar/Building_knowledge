import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildScrollableContainer(BuildContext context, String imagePath, String text1, String text2) {
  final screenWidth = MediaQuery.of(context).size.width;

  return Padding(
    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
    child: Container(
      width: screenWidth * 0.7,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(screenWidth * 0.04)),
                  child: Image.asset(
                    imagePath,
                    height: screenWidth * 0.14,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(width: screenWidth * 0.02),
                Expanded(
                  child: Text(
                    text1,
                    style: GoogleFonts.inter(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenWidth * 0.01),
            Text(
              text2,
              style: GoogleFonts.inter(
                fontSize: screenWidth * 0.035,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    ),
  );
}
