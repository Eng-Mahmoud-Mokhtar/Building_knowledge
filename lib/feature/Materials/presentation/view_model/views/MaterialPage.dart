import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../Home/presentation/View_model/View/Home.dart';
import '../../../../Search/presentation/view_model/views/Search.dart';
import 'package:url_launcher/url_launcher.dart';
import 'MaterialDetiles.dart';

class Apartment {
  final List<String> images;
  final String brand;
  final String type;
  final String location;
  final String address;
  final String price;
  final String ownerNumber;
  final String description;
  bool isFavorite;
  Apartment({
    required this.images,
    required this.brand,
    required this.type,
    required this.location,
    required this.address,
    required this.price,
    required this.description,
    required this.ownerNumber,
    this.isFavorite = false,
  });
}
List<Apartment> favoriteApartments = [];
class Material_Page extends StatefulWidget {
  @override
  State<Material_Page> createState() => _Material_PageState();
}
class _Material_PageState extends State<Material_Page> {
  bool isFavorite = false;
  final List<Apartment> apartments = [
    Apartment(
      type: 'Marble & Ceramic',
      images: [
        'lib/Assets/Material/high-angle-decorative-vinyls-arrangement.jpg',
        'lib/Assets/Material/hands-putting-up-decorative-vinyl-top-view.jpg',
        'lib/Assets/Material/dark-wood-background.jpg',
        'lib/Assets/Material/high-angle-decorative-vinyls-arrangement.jpg',
        'lib/Assets/Material/hands-putting-up-decorative-vinyl-top-view.jpg',
      ],
      brand: 'lib/Assets/image 7.png',
      location: 'Cairo',
      address: 'Naser City, 12 Street',
      price: '3,000',
      description: '''Featuring luxurious marble finishes, this apartment has ceramic flooring and marble countertops, adding a touch of elegance and sophistication.''',
      ownerNumber: '01017900067',
    ),

    Apartment(
      type: 'Wooden Flooring',
      images: [
        'lib/Assets/Material/dark-wood-background.jpg',
        'lib/Assets/Material/hands-putting-up-decorative-vinyl-top-view.jpg',
        'lib/Assets/Material/dark-wood-background.jpg',
        'lib/Assets/Material/high-angle-decorative-vinyls-arrangement.jpg',
        'lib/Assets/Material/hands-putting-up-decorative-vinyl-top-view.jpg',
      ],
      brand: 'lib/Assets/image 15.png',
      location: 'Alexandria',
      address: 'Al-Montazah, 25 Street',
      price: '800',
      description: '''This apartment features warm wooden flooring and high-quality granite surfaces, providing a welcoming family environment.''',
      ownerNumber: '01017900067',
    ),

    Apartment(
      type: 'Porcelain',
      images: [
        'lib/Assets/Material/close-up-marble-textured-wall.jpg',
        'lib/Assets/Material/dark-wood-background.jpg',
        'lib/Assets/Material/hands-putting-up-decorative-vinyl-top-view.jpg',
        'lib/Assets/Material/dark-wood-background.jpg',
        'lib/Assets/Material/high-angle-decorative-vinyls-arrangement.jpg',
      ],
      brand: 'lib/Assets/image 13.png',
      location: 'Giza',
      address: 'Dokki, 10 Street',
      price: '650',
      description: '''Styled with elegant porcelain tiles, this twinhouse offers a polished, modern living space perfect for families.''',
      ownerNumber: '01017900067',
    ),

    Apartment(
      type: 'Granite',
      images: [
        'lib/Assets/Material/dark-gray-granite-textured.jpg',
        'lib/Assets/Material/dark-wood-background.jpg',
        'lib/Assets/Material/hands-putting-up-decorative-vinyl-top-view.jpg',
        'lib/Assets/Material/dark-wood-background.jpg',
        'lib/Assets/Material/high-angle-decorative-vinyls-arrangement.jpg',

      ],
      brand: 'lib/Assets/image 7.png',
      location: 'Cairo',
      address: 'Naser City, 12 Street',
      price: '3,000',
      description: '''Sophisticated granite surfaces and elegant ceramic flooring add luxury and style to this apartment.''',
      ownerNumber: '01017900067',
    ),

    Apartment(
      type: 'Marble & Ceramic',
      images: [
        'lib/Assets/Material/high-angle-decorative-vinyls-arrangement.jpg',
        'lib/Assets/Material/hands-putting-up-decorative-vinyl-top-view.jpg',
        'lib/Assets/Material/dark-wood-background.jpg',
        'lib/Assets/Material/high-angle-decorative-vinyls-arrangement.jpg',
        'lib/Assets/Material/hands-putting-up-decorative-vinyl-top-view.jpg',
      ],
      brand: 'lib/Assets/image 15.png',
      location: 'Cairo',
      address: 'Naser City, 12 Street',
      price: '3,000',
      description: '''Featuring luxurious marble finishes, this apartment has ceramic flooring and marble countertops, adding a touch of elegance and sophistication.''',
      ownerNumber: '01017900067',
    ),

    Apartment(
      type: 'Wooden Flooring',
      images: [
        'lib/Assets/Material/dark-wood-background.jpg',
        'lib/Assets/Material/hands-putting-up-decorative-vinyl-top-view.jpg',
        'lib/Assets/Material/dark-wood-background.jpg',
        'lib/Assets/Material/high-angle-decorative-vinyls-arrangement.jpg',
        'lib/Assets/Material/hands-putting-up-decorative-vinyl-top-view.jpg',
      ],
      brand: 'lib/Assets/image 7.png',
      location: 'Alexandria',
      address: 'Al-Montazah, 25 Street',
      price: '800',
      description: '''This apartment features warm wooden flooring and high-quality granite surfaces, providing a welcoming family environment.''',
      ownerNumber: '01017900067',
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
              builder: (context) => Material_Detailes(
                type:apartment.type,
                images: apartment.images,
                location: apartment.location,
                address: apartment.address,
                price: apartment.price,
                description:apartment.description,
                ownerNumber:apartment.ownerNumber,
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
                blurRadius: screenWidth * 0.06,
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
                  Positioned(
                    left: 10,
                    bottom: 10,
                    child: Container(
                      width: screenWidth * 0.12,
                      height: screenWidth * 0.12,
                      child: Center(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Image.asset(apartment.brand),
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
                    Row(
                      children: [
                        Text(
                          apartment.type,
                          style: GoogleFonts.inter(
                            fontSize: screenWidth * 0.04,
                            color: const Color(0xff2F2F2F),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    _buildLocationRow(screenWidth, apartment.address,apartment.location),
                    _buildPriceRow(screenWidth, apartment.price,apartment.ownerNumber),
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
          '$location',
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
  Widget _buildPriceRow(double screenWidth, String price,String ownerNumber) {
    return Row(
      children: [
        Text(
          '$price EGP',
          style: GoogleFonts.inter(
            fontSize: screenWidth * 0.035,
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
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
        actions: [
          Padding(
            padding: EdgeInsets.symmetric( horizontal: screenWidth * 0.04,
                vertical: screenWidth * 0.02),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(screenWidth * 0.02),
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 1 , // Border width
                ),
              ),
              child: IconButton(
                icon: Image.asset(
                  'lib/Assets/new/magnifier_14120153.png',
                  width: screenWidth * 0.05,
                  height: screenWidth * 0.05,
                  fit: BoxFit.contain,
                  color: Color(0xff9E9E9E),
                ), onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Search(),
                  ),
                );
              },
              ),
            ),
          ),
        ],
        title: Text(
          'Materials',
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: GridView.builder(
            shrinkWrap: true, // للتأكد من أن GridView يتكيف مع المحتوى داخل SingleChildScrollView
            physics: NeverScrollableScrollPhysics(), // لإلغاء التمرير داخل GridView، لأن التمرير يتم عبر SingleChildScrollView
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),
            itemCount: apartments.length,
            itemBuilder: (context, index) {
              final apartment = apartments[index];
              return _buildFeatureApartmentContainer(context, apartment);
            },
          ),
        ),
      ),
    );
  }
}