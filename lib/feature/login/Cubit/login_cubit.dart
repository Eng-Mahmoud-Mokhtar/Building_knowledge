import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/models/auth_service.dart';
import '../data/models/user_model.dart';

class LoginCubit extends Cubit<LoginModel> {
  final AuthService authService;

  LoginCubit({required this.authService}) : super(LoginModel());

  void emailChanged(String email) {
    emit(state.copyWith(email: email, errorMessage: null, loginSuccess: false));
  }

  void passwordChanged(String password) {
    emit(state.copyWith(password: password, errorMessage: null, loginSuccess: false));
  }

  Future<void> login(String email, String password) async {
    try {
      final token = await authService.login(email, password);
      if (token != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        emit(state.copyWith(loginSuccess: true, errorMessage: null, token: token));

        // إضافة رسالة في الترمينال عند نجاح تسجيل الدخول
        print('Login successful: Token received');
      } else {
        emit(state.copyWith(errorMessage: 'Invalid email or password'));

        // إضافة رسالة في الترمينال عند فشل تسجيل الدخول
        print('Login failed: Invalid email or password');
      }
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Error: $e'));

      // إضافة رسالة في الترمينال في حالة حدوث خطأ
      print('Login error: $e');
    }
  }

  Future<void> checkLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token != null) {
      emit(state.copyWith(token: token, loginSuccess: true));
    }
  }
  Future<void> logout() async {
    try {
      await authService.logout();
      emit(LoginModel());

      // إضافة رسالة في الترمينال عند نجاح تسجيل الخروج
      print('Logout successful');
    } catch (e) {
      emit(state.copyWith(errorMessage: 'Logout error: $e'));

      // إضافة رسالة في الترمينال في حالة حدوث خطأ أثناء الخروج
      print('Logout error: $e');
    }
  }
}
