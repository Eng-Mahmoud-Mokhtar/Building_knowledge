import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<String?> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('https://einv.wa.dvtst.com/public/api/login'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        return responseBody['token'];
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Error logging in: $e');
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token == null) return;

    final response = await http.post(
      Uri.parse('https://einv.wa.dvtst.com/public/api/logout'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 204) {
      await prefs.remove('token');
    } else {
      throw Exception('Error during logout');
    }
  }
}
