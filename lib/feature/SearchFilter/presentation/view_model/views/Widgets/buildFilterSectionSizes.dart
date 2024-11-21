import 'package:building/core/utiles/constans.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Area extends StatefulWidget {
  const Area({super.key});

  @override
  State<Area> createState() => _AreaState();
}

class _AreaState extends State<Area> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Unit Area',
          style: GoogleFonts.inter(
            color: Color(0xff2F2F2F),
            fontSize: screenWidth * 0.035,
            fontWeight: FontWeight.w600,
          ),
        ),
        Slider(
          value: _currentSliderValue,
          min: 0,
          max: 1000,
          divisions: 100,
          activeColor: KprimaryColor,
          inactiveColor: Color(0xffE6F7EF),
          label: '${_currentSliderValue.round()} m²',
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value;
            });
          },
        ),
        Row(
          children: [
            Text(
              'Minimum',
              style: GoogleFonts.inter(
                color: Color(0xff2F2F2F),
                fontSize: screenWidth * 0.025,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            Text(
              'Maximum',
              style: GoogleFonts.inter(
                color: Color(0xff2F2F2F),
                fontSize: screenWidth * 0.025,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
