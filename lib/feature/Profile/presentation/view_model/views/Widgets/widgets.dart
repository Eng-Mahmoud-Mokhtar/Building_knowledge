import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildProfileButton({
  required BuildContext context,
  required String label,
  required String iconPath,
  required VoidCallback onPressed,
}) {
  double screenWidth = MediaQuery.of(context).size.width;
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      width: double.infinity,
      height: screenWidth * 0.14,
      decoration: BoxDecoration(
        color:Color(0xffF9F9F9),
        borderRadius: BorderRadius.circular(screenWidth * 0.02),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.03),
        child: Row(
          children: [
            Image(
              image: AssetImage(iconPath),
              width: screenWidth * 0.06,
              height: screenWidth * 0.06,
              fit: BoxFit.contain,
            ),
            SizedBox(width: screenWidth * 0.03),
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: screenWidth * 0.04, color: Color(0xff2F2F2F)),
          ],
        ),
      ),
    ),
  );
}

