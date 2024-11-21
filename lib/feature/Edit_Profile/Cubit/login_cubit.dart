import 'package:bloc/bloc.dart';
import 'package:building/feature/Edit_Profile/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';


class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState());

  Future<void> fetchProfileData() async {
    try {
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
        final savedImage = prefs.getString('profile_image_$userEmail');

        emit(state.copyWith(
          email: userEmail,
          name: responseBody['data']['user']['name'],
          phoneNumber: responseBody['data']['user']['phone'],
          image: savedImage ?? responseBody['data']['user']['image'],
          errorMessage: null,
        ));
      } else {
        emit(state.copyWith(errorMessage: 'فشل في جلب البيانات'));
      }
    } catch (e) {
      emit(state.copyWith(errorMessage: 'خطأ: $e'));
    }
  }

  Future<void> updateProfile(String email, String name, String? phoneNumber, String? image) async {
    if (name.isEmpty || email.isEmpty || phoneNumber?.isEmpty == true) {
      String? invalidField = '';
      if (name.isEmpty) invalidField = 'الاسم';
      else if (email.isEmpty) invalidField = 'البريد الإلكتروني';
      else if (phoneNumber?.isEmpty == true) invalidField = 'رقم الهاتف';

      emit(state.copyWith(invalidField: invalidField));
      return;
    }

    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$').hasMatch(email)) {
      emit(state.copyWith(emailError: 'البريد الإلكتروني غير صحيح'));
      return;
    }

    if (phoneNumber != null && (phoneNumber.length != 11)) {
      emit(state.copyWith(errorMessage: 'رقم الهاتف يجب أن يكون 11 رقمًا'));
      return;
    }

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      if (token == null) return;

      emit(state.copyWith(isLoading: true, errorMessage: null));

      final Map<String, dynamic> updatedData = {
        'email': email,
        'name': name,
        'phone_number': phoneNumber ?? state.phoneNumber,
      };

      if (image != null && image.isNotEmpty) {
        updatedData['image'] = image;
      }

      final response = await http.put(
        Uri.parse('https://einv.wa.dvtst.com/public/api/profile/update'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(updatedData),
      );

      if (response.statusCode == 200) {
        prefs.setString('profile_image_$email', image ?? state.image);
        prefs.setString('profile_name_$email', name);
        prefs.setString('profile_phone_$email', phoneNumber ?? state.phoneNumber);

        emit(state.copyWith(
          updateSuccess: true,
          isLoading: false,
          errorMessage: null,
          name: name,
          phoneNumber: phoneNumber ?? state.phoneNumber,
          image: image ?? state.image,
          email: email,
          nameUpdated: name != state.name,
          emailUpdated: email != state.email,
          phoneUpdated: phoneNumber != state.phoneNumber,
        ));

        // مؤقت لعرض الأيقونة مرتين
        Future.delayed(Duration(seconds: 1), () {
          emit(state.copyWith(
            nameUpdated: false,
            emailUpdated: false,
            phoneUpdated: false,
          ));

          Future.delayed(Duration(milliseconds: 500), () {
            emit(state.copyWith(
              nameUpdated: name != state.name,
              emailUpdated: email != state.email,
              phoneUpdated: phoneNumber != state.phoneNumber,
            ));
            Future.delayed(Duration(seconds: 2), () {
              emit(state.copyWith(updateSuccess: false));
            });
          });
        });
      } else {
        final responseBody = jsonDecode(response.body);
        emit(state.copyWith(
          errorMessage: responseBody['errors']?.toString() ?? 'فشل في تحديث البيانات',
          isLoading: false,
        ));
      }
    } catch (e) {
      emit(state.copyWith(errorMessage: 'خطأ: $e', isLoading: false));
    }
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('profile_image_${state.email}', pickedFile.path);

      emit(state.copyWith(image: pickedFile.path));
    }
  }
}
