import 'dart:io';
import 'package:building/feature/Favorites/presentation/view_model/views/Favorites.dart';
import 'package:building/feature/Profile/presentation/view_model/views/Widgets/widgets.dart';
import 'package:building/feature/Rent/presentation/view_model/views/Rent.dart';
import 'package:building/feature/Subscribe/presentation/view_model/views/Subscribe.dart';
import 'package:building/feature/login/presentation/view_model/views/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utiles/Assets_Data.dart';
import '../../../../login/Cubit/login_cubit.dart';
import '../../../Cubit/ProfileCubit.dart';
import '../../../Cubit/ProfileState.dart';
import '../../../../PrivacyPolicy/presentation/view_model/views/Widgets/privacy_policy_screen.dart';
import '../../../../TermsCondition/presentation/view_model/views/Widgets/terms_conditions_screen.dart';
import '../../../../AboutUs/presentation/view_model/views/Widgets/about_us_screen.dart';
import '../../../../ContentUs/presentation/view_model/views/Widgets/contact_us_screen.dart';
import '../../../../Edit_Profile/presentation/view_model/views/edit_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<void> pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      context.read<ProfileCubit>().updateProfileImage(pickedFile.path);
    }
  }
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<ProfileCubit>().fetchProfileData();
  }

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          context.read<ProfileCubit>().fetchProfileData();
        },
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.02),
                    buildProfileContainer(
                      label: state.name,
                      imagePath: state.imagePath,
                      Edit: "Edit Profile",
                      iconPath: 'lib/Assets/images/profile.png',
                      onPressed: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => EditProfile(),
                          ),
                        );
                        context.read<ProfileCubit>().fetchProfileData();
                      },
                      pickImage: () => pickImage(context),
                      context: context,
                    ),
                    Divider(
                      color: Color(0xffe7e6e6),
                      thickness: 1.5,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    buildProfileButton(
                      label: "Post Ad",
                      iconPath: 'lib/Assets/images/multiple.png',
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Subscribe(),
                          ),
                        );
                      },
                      context: context,
                    ),
                    // buildProfileButton(
                    //   label: "Add Property",
                    //   iconPath: 'lib/Assets/Services/Vectorss(5).png',
                    //   onPressed: () {
                    //     Navigator.of(context).push(
                    //       MaterialPageRoute(
                    //         builder: (context) => Subscribe(),
                    //       ),
                    //     );
                    //   },
                    //   context: context,
                    // ),
                    SizedBox(height: screenHeight * 0.025),
                    buildProfileButton(
                      label: "Contact us",
                      iconPath:
                      'lib/Assets/new/icons8-phone-100.png',
                      // Replace with your icon path
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ContactUsScreen(),
                          ),
                        );
                      },
                      context: context,
                    ),
                    SizedBox(height: screenHeight * 0.025),
                    buildProfileButton(
                      label: "Manage Favorites",
                      iconPath: 'lib/Assets/new/icons8-favorite-100.png',
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                FavoritePage(
                                    favoriteApartments: favoriteApartments),
                          ),
                        );
                      },
                      context: context,
                    ),
                    SizedBox(height: screenHeight * 0.025),
                    buildProfileButton(
                      label: "Rate Us",
                      iconPath:
                      'lib/Assets/new/icons8-edit-property-100.png',
                      // Replace with your icon path
                      onPressed: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => ContactUsScreen(),
                        //   ),
                        // );
                      },
                      context: context,
                    ),
                    SizedBox(height: screenHeight * 0.025),
                    buildProfileButton(
                      label: "About us",
                      iconPath:
                      'lib/Assets/new/icons8-error-100.png',
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AboutUsScreen(),
                          ),
                        );
                      },
                      context: context,
                    ),
                    SizedBox(height: screenHeight * 0.025),
                    buildProfileButton(
                      label: "Terms and conditions",
                      iconPath:
                      'lib/Assets/new/icons8-terms-and-conditions-96.png',
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => TermsConditionsScreen(),
                          ),
                        );
                      },
                      context: context,
                    ),
                    SizedBox(height: screenHeight * 0.025),
                    buildProfileButton(
                      label: "Privacy Policy",
                      iconPath:
                      'lib/Assets/images/Vector222 (2).png',
                      // Replace with your icon path
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PrivacyScreen(),
                          ),
                        );
                      },
                      context: context,
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20), // حواف مستديرة
                              ),
                              elevation: 10, // تأثير الظل
                              backgroundColor: Colors.white, // خلفية بيضاء
                              child: Padding(
                                padding: EdgeInsets.all(24), // حشو داخلي
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // محاذاة الصورة في المنتصف
                                  children: [
                                    Image.asset(
                                      AssetsData.Logo,
                                      width: 60.w,
                                      height: 60.h,
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      'Are you sure you want to log out ?',
                                      style: GoogleFonts.inter(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 20),
                                    ElevatedButton(
                                      onPressed: () {
                                        context.read<LoginCubit>()
                                            .logout()
                                            .then((_) {
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) => Login()),
                                          );
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xffE72929),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 12),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              8),
                                        ),
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        height: screenWidth * 0.06,
                                        child: Center(
                                          child: Text(
                                            'Yes',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 12),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        'Cancel',
                                        style: TextStyle(
                                          color: Color(0xffE72929),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: screenWidth * 0.12,
                        decoration: BoxDecoration(
                          color: Color(0xffE72929),
                          borderRadius: BorderRadius.circular(
                              screenWidth * 0.02),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.logout,
                              color: Colors.white,
                              size: 16.sp,
                            ),
                            SizedBox(width: screenWidth * 0.012),
                            Text(
                              "Log out",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildProfileContainer({
    required BuildContext context,
    required String label,
    required String Edit,
    required String iconPath,
    required VoidCallback onPressed,
    required String? imagePath,
    required VoidCallback pickImage,
  }) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.03),
        child: Row(
          children: [
            GestureDetector(
              onTap: pickImage,
              child: CircleAvatar(
                backgroundImage: (imagePath != null &&
                    File(imagePath).existsSync())
                    ? FileImage(File(imagePath))
                    : AssetImage(
                    "lib/Assets/Material/user.png") as ImageProvider,
                radius: screenWidth * 0.07,
                backgroundColor: Colors.grey.shade200,
              ),
            ),
            SizedBox(width: screenWidth * 0.03),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: GoogleFonts.inter(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    Edit,
                    style: GoogleFonts.inter(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff9E9E9E),
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: screenWidth * 0.04,
                color: Color(0xff2F2F2F)),
          ],
        ),
      ),
    );
  }
}

