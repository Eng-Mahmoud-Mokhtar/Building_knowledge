import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Licenses/presentation/view_model/views/Widgets/Buttoms.dart';

class RealStateFinance extends StatelessWidget {
  const RealStateFinance({super.key});

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
          'Real Estate Financing',
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
        ),      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Finance Details',
                    style: GoogleFonts.inter(
                      color: Color(0xff2F2F2F),
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Text(
                    'Loan Type: Classification such as Mortgage, HomeClients Equity Loan, Construction Loan, etc',
                    style: GoogleFonts.inter(
                      color: Color(0xff2F2F2F),
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'Loan Amount: The amount of money being borrowed',
                    style: GoogleFonts.inter(
                      color: Color(0xff2F2F2F),
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'Interest Rate: The interest rate applicable to the loan',
                    style: GoogleFonts.inter(
                      color: Color(0xff2F2F2F),
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'Loan Term: The duration of the loan (e.g., 15 years, 30 years)',
                    style: GoogleFonts.inter(
                      color: Color(0xff2F2F2F),
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'Repayment Schedule: Monthly, quarterly, or annual payments',
                    style: GoogleFonts.inter(
                      color: Color(0xff2F2F2F),
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'Down Payment: The initial payment made when buying a property',
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
                    'Applicant Name: Full name of the person or entity applying for the loan',
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
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'Employment Information: Employer name, job title, and monthly income',
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
                    'Property Address: The address of the property being financed',
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
