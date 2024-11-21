import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DotsIndicator extends StatelessWidget {
  final double currentPage;
  final int totalDots;

  const DotsIndicator({
    Key? key,
    required this.currentPage,
    required this.totalDots,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalDots,
            (index) => buildDot(index),
      ),
    );
  }

  Widget buildDot(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      width: 32.w,
      height: 4.h,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(6.w),
        color: currentPage == index
            ? const Color(0xff00AA5B)
            : const Color(0xffE9E9E9),
      ),
    );
  }
}
