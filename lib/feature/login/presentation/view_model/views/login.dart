import 'package:building/feature/login/presentation/view_model/views/widgets/ButtonLogin.dart';
import 'package:building/feature/login/presentation/view_model/views/widgets/Divider.dart';
import 'package:building/feature/login/presentation/view_model/views/widgets/dontHaveAccountRow.dart';
import 'package:building/feature/login/presentation/view_model/views/widgets/face_google_apple.dart';
import 'package:building/feature/login/presentation/view_model/views/widgets/rememberPage.dart';
import 'package:building/feature/login/presentation/view_model/views/widgets/textFieldEmail.dart';
import 'package:building/feature/login/presentation/view_model/views/widgets/textFieldPassword.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../../core/utiles/Assets_Data.dart';
import '../../../Cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/user_model.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return BlocBuilder<LoginCubit, LoginModel>(
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
                        width: screenWidth * 0.355,
                        height: screenHeight * 0.12,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(height: screenHeight * 0.03),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.04),                          child: const TextFieldEmail(),
                        ),
                        SizedBox(height: screenHeight * 0.015),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.04),                          child: const TextFieldPassword(),
                        ),
                        const RememberPage(),
                        SizedBox(height: 15),
                        const ButtonLogin(),
                        SizedBox(height: 15),
                        const CustomDivider(),
                        SizedBox(height: 15),
                        const FaceGoogleApple(),
                        SizedBox(height: 20),
                        const CreateAccount(),
                        SizedBox(height: 20),
                      ],
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
