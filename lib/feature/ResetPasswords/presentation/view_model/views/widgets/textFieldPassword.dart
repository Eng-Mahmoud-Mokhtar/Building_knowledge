import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class TextFieldPassword extends StatefulWidget {
  const TextFieldPassword({super.key});

  @override
  State<TextFieldPassword> createState() => _TextFieldPasswordState();
}
bool obscurePassword = true;
class _TextFieldPasswordState extends State<TextFieldPassword> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            fontFamily: GoogleFonts.inter().fontFamily,
          ),
        ),
        Container(
          height: 48.h,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Enter your password',
              hintStyle: TextStyle(
                color: Color.fromRGBO(158, 158, 158, 1),
              ),
              filled: true,
              fillColor: Color.fromRGBO(250, 250, 250, 1),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.r),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: Color(0xff00AA5B),
                ),
              ),
              prefixIcon: Icon(
                Icons.lock_outlined,
                color: Color.fromRGBO(158, 158, 158, 1),
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
                child: Icon(
                  obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                  color: Color.fromRGBO(158, 158, 158, 1),
                ),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
            ),
            obscureText: obscurePassword,
          ),
        ),
      ],
    );
  }
}
