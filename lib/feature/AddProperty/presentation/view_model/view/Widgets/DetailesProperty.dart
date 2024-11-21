import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailesProperty extends StatefulWidget {
  final TextEditingController bathroomsController;
  final TextEditingController bedroomsController;
  final TextEditingController sqftController;

  const DetailesProperty({
    Key? key,
    required this.bathroomsController,
    required this.bedroomsController,
    required this.sqftController,
  }) : super(key: key);

  @override
  _DetailesPropertyState createState() => _DetailesPropertyState();
}

class _DetailesPropertyState extends State<DetailesProperty> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final mediaQuery = MediaQuery.of(context);
        final screenWidth = mediaQuery.size.width;

        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: screenWidth * 0.12, // Adjusting the height
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenWidth * 0.015),
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 1.0,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: screenWidth * 0.06,
                          height: screenWidth * 0.06,
                          child: Image.asset(
                            'lib/Assets/Broker/iconoir_bathroom.png.crdownload',
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.01),
                        Expanded(
                          child: TextField(
                            controller: widget.bathroomsController,
                            decoration: InputDecoration(
                              hintText: 'Baths',
                              hintStyle: GoogleFonts.inter(
                                fontSize: screenWidth * 0.03,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff9E9E9E),
                              ),
                              border: InputBorder.none,
                            ),
                            style: GoogleFonts.inter(
                              fontSize: screenWidth * 0.03,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff2F2F2F),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(2),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.05),
                Expanded(
                  child: Container(
                    height: screenWidth * 0.12, // Adjusting the height
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenWidth * 0.015),
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 1.0,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: screenWidth * 0.06,
                          height: screenWidth * 0.06,
                          child: Image.asset(
                            'lib/Assets/Broker/material-symbols-light_bed-outline.png.crdownload',
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.01),
                        Expanded(
                          child: TextField(
                            controller: widget.bedroomsController,
                            decoration: InputDecoration(
                              hintText: 'Beds',
                              hintStyle: GoogleFonts.inter(
                                fontSize: screenWidth * 0.03,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff9E9E9E),
                              ),
                              border: InputBorder.none,
                            ),
                            style: GoogleFonts.inter(
                              fontSize: screenWidth * 0.03,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff2F2F2F),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(2),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.05),
                Expanded(
                  child: Container(
                    height: screenWidth * 0.12, // Adjusting the height
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenWidth * 0.015),
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 1.0,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: screenWidth * 0.06,
                          height: screenWidth * 0.06,
                          child: Image.asset(
                            'lib/Assets/Broker/material-symbols-light_space-dashboard-outline.png.crdownload',
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.01),
                        Expanded(
                          child: TextField(
                            controller: widget.sqftController,
                            textAlign: TextAlign.left,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              hintText: 'Sqft',
                              hintStyle: GoogleFonts.inter(
                                fontSize: screenWidth * 0.03,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff9E9E9E),
                              ),
                              border: InputBorder.none,
                            ),
                            style: GoogleFonts.inter(
                              fontSize: screenWidth * 0.03,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff2F2F2F),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(4),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
