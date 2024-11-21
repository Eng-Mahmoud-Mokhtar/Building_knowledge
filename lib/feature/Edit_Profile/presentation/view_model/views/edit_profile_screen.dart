import 'dart:convert';
import 'dart:io';
import 'package:building/core/utiles/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  String? imagePath;
  String nameError = '';
  String emailError = '';
  String phoneError = '';
  bool isEdited = false;
  bool isLoading = false;
  String? previousName;
  String? previousEmail;
  String? previousPhone;
  String? previousImagePath;

  @override
  void initState() {
    super.initState();
    fetchProfileData();
  }

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
      setState(() {
        emailController.text = userEmail;
        nameController.text = responseBody['data']['user']['name'];
        phoneController.text = responseBody['data']['user']['phone'];
        imagePath = prefs.getString('profile_image_$userEmail') ??
            responseBody['data']['user']['image'];
        previousName = nameController.text;
        previousEmail = emailController.text;
        previousPhone = phoneController.text;
        previousImagePath = imagePath;
      });
    }
  }

  Future<void> updateProfile() async {
    setState(() {
      nameError = '';
      emailError = '';
      phoneError = '';
    });

    if (nameController.text.isEmpty) {
      setState(() {
        nameError = 'Name is required';
      });
    }

    if (emailController.text.isEmpty ||
        !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
            .hasMatch(emailController.text)) {
      setState(() {
        emailError = emailController.text.isEmpty
            ? 'Email is required'
            : 'Invalid email address';
      });
    }

    if (phoneController.text.isEmpty || phoneController.text.length != 11) {
      setState(() {
        phoneError = phoneController.text.isEmpty
            ? 'Phone number is required'
            : 'Phone number must be 11 digits';
      });
    }

    if (nameError.isEmpty && emailError.isEmpty && phoneError.isEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      if (token == null) return;

      setState(() {
        isLoading = true;
      });

      final uri = Uri.parse('https://einv.wa.dvtst.com/public/api/profile/update');

      var request = http.MultipartRequest('POST', uri)
        ..headers.addAll({
          'Authorization': 'Bearer $token',
        })
        ..fields['email'] = emailController.text
        ..fields['name'] = nameController.text
        ..fields['phone_number'] = phoneController.text;

      if (imagePath != null && imagePath!.isNotEmpty) {
        var imageFile = await http.MultipartFile.fromPath(
          'image',
          imagePath!,
          contentType: MediaType('image', 'jpeg'),
        );
        request.files.add(imageFile);
      }

      final response = await request.send();

      if (response.statusCode == 200) {
        prefs.setString('profile_image_${emailController.text}', imagePath!);
        prefs.setString('user_name', nameController.text);
        prefs.setString('user_email', emailController.text);
        prefs.setString('user_phone', phoneController.text);
        setState(() {
          isLoading = false;
          isEdited = false;
        });
        setState(() {
          previousName = nameController.text;
          previousEmail = emailController.text;
          previousPhone = phoneController.text;
          previousImagePath = imagePath;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 8),
              Text("Profile updated successfully",style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),),
            ],
          ),
          backgroundColor: KprimaryColor,
        ));
      } else {
        print("Failed to update profile, status code: ${response.statusCode}");
        print("Response body: ${response.stream.toString()}");
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Row(
            children: [
              Icon(Icons.error, color: Colors.red),
              SizedBox(width: 8),
              Text("Failed to update profile. Please try again."),
            ],
          ),
          backgroundColor: Colors.red,
        ));
      }
    }
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imagePath = pickedFile.path;
        isEdited = true;
      });
    }
  }

  void restoreOriginalValues() {
    setState(() {
      nameController.text = previousName ?? '';
      emailController.text = previousEmail ?? '';
      phoneController.text = previousPhone ?? '';
      imagePath = previousImagePath;
      isEdited = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 15.sp),
          onPressed: () {
            restoreOriginalValues();
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Edit Profile',
          style: GoogleFonts.inter(
            color: Color(0xff2F2F2F),
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            height: 1.0,
            color: Colors.grey.shade300,
          ),
        ),
      ),
      body: isLoading
          ? Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(KprimaryColor),
        ),
      )
          : SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundImage: (imagePath != null && imagePath!.isNotEmpty && File(imagePath!).existsSync())
                          ? FileImage(File(imagePath!))
                          : AssetImage("lib/Assets/Material/user.png") as ImageProvider,
                      radius: screenWidth * 0.21,
                      backgroundColor: Colors.grey.shade200,
                    ),
                    Positioned(
                      right: 0.0,
                      bottom: screenWidth * 0.05,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: KprimaryColor,
                        ),
                        width: screenWidth * 0.090,
                        height: screenWidth * 0.090,
                        child: IconButton(
                          icon: Icon(Icons.mode_edit_outline_outlined, color: Colors.white,size: 16.sp,),
                          onPressed: pickImage,
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenWidth * 0.15),
              buildTextField("Name", nameController, "name", nameError),
              SizedBox(height: screenWidth * 0.01),
              buildTextField("Email", emailController, "Email", emailError),
              SizedBox(height: screenWidth * 0.01),
              buildTextField("Phone", phoneController, "Phone number", phoneError),
              SizedBox(height: screenWidth * 0.05),
              if (isEdited) buildSaveCancelButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller, String hint, String error) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: screenWidth * 0.03,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        SizedBox(height: screenWidth * 0.015),
        Container(
          height: screenWidth * 0.12,
          decoration: BoxDecoration(
            color: Color(0xffFAFAFA),
            borderRadius: BorderRadius.circular(screenWidth * 0.02),
            border: Border.all(
              color: error.isNotEmpty ? Color(0xffE72929) : Color(0xffE9E9E9),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: TextField(
            controller: controller,
            onChanged: (value) {
              setState(() {
                isEdited = true;
              });
            },
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
            ),
            inputFormatters: [
              LengthLimitingTextInputFormatter(15),
            ],
          ),
        ),
        if (error.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(top: screenWidth * 0.01),
            child: Text(
              error,
              style: TextStyle(
                color: Color(0xffE72929),
                fontSize: screenWidth * 0.02,
              ),
            ),
          ),
      ],
    );
  }
  Widget buildSaveCancelButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: restoreOriginalValues,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                vertical: 12.sp,
                horizontal: 40.sp,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.sp),
                side: BorderSide(color: Color(0xffE72929)),
              ),
              backgroundColor: backgroundColor,
            ),
            child: Center(
              child: Text(
                "Cancel",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffE72929),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: ElevatedButton(
            onPressed: isLoading ? null : updateProfile,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                vertical: 12.sp,
                horizontal: 40.sp,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.sp),
              ),
              backgroundColor: KprimaryColor,
            ),
            child: isLoading
                ? CircularProgressIndicator(color: Colors.white)
                : Text(
              "Save",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

}
