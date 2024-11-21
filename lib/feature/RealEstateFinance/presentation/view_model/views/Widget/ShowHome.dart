import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'RealStateProperty.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:building/core/utiles/constans.dart';

class RealStateApartment {
  final List<String> images;
  final String name;
  final String type;
  final String location;
  final String address;
  final int baths;
  final int beds;
  final int size;
  final String price;
  final String finishingType;
  final String ownerNumber;
  final String description;
  bool isFavorite;
  RealStateApartment({
    required this.images,
    required this.name,
    required this.type,
    required this.location,
    required this.address,
    required this.baths,
    required this.beds,
    required this.size,
    required this.price,
    required this.description,
    required this.finishingType,
    required this.ownerNumber,
    this.isFavorite = false,
  });
}
List<RealStateApartment> favoriteApartments = [];
class ShowHome extends StatefulWidget {
  @override
  State<ShowHome> createState() => _ShowHomeState();
}
class _ShowHomeState extends State<ShowHome> {
  bool isFavorite = false;
  final List<RealStateApartment> apartments = [
    RealStateApartment(
      name: 'Luxury Apartment',
      type: 'Apartment',
      images: [
        'lib/Assets/Building/square-rectangle-box-banner-emblem-graphic.jpg',
        'lib/Assets/Building/IMG-20241026-WA0002.jpg',
        'lib/Assets/Building/3d-rendering-beautiful-comtemporary-luxury-bedroom-suite-hotel-with-tv.jpg',
        'lib/Assets/Building/3d-rendering-loft-luxury-living-room-with-bookshelf.jpg',
        'lib/Assets/Building/3d-rendering-vintage-colorful-living-room-with-retro-style.jpg'
            'lib/Assets/Building/3d-rendering-beautiful-comtemporary-luxury-bedroom-suite-hotel-with-tv.jpg',
      ],
      location: 'Cairo',
      address: 'Street, 15',
      baths: 2,
      beds: 4,
      size: 180,
      price: '4,200,000',
      description: '''Experience luxury living with stunning city views and modern amenities. Explore financing options to make this your dream home!''',
      finishingType: 'Not Finishing',
      ownerNumber:'01017900067',
    ),
    RealStateApartment(
      name: 'Cozy Apartment',
      type: 'Apartment',
      images: [
        'lib/Assets/Building/3d-rendering-house-model.jpg',
        'lib/Assets/Building/IMG-20241026-WA0002.jpg',
        'lib/Assets/Building/3d-rendering-beautiful-comtemporary-luxury-bedroom-suite-hotel-with-tv.jpg',
        'lib/Assets/Building/3d-rendering-loft-luxury-living-room-with-bookshelf.jpg',
        'lib/Assets/Building/3d-rendering-vintage-colorful-living-room-with-retro-style.jpg'
            'lib/Assets/Building/3d-rendering-beautiful-comtemporary-luxury-bedroom-suite-hotel-with-tv.jpg',      ],
      location: 'Alexandria',
      address: 'Coastal Road',
      baths: 1,
      beds: 2,
      size: 90,
      price: '600,000',
      description: 'Enjoy beachfront living with affordable financing options. Perfect for relaxation and family gatherings!',
      finishingType: 'Finished',
      ownerNumber:'01017900067',
    ),
    RealStateApartment(
      name: 'Elegant Villa',
      type: 'Villa',
      images: [
        'lib/Assets/Building/3d-rendering-house-model (1).jpg',
        'lib/Assets/Building/IMG-20241026-WA0002.jpg',
        'lib/Assets/Building/3d-rendering-beautiful-comtemporary-luxury-bedroom-suite-hotel-with-tv.jpg',
        'lib/Assets/Building/3d-rendering-loft-luxury-living-room-with-bookshelf.jpg',
        'lib/Assets/Building/3d-rendering-vintage-colorful-living-room-with-retro-style.jpg'
            'lib/Assets/Building/3d-rendering-beautiful-comtemporary-luxury-bedroom-suite-hotel-with-tv.jpg',      ],
      location: 'Giza',
      address: 'Green District',
      baths: 3,
      beds: 5,
      size: 250,
      price: '8,000,000',
      description: '''An elegant villa in a serene neighborhood with flexible financing options. Your perfect family home awaits!''',
      finishingType: 'Not Finishing',
      ownerNumber:'01017900067',
    ),
    RealStateApartment(
      name: 'Modern Apartment',
      type: 'Apartment',
      images: [
        'lib/Assets/Building/design.jpg',
        'lib/Assets/Building/IMG-20241026-WA0002.jpg',
        'lib/Assets/Building/3d-rendering-beautiful-comtemporary-luxury-bedroom-suite-hotel-with-tv.jpg',
        'lib/Assets/Building/3d-rendering-loft-luxury-living-room-with-bookshelf.jpg',
        'lib/Assets/Building/3d-rendering-vintage-colorful-living-room-with-retro-style.jpg'
            'lib/Assets/Building/3d-rendering-beautiful-comtemporary-luxury-bedroom-suite-hotel-with-tv.jpg',      ],
      location: 'New Cairo',
      address: 'Downtown Area',
      baths: 2,
      beds: 3,
      size: 120,
      price: '2,800,000',
      description: 'A modern apartment ideal for city living with easy financing solutions. Schedule a visit today!',
      finishingType: 'Semi_Finishing',
      ownerNumber:'01017900067',
    ),
    RealStateApartment(
      name: 'Modern Apartment',
      type: 'Apartment',
      images: [
        'lib/Assets/Building/avenue-with-green-trees.jpg',
        'lib/Assets/Building/IMG-20241026-WA0002.jpg',
        'lib/Assets/Building/3d-rendering-beautiful-comtemporary-luxury-bedroom-suite-hotel-with-tv.jpg',
        'lib/Assets/Building/3d-rendering-loft-luxury-living-room-with-bookshelf.jpg',
        'lib/Assets/Building/3d-rendering-vintage-colorful-living-room-with-retro-style.jpg'
            'lib/Assets/Building/3d-rendering-beautiful-comtemporary-luxury-bedroom-suite-hotel-with-tv.jpg',      ],
      location: 'New Cairo',
      address: 'Downtown',
      baths: 2,
      beds: 3,
      size: 120,
      price: '2,800,000',
      description: 'A modern apartment ideal for city living with easy financing solutions. Schedule a visit today!',
      finishingType: 'Not finishing',
      ownerNumber:'01017900067',
    ),
  RealStateApartment(
  name: 'Cozy Apartment',
  type: 'Apartment',
  images: [
  'lib/Assets/Building/urban-traffic-with-cityscape.jpg',
    'lib/Assets/Building/IMG-20241026-WA0002.jpg',
    'lib/Assets/Building/3d-rendering-beautiful-comtemporary-luxury-bedroom-suite-hotel-with-tv.jpg',
    'lib/Assets/Building/3d-rendering-loft-luxury-living-room-with-bookshelf.jpg',
    'lib/Assets/Building/3d-rendering-vintage-colorful-living-room-with-retro-style.jpg'
        'lib/Assets/Building/3d-rendering-beautiful-comtemporary-luxury-bedroom-suite-hotel-with-tv.jpg',  ],
  location: 'Alexandria',
  address: 'Coastal, 50',
  baths: 1,
  beds: 2,
  size: 90,
  price: '600,000',
  description: 'Enjoy beachfront living with affordable financing options. Perfect for relaxation and family gatherings!',
  finishingType: 'Finished',
    ownerNumber:'01017900067',
  ),
  ];

