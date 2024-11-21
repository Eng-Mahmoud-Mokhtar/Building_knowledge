import 'package:building/feature/AddProperty/presentation/view_model/view/CreateProperty.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utiles/constans.dart';
import '../../../../../AddMaterials/presentation/view_model/view/CreateMaterialPost.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  String? selectedOption;

  void _navigateToNextPage() {
    if (selectedOption == "Material") {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => CreateMaterialPost()),
      );
    } else if (selectedOption == "Property") {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => CreateProperty()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
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
          'Post Ad',
          style: GoogleFonts.inter(
            color: const Color(0xff2F2F2F),
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            height: 1.0,
            color: Colors.grey.shade300,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20.h),
              child: Text(
                'What is your ad type ?',
                style: GoogleFonts.inter(
                  fontSize: screenWidth * 0.04,
                  color: Color(0xff2F2F2F),
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            _buildOptionCard(
              context: context,
              title: "Material",
              description: "Advertise finishing materials and products.",
              imagePath: 'lib/Assets/images/icons8-tools-48.png',
              onTap: () {
                setState(() {
                  selectedOption = "Material";
                });
              },
            ),
            const SizedBox(height: 20),
            _buildOptionCard(
              context: context,
              title: "Property",
              description: "Advertise properties",
              imagePath: 'lib/Assets/Services/Vectorss(5).png',
              onTap: () {
                setState(() {
                  selectedOption = "Property";
                });
              },
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: selectedOption == null ? Color(0xff00AA5B) : KprimaryColor,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: selectedOption == null ? null : _navigateToNextPage,
              child: SizedBox(
                height: screenWidth * 0.12,
                child: Center(
                  child: Text(
                    'Next',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard({
    required BuildContext context,
    required String title,
    required String description,
    required String imagePath,
    required VoidCallback onTap,
  }) {
    final isSelected = selectedOption == title;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffF9F9F9),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? KprimaryColor : Colors.white,
            width: 2.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                width: 30.w,
                height: 30.h,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  color: KprimaryColor,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? KprimaryColor : Colors.grey[700],
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14, // Size of the description text
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

