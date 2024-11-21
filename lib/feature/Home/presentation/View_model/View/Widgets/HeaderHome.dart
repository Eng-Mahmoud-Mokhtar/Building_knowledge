import 'dart:io';
import 'package:building/feature/Favorites/presentation/view_model/views/Favorites.dart';
import 'package:building/feature/Home/Cubit/HeaderCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../core/utiles/constans.dart';
import '../../../../../Rent/presentation/view_model/views/Rent.dart';
import '../../../../Cubit/HeaderState.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<HeaderCubit>().fetchHeaderData();
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocListener<HeaderCubit, HeaderState>(
      listener: (context, state) {
        context.read<HeaderCubit>().fetchHeaderData();
      },
      child: BlocBuilder<HeaderCubit, HeaderState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: (state.imagePath != null && File(state.imagePath!).existsSync())
                    ? FileImage(File(state.imagePath!))
                    : const AssetImage("lib/Assets/Material/user.png") as ImageProvider,
                radius: screenWidth * 0.055,
                backgroundColor: Colors.grey.shade200,
              ),
              SizedBox(width: 10.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, ${state.name}!',
                    style: GoogleFonts.inter(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff2F2F2F),
                    ),
                  ),
                  Text(
                    'Let’s start with rently',
                    style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff9E9E9E),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FavoritePage(favoriteApartments: favoriteApartments),
                    ),
                  ).then((_) {
                    context.read<HeaderCubit>().fetchHeaderData();
                  });
                },
                icon: Icon(Icons.favorite_border, size: 24.sp, color: KprimaryColor),
              ),
            ],
          );
        },
      ),
    );
  }
}
