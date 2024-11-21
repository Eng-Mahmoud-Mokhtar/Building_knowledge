import 'package:building/core/utiles/constans.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Widgets/HeaderPage.dart';
import 'Widgets/buildPropertiesCard.dart';



class WhyBkPage extends StatelessWidget {
  const WhyBkPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: screenWidth * 0.04),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'BK',
          style: GoogleFonts.inter(
            color: Color(0xff2F2F2F),
            fontSize: screenWidth * 0.04,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            height: 1.0,
            color: Colors.grey.shade300,
          ),
        ),      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                HeaderPage(),
                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'BK Properties',
                        style: GoogleFonts.inter(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(screenWidth * 0.02),
                            decoration: BoxDecoration(
                              color: KprimaryColor,
                              borderRadius: BorderRadius.circular(screenWidth * 0.02),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  'lib/Assets/FeatureApartment/icons8-filter-32.png',
                                  fit: BoxFit.contain,
                                  color: Colors.white,
                                  scale: 1.5,
                                ),
                                SizedBox(width: screenWidth * 0.02),
                                Text(
                                  'Filter',
                                  style: GoogleFonts.inter(
                                    fontSize: screenWidth * 0.04,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Container(
                            padding: EdgeInsets.all(screenWidth * 0.03),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(screenWidth * 0.02),
                            ),
                            child: Icon(Icons.filter_list, size: screenWidth * 0.05),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey.shade200,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenWidth * 0.01),
                    child: Column(
                      children: [
                        ...properties.map((property) => buildPropertiesCard(context, property)).toList(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.04,
            left: screenWidth * 0.10,
            right: screenWidth * 0.10,
            child: ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffF08200),
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.08),
                ),
              ),
              child: Text(
                'Want to finance a unit of your choice ?',
                style: GoogleFonts.inter(
                  fontSize: screenWidth * 0.035,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


