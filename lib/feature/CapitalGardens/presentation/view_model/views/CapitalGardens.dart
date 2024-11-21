import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Search/presentation/view_model/views/Search.dart';
import 'Widget/CapitalBody.dart';
import 'Widget/ImageCard.dart';

class CapitalGardens extends StatelessWidget {
  final String imagePath;
  final String title;

  CapitalGardens({required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: GoogleFonts.inter(
            color: Color(0xff2F2F2F),
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 15.sp),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            height: 1.0,
            color: Colors.grey.shade300,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric( horizontal: screenWidth * 0.04,
                vertical: screenWidth * 0.02),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(screenWidth * 0.02),
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 1 , // Border width
                ),
              ),
              child: IconButton(
                icon: Image.asset(
                  'lib/Assets/new/magnifier_14120153.png',
                  width: screenWidth * 0.05,
                  height: screenWidth * 0.05,
                  fit: BoxFit.contain,
                  color: Color(0xff9E9E9E),
                ), onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Search(),
                  ),
                );
              },
              ),
            ),
          ),
        ],

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageCard(imagePath: imagePath,title: title),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CapitalBody(),
            ),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
