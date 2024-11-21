import 'package:building/feature/AddProperty/presentation/view_model/view/PostedProperty.dart';
import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:building/core/utiles/constans.dart';

class ButtomCreateProperty extends StatelessWidget {
  final bool imagesSelected;
  final List<XFile> imageFiles;
  final String description;
  final String phoneController;
  final int price;
  final String address;
  final String title;
  final String propertyType;
  final String finishingType;
  final int bathroomsController;
  final int bedroomsController;
  final int sqftController;

  const ButtomCreateProperty({
    Key? key,
    required this.imagesSelected,
    required this.imageFiles,
    required this.description,
    required this.price,
    required this.address,
    required this.phoneController,
    required this.title,
    required this.propertyType,
    required this.finishingType,
    required this.bathroomsController,
    required this.bedroomsController,
    required this.sqftController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenHeight * 0.02),
      child: ElevatedButton(
        onPressed: imagesSelected &&
            description.isNotEmpty &&
            price != null &&
            phoneController != null &&
            address.isNotEmpty &&
            title.isNotEmpty &&
            propertyType.isNotEmpty &&
            finishingType.isNotEmpty &&
            bathroomsController != null &&
            bedroomsController != null &&
            sqftController != null
            ? () {
          showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(screenWidth * 0.04)),
            ),
            builder: (BuildContext context) {
              return Container(
                height: screenHeight * 0.4,
                width: double.infinity,
                padding: EdgeInsets.all(screenWidth * 0.04),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(screenWidth * 0.04),
                    topRight: Radius.circular(screenWidth * 0.04),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.04),
                      child: Image.asset(
                        'lib/Assets/Broker/Group 34627.png',
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Text(
                      'Congratulations!',
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        color: Color(0xff2F2F2F),
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.inter().fontFamily,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Text(
                      'Your Property Listed Successfully',
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
                        color: Color(0xff9E9E9E),
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.inter().fontFamily,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PostedMaterial(
                              imagePaths: imageFiles.map((file) => file.path).toList(),
                              description: description,
                              phoneController:phoneController,
                              price: price,
                              address: address,
                              title: title,
                              propertyType: propertyType,
                              finishingType: finishingType,
                              bathroomsController: bathroomsController,
                              bedroomsController: bedroomsController,
                              sqftController: sqftController,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: KprimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(screenWidth * 0.015),
                        ),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: screenHeight * 0.06,
                        child: Center(
                          child: Text(
                            'Done',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontFamily: GoogleFonts.inter().fontFamily,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: imagesSelected ? Color(0xff00AA5B) : Color(0xff9E9E9E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.015),
          ),
        ),
        child: SizedBox(
          height: screenWidth * 0.12,
          child: Center(
            child: Text(
              'Submit',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.035,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontFamily: GoogleFonts.inter().fontFamily,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
