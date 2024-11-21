import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../WhyNowPage/presentation/view_model/views/WhyNowPage.dart';

class WhyBkWidget extends StatelessWidget {
  const WhyBkWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WhyBkPage()), // تأكد من تعريف الصفحة الثانية
        );
      },
      child: Container(
        width: double.infinity,
        height: screenHeight * 0.18,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(screenWidth * 0.04),

        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
          child: Image.asset(
            'lib/Assets/Screenshot 2024-10-20 185707.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
