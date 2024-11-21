import 'package:building/core/utiles/constans.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



Widget buildFilterSection({
  required String title,
  required List<String> items,
  required int selectedIndex,
  required Function(int) onTap,
}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      final screenWidth = MediaQuery.of(context).size.width;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text(
              title,
              style: GoogleFonts.inter(
                color: Color(0xff2F2F2F),
                fontSize: screenWidth * 0.035,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Center(
            child: Container(
              height: screenWidth * 0.12,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(items.length, (index) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        onTap(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: selectedIndex == index
                              ? Color(0xffE6F7EF)
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: selectedIndex == index ? KprimaryColor : Colors.transparent, // Change border color here
                            width: 1, // Adjust width as needed
                          ),
                        ),
                        child: Center(
                          child: Text(
                            items[index],
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
          ),
        ],
      );
    },
  );
}
