import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utiles/Assets_Data.dart';


class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}
late double screenWidth;
late double screenHeight;
class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
      screenWidth = MediaQuery.of(context).size.width;
      screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 15.sp),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: Text(
          'About Us',
          style: GoogleFonts.inter(
            color: Color(0xff2F2F2F),
            fontSize: 16.sp,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 16.w),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(child: Image.asset(
          AssetsData.Logo,
              width: screenWidth * 0.25,
            ),),
            SizedBox(height: 30.h,),
            Text(
              "About Company",
              style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 14.sp),
            ),
            SizedBox(height: 5.h,),
            Text(
              "Welcome to [Building Knowledge]. We're here to simplify your real estate journey. Our team offers personalized solutions and exceptional service to help you find your dream property. Contact us today to get started!",
              style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 12.sp),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20.h,),
            Text(
              "Our Mission",
              style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 14.sp),
            ),
            SizedBox(height: 5.h,),
            Text(
              "At [Building Knowledge], we're committed to simplifying the real estate process. Our mission is to empower individuals and families to find their perfect home or investment property by providing intuitive tools, expert guidance, and exceptional service. We strive to make the journey of buying, selling, or renting real estate as seamless and rewarding as possible for our users.",
              style: GoogleFonts.inter(fontWeight: FontWeight.w400, fontSize: 12.sp),
              textAlign: TextAlign.justify,
        
            ),
          ]),
        ),
      ),
    );
  }
}
