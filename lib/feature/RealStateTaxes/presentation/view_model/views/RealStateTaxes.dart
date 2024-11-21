import 'package:building/feature/Licenses/presentation/view_model/views/Widgets/Buttoms.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RealStateTaxes extends StatelessWidget {
  const RealStateTaxes({super.key});

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
          'Real State Taxes',
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
                    'Property Details',
                    style: GoogleFonts.inter(
                      color: Color(0xff2F2F2F),
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Text(
                    'Property Value: The assessed or market value of the property.',
                    style: GoogleFonts.inter(
                      color: Color(0xff2F2F2F),
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'Location: The address, city, and governorate of the property.',
                    style: GoogleFonts.inter(
                      color: Color(0xff2F2F2F),
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'Property Type: Classification such as Residential, Commercial, Industrial, Agricultural, or Vacant Land.',
                    style: GoogleFonts.inter(
                      color: Color(0xff2F2F2F),
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'Square Meters: Total area of the property in square meters.',
                    style: GoogleFonts.inter(
                      color: Color(0xff2F2F2F),
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'Usage: Purpose of the property (e.g., primary residence, rental, commercial use).',
                    style: GoogleFonts.inter(
                      color: Color(0xff2F2F2F),
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'Tax Information',
                    style: GoogleFonts.inter(
                      color: Color(0xff2F2F2F),
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Text(
                    'Tax Rate: The local property tax rate, which may vary by governorate.',
                    style: GoogleFonts.inter(
                      color: Color(0xff2F2F2F),
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'Additional Fees: Any other local fees or special assessments.',
                    style: GoogleFonts.inter(
                      color: Color(0xff2F2F2F),
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'Exemptions/Deductions',
                    style: GoogleFonts.inter(
                      color: Color(0xff2F2F2F),
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Text(
                    'Primary Residence Exemption',
                    style: GoogleFonts.inter(
                      color: Color(0xff2F2F2F),
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'Agricultural Land Exemption',
                    style: GoogleFonts.inter(
                      color: Color(0xff2F2F2F),
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'Historical Property Exemption',
                    style: GoogleFonts.inter(
                      color: Color(0xff2F2F2F),
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'Other local exemptions or deductions',
                    style: GoogleFonts.inter(
                      color: Color(0xff2F2F2F),
                      fontSize: screenWidth * 0.03,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.08),
                ],
              ),
            ),
          ),
          Buttoms()
        ],
      ),
    );
  }
}
