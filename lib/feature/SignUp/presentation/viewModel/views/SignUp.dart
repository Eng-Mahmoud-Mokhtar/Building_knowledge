import 'dart:convert';
import 'package:building/feature/SignUp/presentation/viewModel/views/widgets/alreadyHaveAccount.dart';
import 'package:building/feature/login/presentation/view_model/views/widgets/Divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../core/utiles/Assets_Data.dart';
import '../../../../login/presentation/view_model/views/login.dart';
import '../../../../login/presentation/view_model/views/widgets/face_google_apple.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Cubit/States.dart';
import '../../../Cubit/register_cubit.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? nameError;
  String? emailError;
  String? phoneError;
  String? passwordError;
  bool _showErrors = false;
  bool obscurePassword = true;
  void validateFields() {
    setState(() {
      _showErrors = true;
      nameError = nameController.text.trim().isEmpty ? 'Name is required' : null;
      emailError = emailController.text.trim().isEmpty
          ? 'Email is required'
          : !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(emailController.text.trim())
          ? 'Invalid email address'
          : null;
      phoneError = phoneController.text.trim().isEmpty
          ? 'Phone number is required'
          : phoneController.text.trim().length < 11
          ? 'Incorrect phone number'
          : null;
      passwordError = passwordController.text.trim().isEmpty
          ? 'Password is required'
          : passwordController.text.trim().length < 8
          ? 'Password must be at least 8 characters'
          : null;
    });
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: backgroundColor,
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.0625),
                    child: Center(
                      child: Image.asset(
                        AssetsData.Logo,
                        width: screenWidth * 0.375,
                        height: screenHeight * 0.12,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(screenWidth * 0.06),
                        topRight: Radius.circular(screenWidth * 0.06),
                      ),
                      border: Border(
                        top: BorderSide(
                          color: KprimaryColor,
                          width: screenWidth * 0.0125,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(height: screenHeight * 0.03),
                          Text(
                            'Name',
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.w500,
                              fontFamily: GoogleFonts
                                  .inter()
                                  .fontFamily,
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
                                    padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth * 0.02),
                                    child: Icon(
                                      Icons.perm_identity_sharp,
                                      size: screenWidth * 0.05,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      controller: nameController,
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.035,
                                        color: Colors.black,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'Enter your name',
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: screenWidth * 0.035,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                      keyboardType: TextInputType.name,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),if (_showErrors && nameError != null)
                            Padding(
                              padding: EdgeInsets.only(top: 5.h),
                              child: Text(
                                nameError ?? '',
                                style: TextStyle(
                                  color: Color(0xffE72929),
                                  fontSize: screenWidth * 0.03,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          SizedBox(height: 12.h),
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
                                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02), // نسبة تقريبية لـ 8/400
                                    child: Icon(
                                      Icons.email_outlined,
                                      size: screenWidth * 0.05,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      controller: emailController,
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.035, // نسبة تقريبية لـ 14/400
                                        color: Colors.black,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'Enter your Email',
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: screenWidth * 0.035,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),if (_showErrors && emailError != null)
                            Padding(
                              padding: EdgeInsets.only(top: 5.h),
                              child: Text(
                                emailError ?? '',
                                style: TextStyle(
                                  color: Color(0xffE72929),
                                  fontSize: screenWidth * 0.03,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          SizedBox(height: 12.h),
                          Text(
                            'Phone',
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.w500,
                              fontFamily: GoogleFonts
                                  .inter()
                                  .fontFamily,
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
                                    padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth * 0.02),
                                    child: Icon(
                                      Icons.phone_outlined,
                                      size: screenWidth * 0.05,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      controller: phoneController,
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.035,
                                        color: Colors.black,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'Phone Number',
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: screenWidth * 0.035,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                      keyboardType: TextInputType.phone,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,  // يسمح فقط بالأرقام
                                        LengthLimitingTextInputFormatter(11),    // يحدد الحد الأقصى إلى 11 رقم
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (_showErrors && phoneError != null)
                            Padding(
                              padding: EdgeInsets.only(top: 5.h),
                              child: Text(
                                phoneError ?? '',
                                style: TextStyle(
                                  color: Color(0xffE72929),
                                  fontSize: screenWidth * 0.03,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          SizedBox(height: 12.h),
                          Text(
                            'Password',
                            style: TextStyle(
                              fontSize: screenWidth * 0.035, // نسبة تقريبية لـ 14/400
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
                                controller: passwordController,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.035, // نسبة تقريبية لـ 14/400
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
                                      size: screenWidth * 0.06,
                                    ),
                                  ),
                                ),
                                obscureText: obscurePassword,
                              ),
                            ),
                          ),if (_showErrors && passwordError != null)
                            Padding(
                              padding: EdgeInsets.only(top: 5.h),
                              child: Text(
                                passwordError ?? '',
                                style: TextStyle(
                                  color: Color(0xffE72929),
                                  fontSize: screenWidth * 0.03,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          SizedBox(height: 15),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: KprimaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),child: SizedBox(
                            height: screenWidth * 0.12,
                            child: Center(
                              child: Text(
                                'Create account',
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
                            onPressed: () {
                              validateFields();
                              if (nameError == null && emailError == null && phoneError == null && passwordError == null) {
                                context.read<RegisterCubit>().register(
                                  nameController.text.trim(),
                                  emailController.text.trim(),
                                  phoneController.text.trim(),
                                  passwordController.text.trim(),
                                );
                              }
                            },
                          ),
                          BlocListener<RegisterCubit, RegisterState>(
                            listener: (context, state) {
                              if (state is RegisterLoading) {
                                CoolAlert.show(
                                  borderRadius: 8.0,
                                  context: context,
                                  type: CoolAlertType.loading,
                                  barrierDismissible: false,
                                  text: 'Creating account...',
                                );
                              } else if (state is RegisterSuccess) {
                                Navigator.of(context).pop();
                                CoolAlert.show(
                                  borderRadius: 8.0,
                                  barrierDismissible: false,
                                  context: context,
                                  type: CoolAlertType.success,
                                  title: 'Successful',
                                  text: 'Account has been successfully created!',
                                  confirmBtnColor: Colors.transparent,
                                  confirmBtnTextStyle: TextStyle(
                                    color: KprimaryColor,
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  confirmBtnText: 'Login',
                                  onConfirmBtnTap: () {
                                    Navigator.pop(context);
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => Login()),
                                    );
                                  },
                                );
                              } else if (state is RegisterError) {
                                Navigator.of(context).pop();
                                setState(() {
                                  emailError = null;
                                  phoneError = null;
                                  final responseBody = json.decode(state.message);
                                  if (responseBody['errors'] != null) {
                                    if (responseBody['errors']['email'] != null) {
                                      emailError = responseBody['errors']['email'].join(', ');
                                    }
                                    if (responseBody['errors']['phone'] != null) {
                                      phoneError = responseBody['errors']['phone'].join(', ');
                                    }
                                  }
                                });
                                CoolAlert.show(
                                  borderRadius: 8.0,
                                  context: context,
                                  type: CoolAlertType.error,
                                  title: 'Account creation failed',
                                  text: 'Something went wrong, Please try again',
                                  confirmBtnText: 'Try again',
                                  confirmBtnColor: Colors.transparent,
                                  confirmBtnTextStyle: TextStyle(
                                    color: Color(0xffE72929),
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.w600,
                                  ),
                                );

                              }
                            },
                            child: Container(),
                          ),
                          SizedBox(height: 15),
                          CustomDivider(),
                          SizedBox(height: 15),
                          FaceGoogleApple(),
                          SizedBox(height: 20),
                          AlreadyHaveAccount(),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}
