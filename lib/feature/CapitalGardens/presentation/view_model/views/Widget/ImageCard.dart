import 'dart:async';
import 'package:building/core/utiles/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageCard extends StatefulWidget {
  final String imagePath;
  final String title;

  const ImageCard({required this.imagePath,required this.title});

  @override
  _ImageCardState createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              child: Container(
                height: screenWidth * 0.50,
                child: PageView(
                  controller: _pageController,
                  children: [
                    buildImage('lib/Assets/Building/3d-rendering-house-model (1).jpg'),
                    buildImage('lib/Assets/Building/avenue-with-green-trees.jpg'),
                    buildImage('lib/Assets/Building/urban-traffic-with-cityscape.jpg'),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 16.h,
              left: 16.w,
              child: buildFixedContent(screenWidth),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        SmoothPageIndicator(
          controller: _pageController,
          count: 3,
          effect: WormEffect(
            dotHeight: 4.0.h,
            dotWidth: 24.0.w,
            activeDotColor: KprimaryColor,
            dotColor: Color(0xffE9E9E9),
          ),
        ),
        SizedBox(height: 8.h),
      ],
    );
  }

  Widget buildFixedContent(double screenWidth) {
    return Row(
      children: [
        Container(
          width: screenWidth * 0.13,
          height: screenWidth * 0.13,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(widget.imagePath),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.25), // زيادة وضوح اللون
                spreadRadius: 1.5, // درجة انتشار الظل
                blurRadius: 12, // تكبير التدرج للظل
                offset: Offset(0, -2), // الظل من الأعلى
              ),
              BoxShadow(
                color: Colors.white.withOpacity(0.25),
                spreadRadius: 1.5,
                blurRadius: 12,
                offset: Offset(0, 2), // الظل من الأسفل
              ),
              BoxShadow(
                color: Colors.white.withOpacity(0.25),
                spreadRadius: 1.5,
                blurRadius: 12,
                offset: Offset(-2, 0), // الظل من اليسار
              ),
              BoxShadow(
                color: Colors.white.withOpacity(0.25),
                spreadRadius: 1.5,
                blurRadius: 12,
                offset: Offset(2, 0), // الظل من اليمين
              ),
            ],
          ),
        ),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.title} in 6th of OctoberCity ',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              'Start Price from 3.000.000',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),

          ],
        ),
      ],
    );
  }

  Widget buildImage(String assetPath) {
    return ClipRRect(
      child: LayoutBuilder(
        builder: (context, constraints) {
          double width = MediaQuery.of(context).size.width;
          double height = width * 0.5;

          return Stack(
            children: [
              Image.asset(
                assetPath,
                fit: BoxFit.cover,
                width: width,
                height: height,
              ),
              Container(
                width: width,
                height: height,
                color: Colors.black.withOpacity(0.5),
              ),
            ],
          );
        },
      ),
    );
  }
}
