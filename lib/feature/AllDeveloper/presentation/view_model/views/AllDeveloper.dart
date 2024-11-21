import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utiles/constans.dart';
import 'Widgets/CustomPage.dart';


class AllDevelopers extends StatelessWidget {
  const AllDevelopers({Key? key}) : super(key: key);

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
          'All Developers',
          style: GoogleFonts.inter(
            color: Color(0xff2F2F2F),
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            height: 1.0,
            color: Colors.grey.shade300,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16 * screenHeight / 812, horizontal: 16 * screenWidth / 375),
          child: Column(
            children: [
              buildRow(
                context,
                screenHeight,
                screenWidth,
                'lib/Assets/Material/Screenshot 2024-07-06 002830.png',
                'Ora',
                '13 Compounds',
                '20 Properties',
                'lib/Assets/Material/Screenshot 2024-07-05 220235.png',
                'Mimary',
                '7 Compounds',
                '98 Properties',
              ),
              SizedBox(height: 16 * screenHeight / 812),
              buildRow(
                context,
                screenHeight,
                screenWidth,
                'lib/Assets/Material/Screenshot 2024-07-05 220419.png',
                'PALM HILLS',
                '41 Compounds',
                '731 Properties',
                'lib/Assets/Material/Screenshot 2024-07-05 220527.png',
                'ILCAZAR',
                '40 Compounds',
                '143 Properties',
              ),
              SizedBox(height: 16 * screenHeight / 812),
              buildRow(
                context,
                screenHeight,
                screenWidth,
                'lib/Assets/Material/Screenshot 2024-07-06 002830.png',
                'Ora',
                '13 Compounds',
                '20 Properties',
                'lib/Assets/Material/Screenshot 2024-07-05 220235.png',
                'Mimary',
                '7 Compounds',
                '98 Properties',
              ),
              SizedBox(height: 16 * screenHeight / 812),
              buildRow(
                context,
                screenHeight,
                screenWidth,
                'lib/Assets/Material/Screenshot 2024-07-05 220419.png',
                'PALM HILLS',
                '41 Compounds',
                '731 Properties',
                'lib/Assets/Material/Screenshot 2024-07-05 220419.png',
                'ILCAZAR',
                '40 Compounds',
                '143 Properties',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRow(
      BuildContext context,
      double screenHeight,
      double screenWidth,
      String imagePath1,
      String title1,
      String details1,
      String details2,
      String imagePath2,
      String title2,
      String details3,
      String details4,
      ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: buildMaterialContainer(
            context,
            screenHeight,
            screenWidth,
            imagePath1,
            title1,
            details1,
            details2,
            getPage(title1),
          ),
        ),
        SizedBox(width: 17 * screenWidth / 375),
        Expanded(
          child: buildMaterialContainer(
            context,
            screenHeight,
            screenWidth,
            imagePath2,
            title2,
            details3,
            details4,
            getPage(title2),
          ),
        ),
      ],
    );
  }

  Widget buildMaterialContainer(
      BuildContext context,
      double screenHeight,
      double screenWidth,
      String imagePath,
      String title,
      String details1,
      String details2,
      Widget targetPage) {

    double containerSize = (screenWidth - 48) / 2;
    double circleSize = screenWidth * 0.15;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => targetPage),
        );
      },
      child: Container(
        width: containerSize,
        height: containerSize * 1.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16 * screenHeight / 812),
          color: Colors.white,
          border: Border.all(color: Colors.grey.withOpacity(0.3)), // إضافة إطار خفيف
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: circleSize,
              height: circleSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // لون الظل للدائرة
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15 * screenHeight / 812), // مسافة بين الصورة والنص
              child: Column(
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      color: Color(0xff2F2F2F),
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4 * screenHeight / 812),
                  Text(
                    details1,
                    style: GoogleFonts.inter(
                        fontSize: 12.sp,
                        color: Color(0xff9E9E9E),
                        fontWeight: FontWeight.w600
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4 * screenHeight / 812),
                  Text(
                    details2,
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                        color: Color(0xff9E9E9E),
                      fontWeight: FontWeight.w600
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
Widget getPage(String title) {
  switch (title) {
    case 'Ora':
      return  CustomPage(title: 'Ora',imagePath: 'lib/Assets/Material/Screenshot 2024-07-06 002830.png',);
    case 'Mimary':
      return CustomPage(title: 'Mimary',imagePath: 'lib/Assets/Material/Screenshot 2024-07-05 220235.png',);
    case 'PALM HILLS':
      return CustomPage(title: 'PALM HILLS',imagePath: 'lib/Assets/Material/Screenshot 2024-07-05 220419.png',);
    case 'ILCAZAR':
      return CustomPage(title: 'IlCazar',imagePath: 'lib/Assets/Material/Screenshot 2024-07-05 220419.png',);
    default:
      return Container();
  }
}
