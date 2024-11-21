import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../core/utiles/constans.dart';
import '../../../../../../core/utiles/Assets_Data.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:cool_alert/cool_alert.dart'; // مكتبة CoolAlert

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  late double screenWidth;
  late double screenHeight;

  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  String nameError = '';
  String emailError = '';
  String phoneError = '';
  bool isLoading = false;
  bool isButtonVisible = false;

  @override
  void initState() {
    super.initState();
    fetchProfileData();
    _descriptionController.addListener(_checkForComment);
  }

  Future<void> fetchProfileData() async {
    setState(() => isLoading = true);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) return;

    final response = await http.get(
      Uri.parse('https://einv.wa.dvtst.com/public/api/profile/index'),
      headers: {'Authorization': 'Bearer $token'},
    );

    setState(() => isLoading = false);

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      setState(() {
        emailController.text = responseBody['data']['user']['email'];
        nameController.text = responseBody['data']['user']['name'];
        phoneController.text = responseBody['data']['user']['phone'];
      });
    }
  }

  void _checkForComment() {
    setState(() {
      isButtonVisible = _descriptionController.text.isNotEmpty;
    });
  }

  Future<void> sendMessage() async {
    setState(() => isLoading = true);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      setState(() => isLoading = false);
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        text: "Token is missing, please log in again.",
      );
      return;
    }

    CoolAlert.show(
      context: context,
      type: CoolAlertType.loading,
      text: "Sending your message...",
      barrierDismissible: false,
    );

    try {
      final response = await http.post(
        Uri.parse('https://einv.wa.dvtst.com/public/api/contact'),
        headers: {'Authorization': 'Bearer $token'},
        body: {
          'message': _descriptionController.text, // إرسال الرسالة فقط
        },
      );

      setState(() => isLoading = false);
      Navigator.pop(context);

      if (response.statusCode == 200) {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          text: "Your message has been sent successfully!",
          onConfirmBtnTap: () => Navigator.pop(context),
        );
      } else {
        final responseBody = jsonDecode(response.body);
        CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          text: "Failed to send the message: ${responseBody['message'] ?? 'Unknown error'}",
        );
        print("Error response: ${responseBody}");
      }
    } catch (e) {
      setState(() => isLoading = false);
      Navigator.pop(context);
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        text: "An error occurred: $e, please try again later.",
      );
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 15.sp),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        title: Text(
          'Contact Us',
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
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  AssetsData.Logo,
                  width: screenWidth * 0.25,
                ),
              ),
              SizedBox(height: screenWidth * 0.05),
              buildTextField("Name", nameController, "name", nameError, isEditable: false),
              SizedBox(height: screenWidth * 0.01),
              buildTextField("Email", emailController, "Email", emailError, isEditable: false),
              SizedBox(height: screenWidth * 0.01),
              buildTextField("Phone", phoneController, "Phone number", phoneError, isEditable: false),
              SizedBox(height: screenWidth * 0.05),
              Text(
                "Send a Message",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 6.h),
              Container(
                height: screenWidth * 0.3,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                decoration: BoxDecoration(
                  color: Color(0xffFAFAFA),
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Color(0xffE9E9E9), width: 1.0),
                ),
                child: TextField(
                  controller: _descriptionController,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintStyle: GoogleFonts.inter(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff9E9E9E),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                  style: GoogleFonts.inter(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff2F2F2F),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Visibility(
                visible: isButtonVisible,
                child: ElevatedButton(
                  onPressed: sendMessage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: KprimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                  child: SizedBox(
                    height: screenWidth * 0.12,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'Send',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontFamily: GoogleFonts.inter().fontFamily,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller, String hint, String error, {bool isEditable = true}) {
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
        SizedBox(height: 6.h),
        Container(
          height: screenWidth * 0.12,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: Color(0xffF1F1F1),
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(
              color: Colors.grey.shade300,
              width: 1.0,
            ),
          ),
          child: TextField(
            controller: controller,
            enabled: isEditable,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: GoogleFonts.inter(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xff9E9E9E),
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 12.h),
            ),
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xff2F2F2F),
            ),
          ),
        ),
      ],
    );
  }
}
