import 'package:building/core/utiles/constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildFilterSectionRooms({
  required String title,
  required List<dynamic> items,
  required int selectedIndex,
  required Function(int) onTap,
}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      final screenWidth = MediaQuery.of(context).size.width;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            thickness: screenWidth * 0.0025,
            color: Colors.grey.shade300,
          ),
          SizedBox(height: screenWidth * 0.02),
          Text(
            title,
            style: GoogleFonts.inter(
              color: Color(0xff2F2F2F),
              fontSize: screenWidth * 0.035,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: screenWidth * 0.02),
          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(items.length, (index) {
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      onTap(index);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                      height: screenWidth * 0.12,
                      width: screenWidth * 0.09,
                      decoration: BoxDecoration(
                        color: selectedIndex == index
                            ? Color(0xffE6F7EF)
                            : Color(0xffF2F2F2),
                        borderRadius: BorderRadius.circular(screenWidth * 0.02),
                        border: Border.all(
                          color: selectedIndex == index ? KprimaryColor : Colors.transparent, // Change border color here
                          width: 1, // Adjust width as needed
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '${items[index]}',
                          style: TextStyle(
                            color: selectedIndex == index
                                ? KprimaryColor
                                : Colors.grey,
                            fontWeight:  selectedIndex == index  ? FontWeight.w600:FontWeight.w400,
                            fontSize:  selectedIndex == index  ? screenWidth * 0.035: screenWidth * 0.035,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: screenWidth * 0.04),
        ],
      );
    },
  );
}
