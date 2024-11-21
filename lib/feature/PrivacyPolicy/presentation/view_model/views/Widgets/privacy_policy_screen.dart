import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utiles/Assets_Data.dart';


class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}
late double screenWidth;
late double screenHeight;
class _PrivacyScreenState extends State<PrivacyScreen> {
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
          'Privacy Policy',
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset(
                AssetsData.Logo,
                width: screenWidth * 0.25,

              ),),
              SizedBox(height:30.h),
              Text(
                "Welcome to [Building knowing]. This Privacy Policy explains how we collect, use, and protect your personal information when you use our app.",
                style: GoogleFonts.inter(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height:16.h),
              Text(
                "Information We Collect",
                style: GoogleFonts.inter(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height:5.h),
              Text(
                "We use your information to deliver our services, enhance user experience, and send you relevant updates and promotions.",
                style: GoogleFonts.inter(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height:16.h),
              Text(
                "Information Sharing",
                style: GoogleFonts.inter(
                  color:Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height:5.h),
              Text(
                "We may share your information with trusted partners for service delivery or legal compliance purposes.",
                style: GoogleFonts.inter(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height:16.h),
              Text(
                "Data Security",
                style: GoogleFonts.inter(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height:5.h),
              Text(
                "We implement security measures to protect your information from unauthorized access or disclosure.",
                style: GoogleFonts.inter(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height:16.h),
              Text(
                "Your Choices",
                style: GoogleFonts.inter(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height:5.h),
              Text(
                "You can opt out of promotional communications and access/update your information through your account settings.",
                style: GoogleFonts.inter(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
