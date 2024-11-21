import 'package:building/core/utiles/constans.dart';
import 'package:building/feature/AllDeveloper/presentation/view_model/views/AllDeveloper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'CustomPage.dart';

class Brands extends StatelessWidget {
  const Brands({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomPage(title: 'Ora',imagePath: 'lib/Assets/images/Screenshot 2024-07-14 214738.png',)),
              );
            },
            child: ImageContainer(imagePath: 'lib/Assets/images/Screenshot 2024-07-14 214738.png'),
          ),
          SizedBox(width: 12.w),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomPage(title: 'Mimary',imagePath: 'lib/Assets/Material/Screenshot 2024-07-05 220235.png',)),
              );
            },
            child: ImageContainer(imagePath: 'lib/Assets/Material/Screenshot 2024-07-05 220235.png'),
          ),
          SizedBox(width: 12.w),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomPage(title: 'PALM HILLS',imagePath: 'lib/Assets/Material/Screenshot 2024-07-05 220419.png',)),
              );
            },
            child: ImageContainer(imagePath: 'lib/Assets/Material/Screenshot 2024-07-05 220419.png'),
          ),
          SizedBox(width: 12.w),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomPage(title: 'IlCazar',imagePath: 'lib/Assets/Material/Screenshot 2024-07-05 220419.png',)),
              );
            },
            child: ImageContainer(imagePath: 'lib/Assets/Material/Screenshot 2024-07-05 220527.png'),
          ),
          SizedBox(width: 12.w),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomPage(title: 'Ora',imagePath: 'lib/Assets/images/Screenshot 2024-07-14 214738.png',)),
              );
            },
            child: ImageContainer(imagePath: 'lib/Assets/images/Screenshot 2024-07-14 214738.png'),
          ),
          SizedBox(width: 12.w),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomPage(title: 'Mimary',imagePath: 'lib/Assets/Material/Screenshot 2024-07-05 220235.png',)),
              );
            },
            child: ImageContainer(imagePath: 'lib/Assets/Material/Screenshot 2024-07-05 220235.png'),
          ),
          SizedBox(width: 12.w),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomPage(title: 'PALM HILLS',imagePath: 'lib/Assets/Material/Screenshot 2024-07-05 220419.png',)),
              );
            },
            child: ImageContainer(imagePath: 'lib/Assets/Material/Screenshot 2024-07-05 220419.png'),
          ),
          SizedBox(width: 12.w),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomPage(title: 'IlCazarPage',imagePath: 'lib/Assets/Material/Screenshot 2024-07-05 220419.png',)),
              );
            },
            child: ImageContainer(imagePath: 'lib/Assets/Material/Screenshot 2024-07-05 220527.png'),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AllDevelopers()), // Navigate to the page showing all brands
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Text(
                'Show All',
                style: TextStyle(
                  color: KprimaryColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AllBrandsPage extends StatelessWidget {
  const AllBrandsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Brands'),
      ),
      body: Center(
        child: Text(
          'List of All Brands',
          style: TextStyle(fontSize: 20.sp),
        ),
      ),
    );
  }
}


class ImageContainer extends StatelessWidget {
  final String imagePath;

  const ImageContainer({required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = MediaQuery.of(context).size.width;
        double containerWidth = screenWidth * 0.15;
        double containerHeight = screenWidth * 0.15; // Circular container
        return Container(
          width: containerWidth,
          height: containerHeight,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey.withOpacity(0.2),
              width: 2.0.w,
            ),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    );
  }
}
