import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../../../../../../core/utiles/constans.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FullScreenRealState extends StatefulWidget {
  final List<String> imageUrls;
  final int initialIndex;
  final String name;
  const FullScreenRealState({
    Key? key,
    required this.imageUrls,
    required this.initialIndex,
    required this.name
  }) : super(key: key);

  @override
  _FullScreenRealStateState createState() => _FullScreenRealStateState();
}

class _FullScreenRealStateState extends State<FullScreenRealState> {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex; // تعيين الفهرس الحالي
    _pageController = PageController(initialPage: _currentIndex);
    _pageController.addListener(() {
      setState(() {
        _currentIndex =
            _pageController.page!.round(); // تحديث الفهرس عند التمرير
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = screenWidth * 0.2;
    double containerHeight = screenWidth * 0.2;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xff2F2F2F),
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: IconButton(
            icon: Icon(Icons.clear, color: Colors.white, size: 20.sp),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: Text(
          '${widget.name}',
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.imageUrls.length,
                itemBuilder: (context, index) {
                  return PhotoView(
                    imageProvider: AssetImage(widget.imageUrls[index]),
                    backgroundDecoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 2,
                  );
                },
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              height: containerHeight + 20,
              color: Color(0xff2F2F2F),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(widget.imageUrls.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      _pageController.jumpToPage(index);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: containerWidth,
                      height: containerHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: _currentIndex == index
                              ? KprimaryColor
                              : Colors.transparent,
                          width: 3,
                        ),
                        image: DecorationImage(
                          image: AssetImage(widget.imageUrls[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
