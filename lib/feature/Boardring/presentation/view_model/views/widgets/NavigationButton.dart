import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../login/presentation/view_model/views/login.dart';

class NavigationButton extends StatelessWidget {
  final PageController controller;
  final bool onLastPage;

  const NavigationButton({
    Key? key,
    required this.controller,
    required this.onLastPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              if (onLastPage) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const Login();
                  }),
                );
              } else {
                controller.nextPage(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeIn,
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff00AA5B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(screenWidth * 0.015),
              ),
            ),
            child: SizedBox(
              width: screenWidth * 0.86, // 343/400 تقريبا 0.86
              height: screenWidth * 0.12, // 48/400 تقريبا 0.12
              child: Center(
                child: Text(
                  onLastPage ? 'Get started' : 'Next',
                  style: TextStyle(
                    fontSize: screenWidth * 0.035, // 14/400 تقريبا 0.035
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: screenWidth * 0.025), // 10/400 تقريبا 0.025
          if (!onLastPage)
            InkWell(
              onTap: () {
                controller.jumpToPage(2);
              },
              child: Container(
                width: screenWidth * 0.86,
                height: screenWidth * 0.12,
                alignment: Alignment.center,
                child: Text(
                  'Skip',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    color: const Color(0xff00AA5B),
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),
                ),
              ),
            ),
          if (onLastPage)
            SizedBox(
              width: screenWidth * 0.86,
              height: screenWidth * 0.12,
            ),
        ],
      ),
    );
  }
}
