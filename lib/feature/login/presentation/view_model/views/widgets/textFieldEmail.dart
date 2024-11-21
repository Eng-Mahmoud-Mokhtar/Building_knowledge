import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/models/user_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldEmail extends StatelessWidget {
  const TextFieldEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<LoginCubit, LoginModel>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email',
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
                color: Color(0xffFAFAFA),
                borderRadius: BorderRadius.circular(screenWidth * 0.02),
                border: Border.all(
                  color: Color(0xffE9E9E9),
                ),
              ),
              child: Center(
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                      child: Icon(
                        Icons.email_outlined,
                        size: screenWidth * 0.05,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter your Email',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: screenWidth * 0.035,
                            fontWeight: FontWeight.w400
                          ),
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (state.email.isEmpty && state.errorMessage != null)
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: Text(
                  'Email is required',
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
