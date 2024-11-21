import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/utiles/constans.dart';

class AddImage extends StatefulWidget {
  final Function(bool) onImagesSelected;
  final Function(List<XFile>) onImageFilesChanged;

  const AddImage({Key? key, required this.onImagesSelected, required this.onImageFilesChanged}) : super(key: key); // تعديل هنا

  @override
  _AddImageState createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _imageFiles = [];

  Future<void> _pickImages() async {
    if (_imageFiles!.length >= 10) {
      return;
    }
    final List<XFile>? pickedFiles = await _picker.pickMultiImage(
      imageQuality: 80,
      maxWidth: 800,
    );

    if (pickedFiles != null) {
      if (_imageFiles!.length + pickedFiles.length > 10) {
        int availableSlots = 10 - _imageFiles!.length;
        setState(() {
          _imageFiles!.addAll(pickedFiles.take(availableSlots));
        });
      } else {
        setState(() {
          _imageFiles!.addAll(pickedFiles);
        });
      }
      widget.onImagesSelected(_imageFiles!.isNotEmpty);
      widget.onImageFilesChanged(_imageFiles!);
    }
  }

  void _removeImage(int index) {
    setState(() {
      _imageFiles!.removeAt(index);
    });
    widget.onImagesSelected(_imageFiles!.isNotEmpty);
    widget.onImageFilesChanged(_imageFiles!);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(top: screenWidth * 0.02, bottom: screenWidth * 0.02),
          child: RichText(
            text: TextSpan(
              text: 'Property Images ',
              style: GoogleFonts.inter(
                fontSize: screenWidth * 0.03,
                color: Color(0xff2F2F2F),
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                  text: '(Max 10 Photos)',
                  style: GoogleFonts.inter(
                    fontSize: screenWidth * 0.03,
                    color: Color(0xffE72929),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: _pickImages,
          child: DottedBorder(
            dashPattern: [5, 4],
            strokeWidth: 2,
            strokeCap: StrokeCap.round,
            borderType: BorderType.RRect,
            color: KprimaryColor,
            radius: Radius.circular(8.r),
            child: Container(
              height: screenWidth * 0.15,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: screenWidth * 0.06,
                      height: screenWidth * 0.06,
                      child: Image.asset(
                        'lib/Assets/Broker/hugeicons_image-add-01.png',
                        fit: BoxFit.contain,

                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      'Upload Image',
                      style: GoogleFonts.inter(
                        fontSize: screenWidth * 0.03,
                        color: Color(0xff9E9E9E),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: screenWidth * 0.04),
        LayoutBuilder(
          builder: (context, constraints) {
            final itemWidth = (constraints.maxWidth - 6.w * 4) / 3;
            final itemHeight = itemWidth * 1.2;

            return Wrap(
              spacing: 10.w,
              runSpacing: 10.h,
              children: _imageFiles!.asMap().entries.map((entry) {
                int index = entry.key;
                XFile file = entry.value;
                return Container(
                  width: itemWidth,
                  height: itemHeight,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Image.file(
                          File(file.path),
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: KprimaryColor,
                            ),
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () => _removeImage(index),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffE72929),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            padding: EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 16.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }
}
