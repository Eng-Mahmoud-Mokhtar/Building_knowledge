import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/utiles/constans.dart';
import 'Widgets/ButtomRusults.dart';
import 'Widgets/List.dart';
import 'Widgets/buildFilterSection.dart';
import 'Widgets/buildFilterSectionRooms.dart';
import 'Widgets/buildFilterSectionSizes.dart';
import 'package:intl/intl.dart';


class SearchFilter extends StatefulWidget {
  @override
  _SearchFilterState createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  int selectedIndex = -1;
  int selectedActionIndex = -1;
  int selectedTypeIndex = -1;
  double _currentSliderValue = 2000000;
  int selectedBedroomsIndex = -1;
  int selectedBathroomsIndex = -1;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Search Filters',
          style: _headerTextStyle(screenWidth),
        ),
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.grey.shade800, size: screenWidth * 0.04),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0), // تحديد سمك الخط
          child: Container(
            height: 1.0,
            color: Colors.grey.shade300,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildFilterSection(
                    title: 'Property types',
                    items: categories,
                    selectedIndex: selectedIndex,
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                  SizedBox(height: screenWidth * 0.01),
                  buildFilterSection(
                    title: 'Property Status',
                    items: actions,
                    selectedIndex: selectedActionIndex,
                    onTap: (index) {
                      setState(() {
                        selectedActionIndex = index;
                      });
                    },
                  ),
                  SizedBox(height: screenWidth * 0.035),
                  Area(),
                  SizedBox(height: screenWidth * 0.01),
                  Divider(color: Colors.grey.shade300, thickness: 1),
                  SizedBox(height: screenWidth * 0.015),
                  Text('Price Range', style: _sectionTitleStyle(screenWidth)),
                  Slider(
                    value: _currentSliderValue,
                    min: 0,
                    max: 50000000,
                    divisions: 100,
                    activeColor: KprimaryColor,
                    inactiveColor: const Color(0xffE6F7EF),
                    label: _formatSliderValue(_currentSliderValue),
                    onChanged: (value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  ),
                  Row(
                    children: [
                      Text('Minimum', style: _labelStyle(screenWidth)),
                      Spacer(),
                      Text('Maximum', style: _labelStyle(screenWidth)),
                    ],
                  ),
                  SizedBox(height: screenWidth * 0.01),
                  buildFilterSectionRooms(
                    title: 'Bedrooms',
                    items: Bedrooms,
                    selectedIndex: selectedBedroomsIndex,
                    onTap: (index) {
                      setState(() {
                        selectedBedroomsIndex = index;
                      });
                    },
                  ),
                  SizedBox(height: screenWidth * 0.01),
                  buildFilterSectionRooms(
                    title: 'Bathrooms',
                    items: Bathrooms,
                    selectedIndex: selectedBathroomsIndex,
                    onTap: (index) {
                      setState(() {
                        selectedBathroomsIndex = index;
                      });
                    },
                  ),
                  SizedBox(height: screenWidth * 0.01),
                  Divider(color: Colors.grey.shade300, thickness: 1),
                  SizedBox(height: screenWidth * 0.01),
                  buildFilterSection(
                    title: 'Finishing',
                    items: types,
                    selectedIndex: selectedTypeIndex,
                    onTap: (index) {
                      setState(() {
                        selectedTypeIndex = index;
                      });
                    },
                  ),
                  SizedBox(height: screenWidth * 0.2),
                ],
              ),
            ),
          ),
          ButtomRuslts(resultsCount: 200),
        ],
      ),
    );
  }

  TextStyle _headerTextStyle(double screenWidth) {
    return GoogleFonts.inter(
      color: const Color(0xff2F2F2F),
      fontSize: screenWidth * 0.04,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle _sectionTitleStyle(double screenWidth) {
    return GoogleFonts.inter(
      color: const Color(0xff2F2F2F),
      fontSize: screenWidth * 0.035,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle _labelStyle(double screenWidth) {
    return GoogleFonts.inter(
      color: const Color(0xff2F2F2F),
      fontSize: screenWidth * 0.025,
      fontWeight: FontWeight.w500,
    );
  }

  String _formatSliderValue(double value) {
    final formatter = NumberFormat('#,###');
    return formatter.format(value.round());
  }
}
