import 'package:building/core/utiles/constans.dart';
import 'package:building/feature/AddProperty/presentation/view_model/view/Widgets/DetailesProperty.dart';
import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Widgets/ButtomSubmit.dart';
import 'Widgets/DropDownField.dart';
import 'Widgets/List.dart';
import 'Widgets/addImage.dart';
import 'package:intl/intl.dart';

class CreateProperty extends StatefulWidget {

  @override
  _CreatePropertyState createState() => _CreatePropertyState();
}

class _CreatePropertyState extends State<CreateProperty> {
  String _propertyType = 'Property Type';
  String _finishingType = 'Finishing';
  TextEditingController _addressController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  final NumberFormat _formatter = NumberFormat.decimalPattern();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _bathroomsController = TextEditingController();
  TextEditingController _bedroomsController = TextEditingController();
  TextEditingController _sqftController = TextEditingController();
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
    _bathroomsController.dispose();
    _bedroomsController.dispose();
    _sqftController.dispose();
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
          'Property Details',
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
                          ),inputFormatters: [
                          LengthLimitingTextInputFormatter(25),
                        ],
                        ),
                      ),
                      SizedBox(height: screenWidth * 0.04),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: buildDropdownField(
                              title: 'Property Type',
                              value: _propertyType,
                              items: propertyes,
                              hint: 'Property Type',
                              onChanged: (value) {
                                setState(() {
                                  _propertyType = value!;
                                });
                              },
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.04),
                          Expanded(
                            child: buildDropdownField(
                              title: 'Finishing Type',
                              value: _finishingType,
                              items: finishing,
                              hint: 'Finishing',
                              onChanged: (value) {
                                setState(() {
                                  _finishingType = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenWidth * 0.04),
                      Text(
                        'I Want To',
                        style: GoogleFonts.inter(
                          fontSize: screenWidth * 0.03,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff2F2F2F),
                        ),
                      ),
                      SizedBox(height: screenWidth * 0.02),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => selectOption('Sell'),
                              child: Row(
                                children: [
                                  Container(
                                    height: 12,
                                    width: 12,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: selectedOption == 'Sell' ?KprimaryColor : Colors.grey.shade300,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text('Sell', style: GoogleFonts.inter(
                                    fontSize: screenWidth * 0.03,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff2F2F2F),
                                  ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Expanded(
                            child: GestureDetector(
                              onTap: () => selectOption('Rent'),
                              child: Row(
                                children: [
                                  Container(
                                    height: 12,
                                    width: 12,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: selectedOption == 'Rent' ? Colors.green : Colors.grey.shade300,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text('Rent', style: GoogleFonts.inter(
                                    fontSize: screenWidth * 0.03,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff2F2F2F),
                                  ),),
                                ],
                              ),
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
                                      hintText: '0.000.000',
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
                      DetailesProperty(
                        bathroomsController: _bathroomsController,
                        bedroomsController: _bedroomsController,
                        sqftController: _sqftController,
                      ),
                      SizedBox(height: screenWidth * 0.02),
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
                child: ButtomCreateProperty(
                  imagesSelected: _imagesSelected,
                  imageFiles: _imageFiles,
                  description: _descriptionController.text,
                  price: int.tryParse(_priceController.text.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0,
                  address:_addressController.text,
                  title: _titleController.text,
                  propertyType: _propertyType,
                  finishingType: _finishingType,
                  phoneController: _phoneController.text,
                  bathroomsController: int.tryParse(_bathroomsController.text) ?? 0,
                  bedroomsController: int.tryParse(_bedroomsController.text) ?? 0,
                  sqftController: int.tryParse(_sqftController.text) ?? 0,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
