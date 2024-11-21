import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildDropdownField({
  required String title,
  required String value,
  required List<String> items,
  required String hint,
  required ValueChanged<String?> onChanged,
}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      final mediaQuery = MediaQuery.of(context);
      final screenWidth = mediaQuery.size.width;
      final screenHeight = mediaQuery.size.height;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: screenWidth * 0.03,
              fontWeight: FontWeight.w500,
              color: Color(0xff2F2F2F),
            ),
          ),
          SizedBox(height: screenHeight * 0.01), // Equivalent to 7.h
          Container(
            height: screenWidth * 0.12,
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03), // Equivalent to 12.w
            decoration: BoxDecoration(
              color: Color(0xffFAFAFA),
              borderRadius: BorderRadius.circular(screenWidth * 0.02), // Equivalent to 8.r
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1.0,
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value == hint ? null : value,
                hint: Text(
                  hint,
                  style: GoogleFonts.inter(
                    fontSize: screenWidth * 0.03, // Equivalent to 12.sp
                    fontWeight: FontWeight.w400,
                    color: Color(0xff2F2F2F),
                  ),
                ),
                isExpanded: true,
                icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey.shade500),
                items: items.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: GoogleFonts.inter(
                        fontSize: screenWidth * 0.03, // Equivalent to 12.sp
                        fontWeight: FontWeight.w400,
                        color: Color(0xff2F2F2F),
                      ),
                    ),
                  );
                }).toList(),
                onChanged: onChanged,
                dropdownColor: Colors.white,
                menuMaxHeight: screenHeight * 0.25,
              ),
            ),
          ),
        ],
      );
    },
  );
}
