import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:building/core/utiles/constans.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

import '../../../../RealEstateFinance/presentation/view_model/views/Widget/ShowHome.dart';
import 'Widgets/ScreenMaterial.dart';
class Material_Detailes extends StatefulWidget {
  final String type;
  final List<String> images;
  final String location;
  final String address;
  final String price;
  final String description;
  final String ownerNumber;

  const Material_Detailes({
    Key? key,
    required this.type,
    required this.images,
    required this.address,
    required this.location,
    required this.price,
    required this.ownerNumber,
    required this.description,

  }) : super(key: key);
  @override
  _Material_DetailesState createState() => _Material_DetailesState();
}
class _Material_DetailesState extends State<Material_Detailes> {
  @override
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentIndex = _pageController.page!.round();
      });
    });
  }

  Future<void> shareContentWithImage() async {
    if (widget.images.isEmpty) return;
    final imagePath = widget.images[0];
    try {
      final byteData = await rootBundle.load(imagePath);
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/shared_image.jpg');
      await file.writeAsBytes(byteData.buffer.asUint8List(
          byteData.offsetInBytes, byteData.lengthInBytes));
      final adContent = '''
     ${widget.type}\n
     ${widget.location}, ${widget.address} \n
     ${widget.price} EGP
    ''';
      await Share.shareFiles([file.path], text: adContent);
    } catch (e) {
      print("Error sharing image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int dotsCount = widget.images.length > 1
        ? (widget.images.length > 3 ? 3 : 2)
        : 0;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 15.sp),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: Text(
          'Material Detailes',
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
        ),      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: screenWidth * 0.50,
                  child: Stack(
                    children: [
                      PageView.builder(
                        controller: _pageController,
                        itemCount: widget.images.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ScreenMaterial(
                                    name: widget.type,
                                    imageUrls: widget.images,
                                    initialIndex: index,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                  AssetImage(widget.images[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      IgnorePointer(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                                Colors.black.withOpacity(0.1),
                                Colors.black.withOpacity(0.8),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 15,
                        top: 15,
                        child: Container(
                          width: screenWidth * 0.1,
                          height: screenWidth * 0.1,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: AspectRatio(
                                aspectRatio: 1.3,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.share_outlined,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                    onPressed: shareContentWithImage,
                                  ),
                                )
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        child: Row(
                          children: [
                            Container(
                              width: 2.w,
                              height: screenWidth * 0.15,
                              color: Color(0xffF08200),
                            ),
                            SizedBox(width: 15.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Price',
                                  style: GoogleFonts.inter(
                                    fontSize: 10.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  '${(widget.price)} EGP',
                                  style: GoogleFonts.inter(
                                    fontSize: 18.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h), // Optional spacing
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      dotsCount > 3 ? 3 : dotsCount,
                          (index) {
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          width: 24,
                          height: 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: _currentIndex % 3 == index
                                ? KprimaryColor
                                : Color(0xffE9E9E9),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '${widget.type}',
                              style: GoogleFonts.inter(
                                fontSize: 18.sp,
                                color: Color(0xff2F2F2F),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              launch('tel:${widget.ownerNumber}');
                            },
                            child: Container(
                              width: screenWidth * 0.1,
                              height: screenWidth * 0.1,
                              decoration: BoxDecoration(
                                color: Color(0xffE6F7EF),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.phone_outlined,
                                  size: 18,
                                  color: KprimaryColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          GestureDetector(
                            onTap: () {
                              final formattedNumber = widget.ownerNumber.startsWith('0')
                                  ? widget.ownerNumber.replaceFirst('0', '+20')
                                  : '+20${widget.ownerNumber}';

                              final message = 'Hello, I would like to inquire about the property.';
                              final whatsappUrl = 'https://wa.me/$formattedNumber?text=${Uri.encodeComponent(message)}';
                              launch(whatsappUrl);
                            },
                            child: Container(
                              width: screenWidth * 0.1,
                              height: screenWidth * 0.1,
                              decoration: BoxDecoration(
                                color: Color(0xff06cd46e),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: AspectRatio(
                                  aspectRatio: 2,
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Image.asset('lib/Assets/FeatureApartment/logos_whatsapp-icon.png'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${widget.address} , ${widget.location}',
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          color: Color(0xff9E9E9E),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        'Description',
                        style: GoogleFonts.inter(
                          color: Color(0xff2F2F2F),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      ReadMoreText(
                        widget.description,
                        trimLines: 2,
                        colorClickableText: Color(0xffF08200),
                        trimMode: TrimMode.Line,
                        style: GoogleFonts.inter(
                          fontSize: 13.sp,
                          color: Color(0xff2F2F2F),
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 20.h),
                      Text('Suggested for you' ,style: GoogleFonts.inter(
                        color: Color(0xff2F2F2F),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),),
                      SizedBox(height: 10.h),
                      ShowHome(),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