  Widget _buildFeatureApartmentContainer(BuildContext context, RealStateApartment apartment) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.02,
          vertical: screenWidth * 0.02),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RealStateProperty(
                name: apartment.name,
                type:apartment.type,
                images: apartment.images,
                location: apartment.location,
                address: apartment.address,
                baths: apartment.baths,
                beds: apartment.beds,
                size: apartment.size,
                price: apartment.price,
                description:apartment.description,
                finishingType:apartment.finishingType,
                ownerNumber:apartment.ownerNumber,
              ),
            ),
          );
        },
        child: Container(
          width: screenWidth * 0.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(screenWidth * 0.02),
            color: Colors.white,
            border: Border.all(
              color: Colors.grey.shade200,
              width: 1.0,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: Offset(0, screenWidth * 0.005),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(screenWidth * 0.01),
                    child: Image.asset(
                      apartment.images[0],
                      fit: BoxFit.cover,
                      width: screenWidth * 0.9,
                      height: (screenWidth * 0.9) * 0.35,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
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
                                apartment.isFavorite ? Icons.favorite : Icons.favorite_border,
                                color: apartment.isFavorite ? Colors.orange : Colors.white,
                                size: 24,
                              ),
                              onPressed: () {
                                setState(() {
                                  apartment.isFavorite = !apartment.isFavorite;
                                  if (apartment.isFavorite) {
                                    favoriteApartments.add(apartment);
                                  } else {
                                    favoriteApartments.remove(apartment);
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      apartment.name,
                      style: GoogleFonts.inter(
                        fontSize: screenWidth * 0.04,
                        color: const Color(0xff2F2F2F),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.02),
                    _buildLocationRow(screenWidth, apartment.address, apartment.location),
                    SizedBox(height: screenWidth * 0.01),
                    _buildDetailsRow(screenWidth, apartment.baths.toString(), apartment.beds.toString(), apartment.size.toString()),
                    SizedBox(height: screenWidth * 0.01),
                    _buildPriceRow(screenWidth, apartment.price, apartment.ownerNumber),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildLocationRow(double screenWidth, String address,String location) {
    return Row(
      children: [
        Icon(Icons.location_on_outlined, size: screenWidth * 0.035, color: const Color(0xff00AA5B)),
        SizedBox(width: screenWidth * 0.01),
        Text(
          '$address , $location',
          style: GoogleFonts.inter(
            fontSize: screenWidth * 0.03,
            color: const Color(0xff9E9E9E),
            fontWeight: FontWeight.w400,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
  Widget _buildDetailsRow(double screenWidth, String baths, String beds, String size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildDetailItem(screenWidth, 'lib/Assets/FeatureApartment/iconoir_bathroom.png', baths, ' Baths'),
        SizedBox(width: screenWidth * 0.02),
        _buildDetailItem(screenWidth, 'lib/Assets/FeatureApartment/material-symbols-light_bed-outline.png', beds, ' Beds'),
        SizedBox(width: screenWidth * 0.02),
        _buildDetailItem(screenWidth, 'lib/Assets/FeatureApartment/material-symbols-light_space-dashboard-outline.png', size, ' M'),
      ],
    );
  }
  Widget _buildDetailItem(double screenWidth, String iconPath, String count, String label) {
    return Row(
      children: [
        Image.asset(iconPath, width: screenWidth * 0.04, height: screenWidth * 0.04),
        SizedBox(width: screenWidth * 0.01),
        Text(
          '$count$label',
          style: GoogleFonts.inter(
            fontSize: screenWidth * 0.03,
            color: const Color(0xff9E9E9E),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
  Widget _buildPriceRow(double screenWidth, String price, String ownerNumber) {
    return Row(
      children: [
        Text(
          '$price EGP',
          style: GoogleFonts.inter(
            fontSize: screenWidth * 0.04,
            color: const Color(0xffF08200),
            fontWeight: FontWeight.w700,
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            launch('tel:$ownerNumber');
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
            final formattedNumber = ownerNumber.startsWith('0')
                ? ownerNumber.replaceFirst('0', '+20')
                : '+20$ownerNumber';

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
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...apartments.map((apartment) => Row(
                  children: [
                    _buildFeatureApartmentContainer(context, apartment),
                  ],
                )),
              ],
            ),
        ),
      ],
    );
  }
}

