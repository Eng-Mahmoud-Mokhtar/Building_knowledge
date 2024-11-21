import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../CapitalGardens/presentation/view_model/views/CapitalGardens.dart';
import '../../../../../CapitalGardens/presentation/view_model/views/Widget/DetailesContainer.dart';
import '../../../../../Search/presentation/view_model/views/Search.dart'; // Adjust the path as needed

class CustomPage extends StatelessWidget {
  final String imagePath;
  final String title;
  CustomPage({
    super.key,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double circleSize = screenWidth * 0.15;
    final List<Map<String, dynamic>> compounds = [
      {
        'title': 'Capital Gardens',
        'location': 'New Cairo',
        'price': 'Price Start from 10M EGP',
        'imagePath': 'lib/Assets/Building/3d-rendering-house-model (1).jpg',
        'destinationPage': CapitalGardens(imagePath:imagePath,title: title),
      },
      {
        'title': 'Garden Heights',
        'location': 'Nasr City',
        'price': 'Price Start from 8M EGP',
        'imagePath': 'lib/Assets/Building/avenue-with-green-trees.jpg',
        'destinationPage': CapitalGardens(imagePath:imagePath,title: title),
      },
      {
        'title': 'Luxury Villas',
        'location': 'Sheikh Zayed',
        'price': 'Price Start from 15M EGP',
        'imagePath': 'lib/Assets/Building/chicago-skyscrapers.jpg',
        'destinationPage': CapitalGardens(imagePath:imagePath,title: title),
      },
      {
        'title': 'Garden Heights',
        'location': 'Nasr City',
        'price': 'Price Start from 8M EGP',
        'imagePath': 'lib/Assets/Building/IMG-20241026-WA0002.jpg',
        'destinationPage': CapitalGardens(imagePath:imagePath,title: title),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: GoogleFonts.inter(
            color: Color(0xff2F2F2F),
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: screenWidth * 0.045),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            height: 1.0,
            color: Colors.grey.shade300,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric( horizontal: screenWidth * 0.04,
                vertical: screenWidth * 0.02),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(screenWidth * 0.02),
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 1 , // Border width
                ),
              ),
              child: IconButton(
                icon: Image.asset(
                  'lib/Assets/new/magnifier_14120153.png',
                  width: screenWidth * 0.05,
                  height: screenWidth * 0.05,
                  fit: BoxFit.contain,
                  color: Color(0xff9E9E9E),
                ), onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Search(),
                  ),
                );
              },
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: circleSize * 1.3,
                height: circleSize * 1.3,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // زيادة الظل
                      spreadRadius: 3,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenWidth * 0.08),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Avilable Compounds',
                    style: GoogleFonts.inter(
                      color: Color(0xff2F2F2F),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              ...compounds.map((compound) {
                return buildCompoundCard(
                  context,
                  title: compound['title'],
                  location: compound['location'],
                  price: compound['price'],
                  imagePath: compound['imagePath'],
                  destinationPage: compound['destinationPage'],
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
