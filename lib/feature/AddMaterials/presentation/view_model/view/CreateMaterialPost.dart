import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Widgets/ButtomSubmit.dart';
import 'Widgets/addImage.dart';
import 'package:intl/intl.dart';

class CreateMaterialPost extends StatefulWidget {

  @override
  _CreateMaterialPostState createState() => _CreateMaterialPostState();
}

class _CreateMaterialPostState extends State<CreateMaterialPost> {
  TextEditingController _addressController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _brandController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  final NumberFormat _formatter = NumberFormat.decimalPattern();
  TextEditingController _descriptionController = TextEditingController();
  bool _imagesSelected = false;
  List<XFile> _imageFiles = [];
  String? selectedOption;
  void selectOption(String option) {
    setState(() {
      selectedOption = option;
    });
  }
  @override
  void initState() {
    super.initState();
    _priceController.addListener(_formatPrice);
  }
  void _formatPrice() {
    String text = _priceController.text.replaceAll('.', '');
    if (text.isNotEmpty) {
      _priceController.value = TextEditingValue(
        text: _formatter.format(int.parse(text)),
        selection: TextSelection.collapsed(offset: _formatter.format(int.parse(text)).length),
      );
    }
  }
  @override
  void dispose() {
    _addressController.dispose();
    _titleController.dispose();
    _phoneController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _updateImageSelection(bool selected) {
    setState(() {
      _imagesSelected = selected;
    });
  }

  void _handleImageFilesChanged(List<XFile> imageFiles) {
    setState(() {
      _imageFiles = imageFiles;
      _updateImageSelection(_imageFiles.isNotEmpty);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: screenWidth * 0.04),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: Text(
          'Material Details',
          style: GoogleFonts.inter(
            color: Color(0xff2F2F2F),
            fontSize: screenWidth * 0.04,
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Title',
                                  style: GoogleFonts.inter(
                                    fontSize: screenWidth * 0.03,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff2F2F2F),
                                  ),
                                ),
                                SizedBox(height: screenWidth * 0.02),
                                Container(
                                  height: screenWidth * 0.12,
                                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                                  decoration: BoxDecoration(
                                    color: Color(0xffFAFAFA),
                                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: TextField(
                                    controller: _titleController,
                                    decoration: InputDecoration(
                                      hintText: 'Enter Title',
                                      hintStyle: GoogleFonts.inter(
                                        fontSize: screenWidth * 0.03,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff9E9E9E),
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(vertical: screenWidth * 0.037),
                                    ),
                                    style: GoogleFonts.inter(
                                      fontSize: screenWidth * 0.03,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff2F2F2F),
                                    ),
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(10),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.04),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Brand',
                                  style: GoogleFonts.inter(
                                    fontSize: screenWidth * 0.03,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff2F2F2F),
                                  ),
                                ),
                                SizedBox(height: screenWidth * 0.02),
                                Container(
                                  height: screenWidth * 0.12,
                                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                                  decoration: BoxDecoration(
                                    color: Color(0xffFAFAFA),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: TextField(
                                    controller: _brandController,
                                    decoration: InputDecoration(
                                      hintText: 'Brand Name',
                                      hintStyle: GoogleFonts.inter(
                                        fontSize: screenWidth * 0.03,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff9E9E9E),
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(vertical: screenWidth * 0.037),
                                    ),
                                    style: GoogleFonts.inter(
                                      fontSize: screenWidth * 0.03,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff2F2F2F),
                                    ),
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(10),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenWidth * 0.04),
                      Text(
                        'Location',
                        style: GoogleFonts.inter(
                          fontSize: screenWidth * 0.03,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff2F2F2F),
                        ),
                      ),
                      SizedBox(height: screenWidth * 0.02),
                      Container(
                        height: screenWidth * 0.12,
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                        decoration: BoxDecoration(
                          color: Color(0xffFAFAFA),
                          borderRadius: BorderRadius.circular(screenWidth * 0.02),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1.0,
                          ),
                        ),
                        child: TextField(
                          controller: _addressController,
                          decoration: InputDecoration(
                            hintText: 'Enter Location',
                            hintStyle: GoogleFonts.inter(
                              fontSize: screenWidth * 0.03,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff9E9E9E),
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: screenWidth * 0.037),
                          ),
                          style: GoogleFonts.inter(
                            fontSize: screenWidth * 0.03,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff2F2F2F),
                          ),inputFormatters: [
                          LengthLimitingTextInputFormatter(20),
                        ],
                        ),
                      ),
                      SizedBox(height: screenWidth * 0.04),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Price',
                                  style: GoogleFonts.inter(
                                    fontSize: screenWidth * 0.03,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff2F2F2F),
                                  ),
                                ),
                                SizedBox(height: screenWidth * 0.02),
                                Container(
                                  height: screenWidth * 0.12,
                                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                                  decoration: BoxDecoration(
                                    color: Color(0xffFAFAFA),
                                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: TextField(
                                    controller: _priceController,
                                    decoration: InputDecoration(
                                      hintText: '000.000',
                                      hintStyle: GoogleFonts.inter(
                                        fontSize: screenWidth * 0.03,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff9E9E9E),
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(vertical: screenWidth * 0.037),
                                    ),
                                    style: GoogleFonts.inter(
                                      fontSize: screenWidth * 0.03,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff2F2F2F),
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(10),
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.04),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Phone',
                                  style: GoogleFonts.inter(
                                    fontSize: screenWidth * 0.03,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff2F2F2F),
                                  ),
                                ),
                                SizedBox(height: screenWidth * 0.02),
                                Container(
                                  height: screenWidth * 0.12,
                                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                                  decoration: BoxDecoration(
                                    color: Color(0xffFAFAFA),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: TextField(
                                    controller: _phoneController,
                                    decoration: InputDecoration(
                                      hintText: 'Phone Number',
                                      hintStyle: GoogleFonts.inter(
                                        fontSize: screenWidth * 0.03,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff9E9E9E),
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(vertical: screenWidth * 0.037),
                                    ),
                                    style: GoogleFonts.inter(
                                      fontSize: screenWidth * 0.03,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff2F2F2F),
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(11),
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: screenWidth * 0.04),
                      Padding(
                        padding: EdgeInsets.only(top: screenWidth * 0.04, bottom: screenWidth * 0.02),
                        child: Text(
                          'Description',
                          style: GoogleFonts.inter(
                            fontSize: screenWidth * 0.03,
                            color: Color(0xff2F2F2F),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        height: screenWidth * 0.3,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                        decoration: BoxDecoration(
                          color: Color(0xffFAFAFA),
                          borderRadius: BorderRadius.circular(screenWidth * 0.02),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1.0,
                          ),
                        ),
                        child: TextField(
                          controller: _descriptionController,
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: 'Enter description',
                            hintStyle: GoogleFonts.inter(
                              fontSize: screenWidth * 0.03,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff9E9E9E),
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
                          ),
                          style: GoogleFonts.inter(
                            fontSize: screenWidth * 0.03,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff2F2F2F),
                          ),
                        ),
                      ),
                      SizedBox(height: screenWidth * 0.04),
                      AddImage(
                        onImagesSelected: _updateImageSelection,
                        onImageFilesChanged: _handleImageFilesChanged,
                      ),
                      SizedBox(height: screenHeight * 0.1),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomStart,
                child: ButtomCreateMaterial(
                  imagesSelected: _imagesSelected,
                  imageFiles: _imageFiles,
                  description: _descriptionController.text,
                  brandController:_brandController.text,
                  price: int.tryParse(_priceController.text.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0,
                  address:_addressController.text,
                  title: _titleController.text,
                  phoneController: _phoneController.text,
                  ),
              ),
            ],
          );
        },
      ),
    );
  }
}
