import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../ResetPasswords/presentation/view_model/views/Forget_password.dart';

class RememberPage extends StatefulWidget {
  const RememberPage({super.key});

  @override
  State<RememberPage> createState() => _RememberPageState();
}

bool rememberMe = false;

class _RememberPageState extends State<RememberPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final checkboxSize = screenWidth > 400 ? 24.0 : screenWidth * 0.06;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.04,right: screenWidth * 0.02 ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: checkboxSize,
                height: checkboxSize,
                child: Checkbox(
                  value: rememberMe,
                  onChanged: (bool? value) {
                    if (value != null) {
                      setState(() {
                        rememberMe = value;
                      });
                    }
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.01), // نسبة تقريبية لـ 4/400
                  ),
                  side: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                  fillColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.selected)) {
                        return const Color(0xff00AA5B);
                      }
                      return null;
                    },
                  ),
                  checkColor: Colors.white,
                ),
              ),
              Text(
                'Remember Me',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: screenWidth * 0.03, // نسبة تقريبية لـ 12/400
                  color: const Color(0xff00AA5B),
                  fontFamily: GoogleFonts.inter().fontFamily,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ForgotPassword()),
                  );
                },
                child: Text(
                  'Forgot Password!',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: screenWidth * 0.03, // نسبة تقريبية لـ 12/400
                    color: const Color(0xff00AA5B),
                    fontFamily: GoogleFonts.inter().fontFamily,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
