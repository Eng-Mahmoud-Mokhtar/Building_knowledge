import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../Buy/presentation/view_model/views/Buy.dart';
import '../../../../../Licenses/presentation/view_model/views/Licenses.dart';
import '../../../../../Materials/presentation/view_model/views/MaterialPage.dart';
import '../../../../../RealStateDetails/presentation/view_model/views/RealStateFinance.dart';
import '../../../../../RealStateTaxes/presentation/view_model/views/RealStateTaxes.dart';
import '../../../../../Rent/presentation/view_model/views/Rent.dart';

class CategoryServices extends StatefulWidget {
  const CategoryServices({super.key});

  @override
  _CategoryServicesState createState() => _CategoryServicesState();
}

class _CategoryServicesState extends State<CategoryServices> {
  Widget buildServiceItem(String imagePath, String text, Widget nextPage) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = MediaQuery.of(context).size.width;
        double containerWidth = screenWidth * 0.2;
        double containerHeight = screenWidth * 0.2;

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => nextPage),
            );
          },
          child: Column(
            children: [
              Container(
                height: containerHeight,
                width: containerWidth,
                decoration: BoxDecoration(
                  color: Color(0xffeef4f1),
                  borderRadius: BorderRadius.circular(8.0.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Image.asset(
                    imagePath,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              SizedBox(
                height: 40.h,
                child: Text(
                  text,
                  style: GoogleFonts.inter(
                    color: Color(0xff2F2F2F),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildServiceItem('lib/Assets/new/home.png', 'Buy', Buy()),
          SizedBox(width: 15.w),
          buildServiceItem('lib/Assets/new/real-estate.png', 'Rent', Rent()),
          SizedBox(width: 15.w),
          buildServiceItem('lib/Assets/images/house.png', 'Material', Material_Page()),
          SizedBox(width: 15.w),
          buildServiceItem('lib/Assets/new/degree-credential_16769832.png', 'Licenses', Licenses()),
          SizedBox(width: 15.w),
          buildServiceItem('lib/Assets/new/real-estate (1).png', 'Real Estate\nTaxes', RealStateTaxes()),
          SizedBox(width: 15.w),
          buildServiceItem('lib/Assets/new/revenue-growth_11726555.png', 'Real Estate\nFinancing', RealStateFinance()),
        ],
      ),
    );
  }
}
