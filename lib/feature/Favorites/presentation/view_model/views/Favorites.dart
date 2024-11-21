import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../Rent/presentation/view_model/views/Rent.dart';
import '../../../../Rent/presentation/view_model/views/Widget/RentProperty.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritePage extends StatefulWidget {
  final List<Apartment> favoriteApartments;

  FavoritePage({required this.favoriteApartments});

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> with SingleTickerProviderStateMixin {
  late List<Apartment> favoriteApartments;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    favoriteApartments = widget.favoriteApartments;
    _tabController = TabController(length: 2, vsync: this);
  }

  void _toggleFavorite(Apartment apartment) {
    setState(() {
      if (apartment.isFavorite) {
        favoriteApartments.removeWhere((item) => item == apartment);
      } else {
        favoriteApartments.add(apartment);
      }
      apartment.isFavorite = !apartment.isFavorite;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 15.sp),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: Text(
          'Manange Favorites',
          style: GoogleFonts.inter(
            color: Color(0xff2F2F2F),
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: KprimaryColor,
          labelColor: KprimaryColor,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(text: 'Compounds'),  // تم تبديل "Properties" بـ "Compounds"
            Tab(text: 'Properties'),  // تم تبديل "Compounds" بـ "Properties"
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/Assets/new/sign (1).png',
                    width: screenWidth * 0.4,
                    height: screenHeight * 0.15,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'No Favorite Yet',
                    style: GoogleFonts.inter(
                      color: Color(0xff2F2F2F),
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'Start favoriting compounds to help you keep track of them later.',
                    style: GoogleFonts.inter(
                      color: Color(0xff9E9E9E),
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.05),
                ],
              ),
            ),
          ),
          favoriteApartments.isEmpty
              ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/Assets/new/sign (1).png',
                    width: screenWidth * 0.4,
                    height: screenHeight * 0.15,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'No Favorite Yet',
                    style: GoogleFonts.inter(
                      color: Color(0xff2F2F2F),
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'Start favoriting properties to help you keep track of them later.',
                    style: GoogleFonts.inter(
                      color: Color(0xff9E9E9E),
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.05),
                ],
                            ),
                          ),
              )
              : ListView.builder(
            itemCount: favoriteApartments.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04,
                    vertical: screenWidth * 0.02),
                child: _buildFeatureApartmentContainer(
                    context, favoriteApartments[index]),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureApartmentContainer(BuildContext context,
      Apartment apartment) {
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                RentProperty(
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
                  finishingType: apartment.finishingType,
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
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0, screenWidth * 0.005),
              blurRadius: screenWidth * 0.06,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(screenWidth * 0.01),
                    child: Image.asset(
                      apartment.images[0], // عرض أول صورة فقط من قائمة subImages
                      fit: BoxFit.cover,
                      width: screenWidth,
                      height: screenWidth * 0.35,
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
                                apartment.isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: apartment.isFavorite
                                    ? Colors.orange
                                    : Colors.white,
                                size: 24,
                              ),
                              onPressed: () =>
                                  _toggleFavorite(
                                      apartment), // Call toggleFavorite method
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenWidth * 0.02),
              Text(
                apartment.location,
                style: GoogleFonts.inter(
                  fontSize: screenWidth * 0.04,
                  color: const Color(0xff2F2F2F),
                  fontWeight: FontWeight.w600,
                ),
              ),
              _buildLocationRow(screenWidth, apartment.address),
              SizedBox(height: screenWidth * 0.01),
              _buildDetailsRow(screenWidth, apartment.baths.toString(),
                  apartment.beds.toString(), apartment.size.toString()),
              SizedBox(height: screenWidth * 0.01),
              _buildPriceRow(screenWidth, apartment.price, apartment.ownerNumber),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildLocationRow(double screenWidth, String address) {
    return Row(
      children: [
        Icon(Icons.location_on_outlined,
            size: screenWidth * 0.035, color: const Color(0xff00AA5B)),
        SizedBox(width: screenWidth * 0.01),
        Expanded(
          child: Text(
            address,
            style: GoogleFonts.inter(
              fontSize: screenWidth * 0.03,
              color: const Color(0xff9E9E9E),
              fontWeight: FontWeight.w400,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
  Widget _buildDetailsRow(double screenWidth, String baths, String beds,
      String size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildDetailItem(
            screenWidth,
            'lib/Assets/FeatureApartment/iconoir_bathroom.png',
            baths,
            ' Baths'),
        SizedBox(width: screenWidth * 0.02),
        _buildDetailItem(
            screenWidth,
            'lib/Assets/FeatureApartment/material-symbols-light_bed-outline.png',
            beds,
            ' Beds'),
        SizedBox(width: screenWidth * 0.02),
        _buildDetailItem(
            screenWidth,
            'lib/Assets/FeatureApartment/material-symbols-light_space-dashboard-outline.png',
            size,
            ' M'),
      ],
    );
  }
  Widget _buildDetailItem(double screenWidth, String iconPath, String count,
      String label) {
    return Row(
      children: [
        Image.asset(iconPath,
            width: screenWidth * 0.04, height: screenWidth * 0.04),
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
  Widget _buildPriceRow(double screenWidth, String price, String priceDetails) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              price,
              style: GoogleFonts.inter(
                fontSize: screenWidth * 0.035,
                color: const Color(0xffF08200),
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              priceDetails,
              style: GoogleFonts.inter(
                fontSize: screenWidth * 0.027,
                color: const Color(0xff9E9E9E),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
