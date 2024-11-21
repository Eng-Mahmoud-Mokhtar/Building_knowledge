import 'package:building/feature/RealEstateFinance/presentation/view_model/views/Widget/ShowHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestSelling extends StatelessWidget {
  const BestSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Best selling',
              style: GoogleFonts.inter(
                color: Color(0xff2F2F2F),
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'See all',
                style: GoogleFonts.inter(
                  color: Color(0xff9E9E9E),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 8.h),
        ShowHome()
      ],
    );
  }
}
