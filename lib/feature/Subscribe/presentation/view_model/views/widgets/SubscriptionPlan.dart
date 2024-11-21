import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/utiles/constans.dart';
import '../../../../../../core/utiles/Assets_Data.dart';
import '../payment_screen.dart';
class SubscriptionPlan extends StatelessWidget {
  final double screenWidth;
  final String planName;
  final String price;
  final String adCount;
  final List<String> features;

  const SubscriptionPlan({
    Key? key,
    required this.screenWidth,
    required this.planName,
    required this.price,
    required this.adCount,
    required this.features,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.90,
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenHeight * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: KprimaryColor, width: 2),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(5, 5),
            blurRadius: 25,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                Image.asset(
                  AssetsData.Logo,
                  width: screenWidth * 0.15,
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  planName,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: screenWidth * 0.035,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                Text(
                  adCount,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: screenWidth * 0.03,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: features
                .map((feature) => Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.005),
              child: Text(
                feature,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: screenWidth * 0.03,
                ),
              ),
            ))
                .toList(),
          ),
          SizedBox(height: screenHeight * 0.015),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                price,
                style: GoogleFonts.inter(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              SizedBox(width: screenWidth * 0.02),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentScreen()),
                  );
                },
                child: Container(
                  width: screenWidth * 0.4,
                  height: screenWidth * 0.12,
                  decoration: BoxDecoration(
                    color: KprimaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "Subscribe Now",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: screenWidth * 0.035,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
