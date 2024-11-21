import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'ProfileState.dart';


class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState(name: ''));

  Future<void> fetchProfileData() async {
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
      emit(ProfileState(name: name, imagePath: imagePath));
    }
  }

  Future<void> updateProfileImage(String newPath) async {
    emit(ProfileState(name: state.name, imagePath: newPath));
  }
}
