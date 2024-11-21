import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../data/models/user_model.dart';

class TextFieldPassword extends StatefulWidget {
  const TextFieldPassword({super.key});

  @override
  State<TextFieldPassword> createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<LoginCubit, LoginModel>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: TextStyle(
                fontSize: screenWidth * 0.035,
                fontWeight: FontWeight.w500,
                fontFamily: GoogleFonts.inter().fontFamily,
              ),
            ),
            SizedBox(height: 5.h),
            Container(
              height: screenWidth * 0.12,
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
                  onChanged: (password) => context.read<LoginCubit>().passwordChanged(password),
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Enter your Password',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.w400
                    ),
                    border: InputBorder.none,
                    prefixIconConstraints: BoxConstraints(
                      minWidth: 0,
                      minHeight: 0,
                    ),
                    prefixIcon: Icon(
                      Icons.lock_outlined,
                      color: Colors.grey.shade400,
                      size: screenWidth * 0.05,
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
                        size: screenWidth * 0.05, // نسبة تقريبية لـ 24/400
                      ),
                    ),
                  ),
                  obscureText: obscurePassword,
                ),
              ),
            ),
            if (state.password.isEmpty && state.errorMessage != null)
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: Text(
                  'Password is required',
                  style: TextStyle(
                    color: Color(0xffE72929),
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
