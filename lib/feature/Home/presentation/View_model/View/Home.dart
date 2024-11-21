import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utiles/constans.dart';
import '../../../../Explore/presentation/view_model/views/explore.dart';
import '../../../../Materials/presentation/view_model/views/MaterialPage.dart';
import '../../../../Profile/presentation/view_model/views/profile_screen.dart';
import '../../../../Search/presentation/view_model/views/Search.dart';
import 'Widgets/bodyHome.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        physics: NeverScrollableScrollPhysics(),
        children: [
          BodyHome(),
          ExplorePage(),
          Search(),
          Material_Page(),
          Profile(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(screenWidth * 0.04),
            topRight: Radius.circular(screenWidth * 0.04),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 10,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(screenWidth * 0.04),
            topRight: Radius.circular(screenWidth * 0.04),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Container(
                  width: screenWidth * 0.05,
                  height: screenWidth * 0.05,
                  child: Image.asset(
                    'lib/Assets/new/home_14120093.png',
                    fit: BoxFit.contain,
                    color: _selectedIndex == 0 ? KprimaryColor : Color(0xff9E9E9E),
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: screenWidth *  0.05,
                  height: screenWidth * 0.05,
                  child: Image.asset(
                    'lib/Assets/new/menu_14120322.png',
                    fit: BoxFit.contain,
                    color: _selectedIndex == 1 ? KprimaryColor : Color(0xff9E9E9E),
                  ),
                ),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: screenWidth * 0.05,
                  height: screenWidth * 0.05,
                  child: Image.asset(
                    'lib/Assets/new/magnifier_14120153.png',
                    fit: BoxFit.contain,
                    color: _selectedIndex == 2 ? KprimaryColor : Color(0xff9E9E9E),
                  ),
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: screenWidth * 0.04,
                  height: screenWidth * 0.04,
                  child: Image.asset(
                    'lib/Assets/bottonBar/Vector (3).png',
                    fit: BoxFit.contain,
                    color: _selectedIndex == 3 ? KprimaryColor : Color(0xff9E9E9E),
                  ),
                ),
                label: 'Material',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: screenWidth * 0.05,
                  height: screenWidth * 0.05,
                  child: Image.asset(
                    'lib/Assets/new/icons8-menu-78.png',
                    fit: BoxFit.contain,
                    color: _selectedIndex == 4 ? KprimaryColor : Color(0xff9E9E9E),
                  ),
                ),
                label: 'More',
              ),
            ],
            selectedItemColor: KprimaryColor,
            unselectedItemColor: Color(0xff9E9E9E),
            selectedFontSize: screenWidth * 0.03,
            unselectedFontSize: screenWidth * 0.03,
          ),
        ),
      ),
    );
  }
}
