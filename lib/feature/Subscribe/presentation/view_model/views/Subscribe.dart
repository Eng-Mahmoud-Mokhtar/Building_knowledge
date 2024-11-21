import 'package:building/feature/AddProperty/presentation/view_model/view/CreateProperty.dart';
import 'package:building/feature/Post/presentation/view_model/view/Widgets/Post.dart';
import 'package:building/feature/Subscribe/presentation/view_model/views/widgets/CustomSwitch.dart';
import 'package:building/feature/Subscribe/presentation/view_model/views/widgets/SubscriptionPlan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../../../core/utiles/Assets_Data.dart';
class Subscribe extends StatefulWidget {
  const Subscribe({Key? key}) : super(key: key);
  @override
  _SubscribeState createState() => _SubscribeState();
}
class _SubscribeState extends State<Subscribe> {
  bool isMonthly = false;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
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
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: screenHeight,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.05,horizontal: screenWidth * 0.04),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    AssetsData.Logo,
                    width: screenWidth * 0.15,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Center(
                  child: Text(
                    "Choose Your Perfect Ad Package",
                    style: GoogleFonts.inter(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Monthly",
                        style: GoogleFonts.inter(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      CustomSwitch(
                        value: isMonthly,
                        onChanged: (bool val) {
                          setState(() {
                            isMonthly = val;
                          });
                        },
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Text(
                        "Yearly",
                        style: GoogleFonts.inter(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                SubscriptionPlan(
                  screenWidth: screenWidth,
                  planName: "Basic Package",
                  price: isMonthly ? "500 EGP" : "50 EGP",
                  adCount: isMonthly ? "60 Ads" : "5 Ads",
                  features: isMonthly
                      ? [
                    "Feature 1: Premium Listing Placement",
                    "Feature 2: Highlighted Ads",
                    "Feature 3: Basic Analytics",
                    "Feature 4: Priority Support",
                    "Feature 5: Featured Placement"
                  ]
                      : [
                    "Feature 1: Premium Listing Placement",
                    "Feature 2: Highlighted Ads",
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                SubscriptionPlan(
                  screenWidth: screenWidth,
                  planName: "Advanced Package",
                  price: isMonthly ? "100 EGP" : "1000 EGP",
                  adCount: isMonthly ? "15 Ads" : "180 Ads",
                  features: isMonthly
                      ? [
                    "Feature 1: Top Placement in Search Results",
                    "Feature 2: Enhanced Ad Visibility",
                    "Feature 3: Advanced Analytics",
                    "Feature 4: Priority Support",
                    "Feature 5: Custom Reporting"
                  ] : [
                    "Feature 1: Top Placement in Search Results",
                    "Feature 2: Enhanced Ad Visibility",
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                SubscriptionPlan(
                  screenWidth: screenWidth,
                  planName: "Pro Package",
                  price: isMonthly ? "200 EGP" : "2000 EGP",
                  adCount: isMonthly ? "30 Ads" : "360 Ads",
                  features: isMonthly
                      ? [
                    "Feature 1: Premium Placement with Spotlight",
                    "Feature 2: Unlimited Ad Visibility",
                    "Feature 3: Comprehensive Analytics",
                    "Feature 4: Dedicated Account Manager",
                    "Feature 5: Custom Advertising Solutions"
                  ]: [
                    "Feature 1: Premium Placement with Spotlight",
                    "Feature 2: Unlimited Ad Visibility",
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not now',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: screenWidth * 0.03,
                        color: Colors.black87,
                        fontFamily: GoogleFonts.inter().fontFamily,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.0125),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Post()),
                        );
                      },
                      child: Text(
                        'Try free',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: screenWidth * 0.03,
                          fontFamily: GoogleFonts.inter().fontFamily,
                          color: Color(0xff00AA5B),
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xff00AA5B),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


