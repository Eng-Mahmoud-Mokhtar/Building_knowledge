import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'GardenProperty.dart';

class Apartment {
  final List<String> images;
  final String name;
  final String type;
  final String location;
  final String address;
  final int deliveryIn;
  final String compound;
  final int baths;
  final int beds;
  final int size;
  final String price;
  final String finishingType;
  final String ownerNumber;
  final String description;
  bool isFavorite;

  Apartment({
    required this.images,
    required this.name,
    required this.type,
    required this.location,
    required this.address,
    required this.deliveryIn,
    required this.compound,
    required this.baths,
    required this.beds,
    required this.size,
    required this.price,
    required this.description,
    required this.ownerNumber,
    required this.finishingType,
    this.isFavorite = false,
  });
}
List<Apartment> favoriteApartments = [];
class CapitalBody extends StatefulWidget {
  @override
  State<CapitalBody> createState() => _CapitalBodyState();
}
class _CapitalBodyState extends State<CapitalBody> {
  bool isFavorite = false;
  final List<Apartment> apartments = [
    Apartment(
      name: 'BloomFields',
      type: 'Apartment',
      images: [
        'lib/Assets/Building/IMG-20241026-WA0002.jpg',
        'lib/Assets/Building/3d-rendering-beautiful-comtemporary-luxury-bedroom-suite-hotel-with-tv.jpg',
        'lib/Assets/Building/3d-rendering-loft-luxury-living-room-with-bookshelf.jpg',
        'lib/Assets/Building/3d-rendering-vintage-colorful-living-room-with-retro-style.jpg'
            'lib/Assets/Building/3d-rendering-beautiful-comtemporary-luxury-bedroom-suite-hotel-with-tv.jpg',
      ],
      deliveryIn: 2030,
      compound: 'West Orascom',
      location: 'Cairo',
      address: 'Naser city, 12 street',
      baths: 2,
      beds: 5,
      size: 200,
      price: '3.000.000',
      finishingType: 'Not finishing',
      description:'''This home boasts plenty of natural light, hardwood floors, and a cozy fireplace, making it perfect for comfortable family living. Don't miss your chance to own this stunning property! Contact us today to schedule a viewing.
    ''',
      ownerNumber:'01017900067',
    ),
    Apartment(
      name: 'Badya',
      type: 'Apartment',
      images: [
        'lib/Assets/Building/IMG-20241026-WA0004.jpg',
        'lib/Assets/Building/3d-rendering-beautiful-comtemporary-luxury-bedroom-suite-hotel-with-tv.jpg',
        'lib/Assets/Building/3d-rendering-loft-luxury-living-room-with-bookshelf.jpg',
        'lib/Assets/Building/3d-rendering-vintage-colorful-living-room-with-retro-style.jpg'
      ],
      deliveryIn: 2027,
      compound: 'West Orascom',
      location: 'Alexandria',
      address: 'Al-Montazah, 25 street',
      baths: 1,
      beds: 2,
      size: 112,
      price: '800.000',
      finishingType: 'finishing',
      description:'family-friendly neighborhood, just minutes away from schools, parks, and shopping centers',
      ownerNumber:'01017900067',
    ),
    Apartment(
      name: 'Mone Galala',
      type: 'Twinhouse',
      images: [
        'lib/Assets/Building/3d-rendering-vintage-colorful-living-room-with-retro-style.jpg',
        'lib/Assets/Building/3d-rendering-beautiful-comtemporary-luxury-bedroom-suite-hotel-with-tv.jpg',
        'lib/Assets/Building/3d-rendering-loft-luxury-living-room-with-bookshelf.jpg',
        'lib/Assets/Building/3d-rendering-vintage-colorful-living-room-with-retro-style.jpg'
      ],
      deliveryIn: 2024,
      compound: 'West Orascom',
      location: 'Giza',
      address: 'Dokki, 10 street',
      baths: 1,
      beds: 2,
      size: 90,
      price: '650.000',
      finishingType: 'Semi-finishing',
      description:'Nestled in a quiet,Nestled in a quiet, family-friendly neighborhood, just minutes away from schools, parks, and shopping centers',
      ownerNumber:'01017900067',

    ),
    Apartment(
      name: 'BloomFields',
      type: 'Apartment',
      deliveryIn: 2025,
      compound: 'West Orascom',
      images: [
        'lib/Assets/Building/IMG-20241026-WA0002.jpg',
        'lib/Assets/Building/3d-rendering-beautiful-comtemporary-luxury-bedroom-suite-hotel-with-tv.jpg',
        'lib/Assets/Building/3d-rendering-loft-luxury-living-room-with-bookshelf.jpg',
        'lib/Assets/Building/3d-rendering-vintage-colorful-living-room-with-retro-style.jpg'
            'lib/Assets/Building/3d-rendering-beautiful-comtemporary-luxury-bedroom-suite-hotel-with-tv.jpg',

      ],
      location: 'Cairo',
      address: 'Naser city, 12 street',
      baths: 2,
      beds: 5,
      size: 200,
      price: '3.000.000',
      finishingType: 'Not finishing',
      description:'''This home boasts plenty of natural light, hardwood floors, and a cozy fireplace, making it perfect for comfortable family living. Don't miss your chance to own this stunning property! Contact us today to schedule a viewing.
    ''',
      ownerNumber:'01017900067',
    ),
    Apartment(
      name: 'Badya',
      type: 'Apartment',
      deliveryIn: 2027,
      compound: 'West Orascom',
      images: [
        'lib/Assets/Building/IMG-20241026-WA0004.jpg',
        'lib/Assets/Building/3d-rendering-beautiful-comtemporary-luxury-bedroom-suite-hotel-with-tv.jpg',
        'lib/Assets/Building/3d-rendering-loft-luxury-living-room-with-bookshelf.jpg',
        'lib/Assets/Building/3d-rendering-vintage-colorful-living-room-with-retro-style.jpg'
      ],
      location: 'Alexandria',
      address: 'Al-Montazah, 25 street',
      baths: 1,
      beds: 2,
      size: 112,
      price: '800.000',
      finishingType: 'finishing',
      description:'family-friendly neighborhood, just minutes away from schools, parks, and shopping centers',
      ownerNumber:'01017900067',
    ),
    Apartment(
      name: 'Mone Galala',
      type: 'Twinhouse',
      deliveryIn: 2026,
      compound: 'West Orascom',
      images: [
        'lib/Assets/Building/3d-rendering-vintage-colorful-living-room-with-retro-style.jpg',
        'lib/Assets/Building/3d-rendering-beautiful-comtemporary-luxury-bedroom-suite-hotel-with-tv.jpg',
        'lib/Assets/Building/3d-rendering-loft-luxury-living-room-with-bookshelf.jpg',
        'lib/Assets/Building/3d-rendering-vintage-colorful-living-room-with-retro-style.jpg'
      ],
      location: 'Giza',
      address: 'Dokki, 10 street',
      baths: 1,
      beds: 2,
      size: 90,
      price: '650.000',
      finishingType: 'Semi-finishing',
      description:'Nestled in a quiet,Nestled in a quiet, family-friendly neighborhood, just minutes away from schools, parks, and shopping centers',
      ownerNumber:'01017900067',

    ),
    Apartment(
      name: 'BloomFields',
      type: 'Apartment',
      deliveryIn: 2028,
      compound: 'West Orascom',
      images: [
        'lib/Assets/Building/IMG-20241026-WA0002.jpg',
        'lib/Assets/Building/3d-rendering-beautiful-comtemporary-luxury-bedroom-suite-hotel-with-tv.jpg',
        'lib/Assets/Building/3d-rendering-loft-luxury-living-room-with-bookshelf.jpg',
        'lib/Assets/Building/3d-rendering-vintage-colorful-living-room-with-retro-style.jpg'
            'lib/Assets/Building/3d-rendering-beautiful-comtemporary-luxury-bedroom-suite-hotel-with-tv.jpg',

      ],
      location: 'Cairo',
      address: 'Naser city, 12 street',
      baths: 2,
      beds: 5,
      size: 200,
      price: '3.000.000',
      finishingType: 'Not finishing',
      description:'''This home boasts plenty of natural light, hardwood floors, and a cozy fireplace, making it perfect for comfortable family living. Don't miss your chance to own this stunning property! Contact us today to schedule a viewing.
    ''',
      ownerNumber:'01017900067',
    ),
    Apartment(
      name: 'Badya',
      type: 'Apartment',
      deliveryIn: 2029,
      compound: 'West Orascom',
      images: [
        'lib/Assets/Building/IMG-20241026-WA0004.jpg',
        'lib/Assets/Building/3d-rendering-beautiful-comtemporary-luxury-bedroom-suite-hotel-with-tv.jpg',
        'lib/Assets/Building/3d-rendering-loft-luxury-living-room-with-bookshelf.jpg',
        'lib/Assets/Building/3d-rendering-vintage-colorful-living-room-with-retro-style.jpg'
      ],
      location: 'Alexandria',
      address: 'Al-Montazah, 25 street',
      baths: 1,
      beds: 2,
      size: 112,
      price: '800.000',
      finishingType: 'finishing',
      description:'family-friendly neighborhood, just minutes away from schools, parks, and shopping centers',
      ownerNumber:'01017900067',
    ),
    Apartment(
      deliveryIn: 2035,
      compound: 'West Orascom',
      name: 'Mone Galala',
      type: 'Twinhouse',
      images: [
        'lib/Assets/Building/3d-rendering-vintage-colorful-living-room-with-retro-style.jpg',
        'lib/Assets/Building/3d-rendering-beautiful-comtemporary-luxury-bedroom-suite-hotel-with-tv.jpg',
        'lib/Assets/Building/3d-rendering-loft-luxury-living-room-with-bookshelf.jpg',
        'lib/Assets/Building/3d-rendering-vintage-colorful-living-room-with-retro-style.jpg'
      ],
      location: 'Giza',
      address: 'Dokki, 10 street',
      baths: 1,
      beds: 2,
      size: 90,
      price: '650.000',
      finishingType: 'Semi-finishing',
      description:'Nestled in a quiet,Nestled in a quiet, family-friendly neighborhood, just minutes away from schools, parks, and shopping centers',
      ownerNumber:'01017900067',

    ),
    Apartment(
      deliveryIn: 2027,
      compound: 'West Orascom',
      name: 'BloomFields',
      type: 'Apartment',
      images: [
        'lib/Assets/Building/IMG-20241026-WA0002.jpg',
        'lib/Assets/Building/3d-rendering-beautiful-comtemporary-luxury-bedroom-suite-hotel-with-tv.jpg',
        'lib/Assets/Building/3d-rendering-loft-luxury-living-room-with-bookshelf.jpg',
        'lib/Assets/Building/3d-rendering-vintage-colorful-living-room-with-retro-style.jpg'
            'lib/Assets/Building/3d-rendering-beautiful-comtemporary-luxury-bedroom-suite-hotel-with-tv.jpg',
      ],
      location: 'Cairo',
      address: 'Naser city, 12 street',
      baths: 2,
      beds: 5,
      size: 200,
      price: '3.000.000',
      finishingType: 'Not finishing',
      description:'''This home boasts plenty of natural light, hardwood floors, and a cozy fireplace, making it perfect for comfortable family living. Don't miss your chance to own this stunning property! Contact us today to schedule a viewing.
    ''',
      ownerNumber:'01017900067',
    ),
    Apartment(
      deliveryIn: 2029,
      compound: 'West Orascom',
      name: 'Badya',
      type: 'Apartment',
      images: [
        'lib/Assets/Building/IMG-20241026-WA0004.jpg',
        'lib/Assets/Building/3d-rendering-beautiful-comtemporary-luxury-bedroom-suite-hotel-with-tv.jpg',
        'lib/Assets/Building/3d-rendering-loft-luxury-living-room-with-bookshelf.jpg',
        'lib/Assets/Building/3d-rendering-vintage-colorful-living-room-with-retro-style.jpg'
      ],
      location: 'Alexandria',
      address: 'Al-Montazah, 25 street',
      baths: 1,
      beds: 2,
      size: 112,
      price: '800.000',
      finishingType: 'finishing',
      description:'family-friendly neighborhood, just minutes away from schools, parks, and shopping centers',
      ownerNumber:'01017900067',
    ),
    Apartment(
      deliveryIn: 2027,
      compound: 'West Orascom',
      name: 'Mone Galala',
      type: 'Twinhouse',
      images: [
        'lib/Assets/Building/3d-rendering-vintage-colorful-living-room-with-retro-style.jpg',
        'lib/Assets/Building/3d-rendering-beautiful-comtemporary-luxury-bedroom-suite-hotel-with-tv.jpg',
        'lib/Assets/Building/3d-rendering-loft-luxury-living-room-with-bookshelf.jpg',
        'lib/Assets/Building/3d-rendering-vintage-colorful-living-room-with-retro-style.jpg'
      ],
      location: 'Giza',
      address: 'Dokki, 10 street',
      baths: 1,
      beds: 2,
      size: 90,
      price: '650.000',
      finishingType: 'Semi-finishing',
      description:'Nestled in a quiet,Nestled in a quiet, family-friendly neighborhood, just minutes away from schools, parks, and shopping centers',
      ownerNumber:'01017900067',

    ),
  ];
  Widget _buildFeatureApartmentContainer(BuildContext context, Apartment apartment) {
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
              builder: (context) => GardenProperty(
                name: apartment.name,
                type: apartment.type,
                images: apartment.images,
                deliveryIn:apartment.deliveryIn,
                compound:apartment.compound,
                location: apartment.location,
                address: apartment.address,
                baths: apartment.baths,
                beds: apartment.beds,
                size: apartment.size,
                price: apartment.price,
                description: apartment.description,
                finishingType: apartment.finishingType,
                ownerNumber: apartment.ownerNumber,
              ),
            ),
          );
        },
        child: Container(
          width: screenWidth,
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
                blurRadius: screenWidth * 0.03,
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
                      width: screenWidth,
                      height: screenWidth * 0.35,
                    ),
                  ),
                  // إضافة Container للتدرج مع ضبط الحجم
                  Container(
                    width: screenWidth,
                    height: screenWidth * 0.35,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.7), // تدرج مع بعض الشفافية
                          Colors.black.withOpacity(0.5), // تدرج مع شفافية أقل
                          Colors.transparent,
                        ],
                      ),
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
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.bottomCenter, // محاذاة في المنتصف
                      child: Text(
                        '${apartment.price} EGP',
                        style: GoogleFonts.inter(
                          fontSize: screenWidth * 0.04,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
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
              apartment.type,
              style: GoogleFonts.inter(
                fontSize: screenWidth * 0.04,
                color: const Color(0xff2F2F2F),
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              apartment.name,
              style: GoogleFonts.inter(
                fontSize: screenWidth * 0.035,
                color: const Color(0xff9E9E9E),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: screenWidth * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildDetailItem(screenWidth, 'lib/Assets/FeatureApartment/iconoir_bathroom.png', apartment.baths.toString(), ' Baths'),
                SizedBox(width: screenWidth * 0.05),
                _buildDetailItem(screenWidth, 'lib/Assets/FeatureApartment/material-symbols-light_bed-outline.png', apartment.beds.toString(), ' Beds'),
              ],
            ),
            SizedBox(height: screenWidth * 0.02),
            Row(
              children: [
                Image.asset(
                  'lib/Assets/FeatureApartment/material-symbols-light_space-dashboard-outline.png',
                  width: screenWidth * 0.04,
                  height: screenWidth * 0.04,
                ),
                SizedBox(width: screenWidth * 0.01), // مسافة صغيرة بين الأيقونة والنص
                Text(
                  '${apartment.size} M²',
                  style: GoogleFonts.inter(
                    fontSize: screenWidth * 0.03,
                    color: const Color(0xff9E9E9E),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenWidth * 0.01),
          ],
        ),
      )
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildDetailItem(double screenWidth, String iconPath, String count, String label) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(iconPath, width: screenWidth * 0.04, height: screenWidth * 0.04),
            SizedBox(width: screenWidth * 0.01), // مسافة صغيرة بين الأيقونة والنص
            Text(
              '$count$label',
              style: GoogleFonts.inter(
                fontSize: screenWidth * 0.03,
                color: const Color(0xff9E9E9E),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.67,
          ),
          itemCount: apartments.length,
          itemBuilder: (context, index) {
            final apartment = apartments[index];
            return _buildFeatureApartmentContainer(context, apartment);
          },
    );
  }
}