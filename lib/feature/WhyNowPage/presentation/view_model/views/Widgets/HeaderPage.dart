import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../core/utiles/constans.dart';
import 'buildScrollableContainer.dart';
class HeaderPage extends StatelessWidget {
  const HeaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: screenWidth * 0.75,
      color: Colors.grey.shade200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Why BK ?',
                  style: GoogleFonts.inter(
                    color: KprimaryColor,
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Seacure your dream property and move-in\nimmediately',
                  style: GoogleFonts.inter(
                    color: Colors.black87,
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildScrollableContainer(
                    context,
                    'lib/Assets/Broker/house.png',
                    'Move Now Pay Later Properties',
                    'Explore the wide range of ready-to-move properties available in our inventory and choose your desired home.',
                  ),
                  buildScrollableContainer(
                    context,
                    'lib/Assets/Broker/key.png',
                    'Flexible Payment Plans',
                      'Choose from Building Knowledge\'s flexible payment plans, extending up to 10 years, and pay later for your selected property.'
                  ),
                  buildScrollableContainer(
                    context,
                    'lib/Assets/Broker/for-sale.png',
                    'Smooth Delivery',
                    'Experience the seamless process of acquiring your property from our extensive inventory of ready-to-move homes.',
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}
