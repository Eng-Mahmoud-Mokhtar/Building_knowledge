import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class ConfirmPassword extends StatefulWidget {
  const ConfirmPassword({super.key});

  @override
  State<ConfirmPassword> createState() => _TextFieldPasswordState();
}
bool obscurePassword = true;
class _TextFieldPasswordState extends State<ConfirmPassword> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Confirm Password',
          style: TextStyle(
            fontSize: screenWidth * 0.035,
            fontWeight: FontWeight.w500,
            fontFamily: GoogleFonts.inter().fontFamily,
          ),
        ),
        Container(
          height: screenWidth * 0.1,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xffFAFAFA),
            borderRadius: BorderRadius.circular(screenWidth * 0.02),
            border: Border.all(
              color: const Color(0xffE9E9E9),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
          child: Center(
            child: TextField(
              style: TextStyle(
                fontSize: screenWidth * 0.035,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: 'Enter your Password',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: screenWidth * 0.035,
                ),
                border: InputBorder.none,
                prefixIconConstraints: BoxConstraints(
                  minWidth: 0,
                  minHeight: 0,
                ),
                prefixIcon: Icon(
                  Icons.lock_outlined,
                  color: Colors.grey.shade400,
                  size: screenWidth * 0.06,
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                  child: Icon(
                    obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    color: Colors.grey.shade400,
                    size: screenWidth * 0.06, // نسبة تقريبية لـ 24/400
                  ),
                ),
              ),
              obscureText: obscurePassword,
            ),
          ),
        ),
      ],
    );
  }
}
