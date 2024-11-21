import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'buildActionButtons.dart';

class Property {
  final String type;
  final String location;
  final String details;
  final String imageUrl;
  final String price;

  Property({
    required this.type,
    required this.location,
    required this.details,
    required this.imageUrl,
    required this.price,
  });
}
List<Property> properties = [
  Property(
    type: 'Apartment',
    location: 'Badya',
    details: '2 Beds | 2 Baths | 200 m',
    imageUrl: 'lib/Assets/Broker/old-residential-building-sunny-day-barcelona-spain.jpg',
    price: '3.533.391 EG',
  ),
  Property(
    type: 'Villa',
    location: 'Cairo',
    details: '4 Beds | 3 Baths | 300 m',
    imageUrl: 'lib/Assets/Broker/huge-swimming-pool-near-hotel-resort-san-teodoro-sardinia.jpg',
    price: '15.000.000 EG',
  ),
  Property(
    type: 'Townhouse',
    location: 'Alexandria',
    details: '3 Beds | 2 Baths | 250 m',
    imageUrl: 'lib/Assets/Broker/white-concrete-building-with-balconies.jpg',
    price: '2.750.000 EG',
  ),
];
Widget buildPropertiesCard(BuildContext context, Property property) {
  double screenWidth = MediaQuery.of(context).size.width;

  return Padding(
    padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
    child: GestureDetector(
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => DetailPage(),
        //   ),
        // );
      },
      child: Container(
        width: screenWidth,
        height: screenWidth * 0.35,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              width: screenWidth * 0.30,
              height: screenWidth * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  property.imageUrl,
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
                      property.type,
                      style: TextStyle(
                        color: Color(0xff2F2F2F),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      property.location,
                      style: TextStyle(
                        color: Color(0xff2F2F2F),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      property.details,
                      style: TextStyle(
                        color: const Color(0xff9E9E9E),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          property.price,
                          style: TextStyle(
                            color: Color(0xffF08200),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        buildActionButtons(screenWidth),
                      ],
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
