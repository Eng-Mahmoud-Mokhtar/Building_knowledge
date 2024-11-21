import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Widgets/Buttoms.dart';

class Licenses extends StatelessWidget {
  const Licenses({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: screenWidth * 0.04),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: Text(
          'Licenses',
          style: GoogleFonts.inter(
            color: Color(0xff2F2F2F),
            fontSize: screenWidth * 0.04,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0), // تحديد سمك الخط
          child: Container(
            height: 1.0,
            color: Colors.grey.shade300,
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'License Details',
                    style: GoogleFonts.inter(
                      color: Color(0xff2F2F2F),
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Text(
                    'License Type: Classification such as Residential Construction, Commercial Construction, Renovation, Demolition, etc',
                    style: GoogleFonts.inter(
                      color: Color(0xff2F2F2F),
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'Property Address: The address of the property for which the license is being issued',
                    style: GoogleFonts.inter(
                      color: Color(0xff2F2F2F),
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'License Number: Unique identification number for the license',
                    style: GoogleFonts.inter(
                      color: Color(0xff2F2F2F),
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'Issuing Authority: Name of the authority or municipality issuing the license',
                    style: GoogleFonts.inter(
                      color: Color(0xff2F2F2F),
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'Issue Date: The date when the license was issued',
                    style: GoogleFonts.inter(
                      color: Color(0xff2F2F2F),
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'Expiration Date: The date when the license will expire',
                    style: GoogleFonts.inter(
                      color: Color(0xff2F2F2F),
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'Applicant Information',
                    style: GoogleFonts.inter(
                      color: Color(0xff2F2F2F),
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Text(
                    'Applicant Name: Full name of the person or entity applying for the license',
                    style: GoogleFonts.inter(
                      color: Color(0xff2F2F2F),
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'National ID Number: National identification number of the applicant',
                    style: GoogleFonts.inter(
                      color: Color(0xff2F2F2F),
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'Contact Information: Email address and phone number of the applicant',
                    style: GoogleFonts.inter(
                      color: Color(0xff2F2F2F),
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'Property Information',
                    style: GoogleFonts.inter(
                      color: Color(0xff2F2F2F),
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Text(
                    'Property Type: Classification such as Residential, Commercial, Industrial, Agricultural, etc',
                    style: GoogleFonts.inter(
                      color: Color(0xff2F2F2F),
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'Property Size: Total area of the property in square meters',
                    style: GoogleFonts.inter(
                      color: Color(0xff2F2F2F),
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.06),
                ],
              ),
            ),
          ),
          Buttoms(),
        ],
      ),
    );
  }
}
