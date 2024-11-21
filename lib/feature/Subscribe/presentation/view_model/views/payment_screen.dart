import 'package:building/feature/Post/presentation/view_model/view/Widgets/Post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:building/core/utiles/constans.dart';
import '../../../../../core/utiles/Assets_Data.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _selectedPaymentMethodIndex = -1;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
          'Subscription',
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
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  AssetsData.Logo,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.25,
                ),
              ),
              SizedBox(height: 40.h),
              Text(
                "Payment Method",
                style: GoogleFonts.inter(
                  color: Colors.black87,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                "Choose a payment method",
                style: GoogleFonts.inter(
                  color: Color(0xff9E9E9E),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 16.h),
              _buildPaymentContainer(
                pathImage: "lib/Assets/images/Mastercard.png",
                title: "Credit Card",
                index: 0,
              ),
              SizedBox(height: 16.h),
              _buildPaymentContainer(
                pathImage: "lib/Assets/images/PayPal.png",
                title: "PayPal",
                index: 1,
              ),
              SizedBox(height: 16.h),
              _buildPaymentContainer(
                pathImage: "lib/Assets/images/Mastercard.png",
                title: "Credit Card",
                index: 2,
              ),
              SizedBox(height: 40.h),
              InkWell(
                onTap: _selectedPaymentMethodIndex == -1 ? null : () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      Future.delayed(Duration(seconds: 4), () {
                        Navigator.of(context).pop();
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Row(
                                children: [
                                  Icon(Icons.check_circle, color: Colors.green),
                                  SizedBox(width: 10.w),
                                  Text(
                                    'Payment successful!',
                                    style: GoogleFonts.inter(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Your subscription has been placed. We\'ll send you an email with your subscription details.',
                                    style: GoogleFonts.inter(
                                      color: Color(0xff9E9E9E),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                  Container(
                                    width: double.infinity,
                                    height: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.12, child: Center(
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Post()),
                                        );
                                      },
                                      child: Text(
                                        "Done",
                                        style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      color: Color.fromRGBO(0, 170, 91, 1),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          offset: Offset(0, 4.h),
                                          blurRadius: 25.w,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      });
                      return AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                SpinKitCircle(
                                  color: Colors.green,
                                  size: screenWidth * 0.06,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  'Payment Processing',
                                  style: GoogleFonts.inter(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600,
                                    fontSize: screenWidth * 0.04,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              'Please wait while we process the payment from your bank account.',
                              style: GoogleFonts.inter(
                                color: Color(0xff9E9E9E),
                                fontWeight: FontWeight.w500,
                                fontSize: screenWidth * 0.04, // نسبة العرض
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Container(
                              height: 20.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                border: Border.all(
                                  color: KprimaryColor,
                                ),
                              ),
                              child: LinearProgressIndicator(
                                value: 0.5,
                                minHeight: 5.h,
                                backgroundColor: Colors.transparent,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    KprimaryColor),
                                semanticsLabel: 'Loading', // Accessibility label
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  height: screenWidth * 0.12,
                  child: Center(
                    child: Text(
                      "Next",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: _selectedPaymentMethodIndex == -1
                        ? Colors.grey
                        : KprimaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset(0, 4.h),
                        blurRadius: 25.w,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentContainer(
      {required String pathImage, required String title, required int index}) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerHeight = screenWidth * 0.2;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPaymentMethodIndex = index;
        });
      },
      child: Container(
        width: screenWidth * 0.9,
        height: containerHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: _selectedPaymentMethodIndex == index ? KprimaryColor : Colors.white,
          ),
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0, 4.h),
              blurRadius: 10.r,
              spreadRadius: 3.r,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribute space between items
            children: [
              Row(
                children: [
                  Image.asset(
                    pathImage,
                    width: 40.w,
                    height: 40.h,
                  ),
                  SizedBox(width: 16.w),
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      color: _selectedPaymentMethodIndex == index ? KprimaryColor : Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_outlined,
                color: _selectedPaymentMethodIndex == index ? KprimaryColor : Color(0xff9E9E9E),
                size: screenWidth * 0.06,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
