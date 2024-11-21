import 'package:building/core/utiles/constans.dart';
import 'package:building/feature/Home/presentation/View_model/View/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/models/user_model.dart';

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<LoginCubit, LoginModel>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ElevatedButton(
            onPressed: () async {
              String email = state.email;
              String password = state.password;

              if (email.isEmpty) {
                context.read<LoginCubit>().emit(
                  state.copyWith(errorMessage: 'Email is required'),
                );
                return;
              }

              if (password.isEmpty) {
                context.read<LoginCubit>().emit(
                  state.copyWith(errorMessage: 'Password is required'),
                );
                return;
              }

              await context.read<LoginCubit>().login(email, password);
              if (context.read<LoginCubit>().state.loginSuccess) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Home()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Row(
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: Colors.yellowAccent,
                        ),
                        SizedBox(width: 10),Expanded(
                          child: Text(
                            state.errorMessage ?? 'Invalid Email or Password',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    backgroundColor: Color(0xffE72929),
                  ),
                );
                context.read<LoginCubit>().emit(
                  state.copyWith(errorMessage: 'Invalid Email or Password'),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: KprimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: SizedBox(
              height: screenWidth * 0.12,
              child: Center(
                child: Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
