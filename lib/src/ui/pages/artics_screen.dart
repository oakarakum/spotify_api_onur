// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_onur/src/ui/pages/browse_screen.dart';

class ArticsScreen extends StatefulWidget {
  const ArticsScreen({super.key});

  @override
  State<ArticsScreen> createState() => _ArticsScreenState();
}

class _ArticsScreenState extends State<ArticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.asset(
                  "assets/images/artist_photo.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                  top: 2.h,
                  left: 7.w,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => BrowseScreen())));
                    },
                    child: SvgPicture.asset("assets/images/left_arrow.svg"),
                  )),
              Positioned(
                  top: 3.h,
                  right: 8.w,
                  child: GestureDetector(
                    child: SvgPicture.asset(
                        "assets/images/three_dots_icon_detail.svg"),
                  )),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 2.5.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Billie Eilish",
                  style: TextStyle(
                      color: Color(0xff222222),
                      fontWeight: FontWeight.w600,
                      fontSize: 3.h),
                ),
                SizedBox(height: 1.h),
                Text(
                  "2 album , 67 track",
                  style: TextStyle(
                      color: Color(0xff222222),
                      fontWeight: FontWeight.w300,
                      fontSize: 2.2.h),
                ),
                SizedBox(height: 1.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Text(
                    "Lorem Ipsum Dolor Sit Amet, Consectetur \nAdipiscing Elit. Turpis Adipiscing Vestibulum Orci\n                     Enim, Nascetur Vitae ",
                    style: TextStyle(
                        color: Color(0xff838383),
                        fontWeight: FontWeight.w300,
                        fontSize: 2.h),
                  ),
                ),
              ],
            ),
          ),
          Align(alignment: Alignment.centerLeft, child: Text("Album"))
        ],
      ),
    );
  }
}
