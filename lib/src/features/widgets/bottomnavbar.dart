// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_onur/src/ui/pages/browse_screen.dart';
import 'package:spotify_api_onur/src/ui/pages/homepage_screen.dart';
import 'package:spotify_api_onur/src/ui/pages/profile_page_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 10.h,
        width: 100.w,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 0.8.h,
                width: 7.w,
                decoration: BoxDecoration(
                    color: Color(0xff42C83C),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
              ),
              Container(
                height: 0.8.h,
                width: 7.w,
                decoration: BoxDecoration(
                    color: Color(0xff42C83C),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
              ),
              Container(
                height: 0.8.h,
                width: 7.w,
                decoration: BoxDecoration(
                    color: Color(0xff42C83C),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
              ),
              Container(
                height: 0.8.h,
                width: 7.w,
                decoration: BoxDecoration(
                    color: Color(0xff42C83C),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
              )
            ],
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => HomePageScreen())));
                  },
                  icon: SvgPicture.asset("assets/images/home_icon.svg")
                  /* Icon(
                     FontAwesomeIcons.search,
                    color: Colors.green, 
                  )),*/
                  ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => BrowseScreen())));
                  },
                  icon: SvgPicture.asset("assets/images/explore.svg")),
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/images/favourite.svg")),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => ProfilePage())));
                  },
                  icon: SvgPicture.asset("assets/images/user.svg")),
            ],
          ),
        ]));
  }
}
