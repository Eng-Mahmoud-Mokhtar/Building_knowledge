import 'dart:io';
import 'package:building/feature/AddProperty/presentation/view_model/view/FullScreenPost.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:building/core/utiles/constans.dart';
import 'package:readmore/readmore.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../Home/presentation/View_model/View/Home.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

import '../../../../RealEstateFinance/presentation/view_model/views/Widget/ShowHome.dart';

class PostedMaterial extends StatefulWidget {
  final List<String> imagePaths;
  final String description;
  final String phoneController;
  final int price;
  final String address;
  final String title;
  final String brandController;

  const PostedMaterial({
    Key? key,
    required this.brandController,
    required this.imagePaths,
    required this.description,
    required this.title,
    required this.phoneController,
    required this.address,
    required this.price,
  }) : super(key: key);

  @override
  _PostedMaterialState createState() => _PostedMaterialState();
}

class _PostedMaterialState extends State<PostedMaterial> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  final NumberFormat currencyFormat = NumberFormat('#,##0');
  late TextEditingController phoneController;
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentIndex = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  Future<void> shareContentWithImage() async {
    if (widget.imagePaths.isEmpty) return;
    final imagePath = widget.imagePaths[0];
    try {
      final byteData = await rootBundle.load(imagePath);
      final tempDir = await getTemporaryDirectory();
      final file = File('${tempDir.path}/shared_image.jpg');
      await file.writeAsBytes(byteData.buffer.asUint8List(
          byteData.offsetInBytes, byteData.lengthInBytes));
      final adContent = '''
     ${widget.title}\n
     ${widget.address} \n
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
    int dotsCount = widget.imagePaths.length > 1
        ? (widget.imagePaths.length > 3 ? 3 : 2)
        : 0;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: screenWidth * 0.04),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Home()),
                  (route) => false,
            );
          },
        ),
        title: Text(
          'Material Detailes',
          style: GoogleFonts.inter(
            color: Color(0xff2F2F2F),
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: screenWidth * 0.50,
                  child: Stack(
                    children: [
                      PageView.builder(
                        controller: _pageController,
                        itemCount: widget.imagePaths.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => FullScreenPost(
                                    name: widget.title,
                                    imageUrls: widget.imagePaths,
                                    initialIndex: index,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      FileImage(File(widget.imagePaths[index])),
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
                                  onPressed: () {},
                                ),
                              ),
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
                                  '${currencyFormat.format(widget.price)} EGP',
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
            SizedBox(height: 15.h),
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
                              '${widget.title} - ${widget.brandController}',
                              style: GoogleFonts.inter(
                                fontSize: 18.sp,
                                color: Color(0xff2F2F2F),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              launch('tel:${widget.phoneController}');
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
                              final formattedNumber = widget.phoneController.startsWith('0')
                                  ? widget.phoneController.replaceFirst('0', '+20')
                                  : '+20${widget.phoneController}';

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
                        '${widget.address}',
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
