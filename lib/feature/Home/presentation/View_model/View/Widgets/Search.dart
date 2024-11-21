import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/utiles/constans.dart';
import '../../../../../Search/presentation/view_model/views/Search.dart';
import 'Brower.dart';

class SearchBrower extends StatelessWidget {
  const SearchBrower({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double desiredHeight = screenWidth * 0.12;

    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Search(),
                ),
              );
            },
            child: Container(
              height: desiredHeight,
              child: AbsorbPointer(
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: Color(0xff9E9E9E),
                      fontWeight: FontWeight.w500,
                      fontSize: screenWidth * 0.04,
                    ),
                    fillColor: Colors.grey.shade500,
                    focusColor: KprimaryColor,
                    hintText: 'Area, Compounds, Developer',
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xff9E9E9E),
                      size: screenWidth * 0.06,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: desiredHeight * 0.3,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.02),
                      borderSide: BorderSide(
                        color: Color(0xff9E9E9E),
                        width: 1.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.02),
                      borderSide: BorderSide(
                        color: Color(0xffE9E9E9),
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.02),
                      borderSide: BorderSide(
                        color: Color(0xffE9E9E9),
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: screenWidth * 0.02),
        Brower(),
      ],
    );
  }
}
