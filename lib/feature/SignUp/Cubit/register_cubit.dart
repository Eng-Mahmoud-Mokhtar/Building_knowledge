import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'States.dart';


class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> register(String name, String email, String phone, String password) async {
    emit(RegisterLoading());
    try {
      final response = await http.post(
        Uri.parse('https://einv.wa.dvtst.com/public/api/register'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'name': name,
          'email': email,
          'phone': phone,
          'password': password,
        }),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        emit(RegisterSuccess());
      } else {
        emit(RegisterError(response.body));
      }
    } catch (e) {
      print('Error occurred: $e');
      emit(RegisterError('فشل الاتصال بالخادم.'));
    }
  }
}
