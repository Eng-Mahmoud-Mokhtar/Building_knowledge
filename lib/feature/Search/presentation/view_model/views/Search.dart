import 'package:building/feature/Search/presentation/view_model/views/widgets/BrowerCompound.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../Home/presentation/View_model/View/Home.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> recentSearches = [];
  final List<String> popularSearches = [
    'Badya',
    'ZED',
    'June',
    'Salt',
    'Cairo Gate',
    'Mivida',
    'Solary',
    'El Sherouk',
    'Al Maadi',
    'New Cairo',
    'October City',
    'Heliopolis',
    '5th Settlement',
    'Giza',
    'Nasr City',
    'Zamalek'
  ];

  final TextEditingController searchController = TextEditingController();
  bool showAllPopular = false;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    searchController.dispose();
    super.dispose();
  }

  void onSearch() {
    String text = searchController.text.trim();
    if (text.isNotEmpty && !recentSearches.contains(text)) {
      setState(() {
        recentSearches.insert(0, text);
      });
    }
    searchController.clear();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double desiredHeight = screenWidth * 0.12;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:screenWidth * 0.04),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios,
                        color: Colors.black, size: screenWidth * 0.04),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                            (route) => false,
                      );
                    },
                  ),
                  Expanded(
                    child: Container(
                      height: desiredHeight,
                      child: TextField(
                        controller: searchController,
                        onSubmitted: (_) => onSearch(),
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            color: Color(0xff9E9E9E),
                            fontWeight: FontWeight.w500,
                            fontSize: screenWidth * 0.04,
                          ),
                          fillColor: Colors.grey.shade500,
                          hintText: 'Search',
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xff9E9E9E),
                            size: screenWidth * 0.06,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: desiredHeight * 0.3,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(screenWidth * 0.02),
                            borderSide: BorderSide(
                              color: Color(0xff9E9E9E),
                              width: 1.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(screenWidth * 0.02),
                            borderSide: BorderSide(
                              color: Color(0xffE9E9E9),
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(screenWidth * 0.02),
                            borderSide: BorderSide(
                              color: Color(0xffE9E9E9),
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.r),
                  BrowerCompound(),
                ],
              ),
            ),
          TabBar(
            controller: _tabController,
            indicatorColor: KprimaryColor,
            labelColor: KprimaryColor,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Compounds'),
              Tab(text: 'Developers'),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal:screenWidth * 0.02),
              child: TabBarView(
                controller: _tabController,
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Text(
                            'Recent Searches',
                            style: GoogleFonts.inter(
                              color: const Color(0xff2F2F2F),
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10),
                          if (recentSearches.isEmpty)
                    Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'lib/Assets/new/sign (1).png',
                        width: screenWidth * 0.4,
                        height: screenHeight * 0.1,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        'No Recent Searches',
                        style: GoogleFonts.inter(
              color: Color(0xff2F2F2F),
              fontSize: screenWidth * 0.035,
              fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                        ),
                        )

                          else
                            ...recentSearches
                                .map((search) => GestureDetector(
                                      onTap: () {
                                        searchController.text = search;
                                        onSearch();
                                      },
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                search,
                                          style: GoogleFonts.inter(
                                            color: Color(0xff2F2F2F),
                                            fontSize: screenWidth * 0.035,
                                            fontWeight: FontWeight.w400,)
                                              ),
                                              Icon(
                                                Icons.outbond_outlined,
                                                size: screenWidth * 0.05,
                                                color: Colors.grey,
                                              ),
                                            ],
                                          ),
                                          if (search != recentSearches.last)
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 10),
                                              child: Divider(
                                                  color: Colors.grey.shade300,
                                                  thickness: 1),
                                            ),
                                        ],
                                      ),
                                    ))
                                .toList(),
                          SizedBox(height: 20.h),
                          Text(
                            'Popular Searches',
                            style: GoogleFonts.inter(
                              color: const Color(0xff2F2F2F),
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Wrap(
                            spacing: 8.0,
                            runSpacing: 8.0,
                            children: [
                              ...popularSearches
                                  .take(showAllPopular ? popularSearches.length : 8)
                                  .map((search) => GestureDetector(
                                onTap: () {
                                  searchController.text = search;
                                  onSearch();
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Color(0xffeef4f1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    search,
                                    style: GoogleFonts.inter(
                                      color: Color(0xff2F2F2F),
                                      fontSize: screenWidth * 0.035,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              )),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showAllPopular = !showAllPopular;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                  decoration: BoxDecoration(
                                    color: Color(0xffeef4f1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    showAllPopular ? 'Less' : 'More',
                                    style: GoogleFonts.inter(
                                      color: Color(0xff2F2F2F),
                                      fontSize: screenWidth * 0.035,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                  Center(
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
                          'No Results to Show',
                          style: GoogleFonts.inter(
                            color: Color(0xff2F2F2F),
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
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
                          'No Results to Show',
                          style: GoogleFonts.inter(
                            color: Color(0xff2F2F2F),
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
