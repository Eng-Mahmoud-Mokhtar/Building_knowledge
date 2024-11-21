import 'package:building/feature/splash/presentation/view_model/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'feature/Home/Cubit/HeaderCubit.dart';
import 'feature/Profile/Cubit/ProfileCubit.dart';
import 'feature/SignUp/Cubit/register_cubit.dart';
import 'package:provider/provider.dart';
import 'feature/login/Cubit/login_cubit.dart';
import 'feature/login/data/models/auth_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            BlocProvider<RegisterCubit>(create: (context) => RegisterCubit()),
            BlocProvider<LoginCubit>(create: (context) => LoginCubit(authService: AuthService())),
            BlocProvider(create: (_) => ProfileCubit()..fetchProfileData()),
            BlocProvider(create: (_) => HeaderCubit()..fetchHeaderData()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          ),
        );
      },
    );
  }
}
