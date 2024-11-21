import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../SearchFilter/presentation/view_model/views/SearchFilter.dart';

class Brower extends StatelessWidget {
  const Brower({Key? key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double desiredHeight = screenWidth * 0.12;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchFilter()),
        );
      },
      child: Container(
        height: desiredHeight,
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(screenWidth * 0.02),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1 , // Border width
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.027),
          child: Container(
            child: Image.asset(
              'lib/Assets/FeatureApartment/icons8-filter-32.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
