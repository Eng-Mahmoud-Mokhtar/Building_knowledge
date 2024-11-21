import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildCompoundCard(
    BuildContext context, {
      required String title,
      required String location,
      required String price,
      required String imagePath,
      required Widget destinationPage,
    }) {
  double screenWidth = MediaQuery.of(context).size.width;

  return Padding(
    padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
    child: GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => destinationPage),
        );
      },
      child: Container(
        width: screenWidth,
        height: screenWidth * 0.25,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: screenWidth * 0.26,
              height: screenWidth * 0.5,
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Color(0xff2F2F2F),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      location,
                      style: TextStyle(
                        color: Color(0xff9E9E9E),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      price,
                      style: TextStyle(
                        color: Color(0xffF08200),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 8.0.w),
                child: Icon(Icons.arrow_forward_ios, color: Color(0xff2F2F2F), size: 16.sp),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
