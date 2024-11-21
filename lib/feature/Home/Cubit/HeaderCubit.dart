import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'HeaderState.dart';


class HeaderCubit extends Cubit<HeaderState> {
  HeaderCubit() : super(HeaderState(name: ''));

  Future<void> fetchHeaderData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) return;

    final response = await http.get(
      Uri.parse('https://einv.wa.dvtst.com/public/api/profile/index'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      final userEmail = responseBody['data']['user']['email'];
      final name = responseBody['data']['user']['name'];
      final imagePath = prefs.getString('profile_image_$userEmail') ?? responseBody['data']['user']['image'];
      emit(HeaderState(name: name, imagePath: imagePath));
    }
  }

  Future<void> updateHeaderImage(String newPath) async {
    emit(HeaderState(name: state.name, imagePath: newPath));
  }
}
