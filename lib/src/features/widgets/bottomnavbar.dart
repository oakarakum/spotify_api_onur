// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_onur/src/providers/bot_navbar_provider.dart';
import 'package:spotify_api_onur/src/ui/pages/artist_info_screen.dart';
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
    return Consumer<BottomNavigationProvider>(
      builder: (context, value, widget) {
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
                        color: value.index == 0
                            ? Color(0xff42C83C)
                            : Color(0xffFAFAFA),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                  ),
                  Container(
                    height: 0.8.h,
                    width: 7.w,
                    decoration: BoxDecoration(
                        color: value.index == 1
                            ? Color(0xff42C83C)
                            : Color(0xffFAFAFA),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                  ),
                  Container(
                    height: 0.8.h,
                    width: 7.w,
                    decoration: BoxDecoration(
                        color: value.index == 2
                            ? Color(0xff42C83C)
                            : Color(0xffFAFAFA),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15))),
                  ),
                  Container(
                    height: 0.8.h,
                    width: 7.w,
                    decoration: BoxDecoration(
                        color: value.index == 3
                            ? Color(0xff42C83C)
                            : Color(0xffFAFAFA),
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
                        value.index = 0;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => HomePageScreen())));
                      },
                      icon: SvgPicture.asset("assets/images/home_icon.svg",
                          color:
                              value.index == 0 ? Colors.green : Colors.black)),
                  IconButton(
                      onPressed: () {
                        value.index = 1;

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => BrowseScreen())));
                      },
                      icon: SvgPicture.asset("assets/images/explore.svg",
                          color:
                              value.index == 1 ? Colors.green : Colors.black)),
                  IconButton(
                      onPressed: () {
                        value.index = 2;

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => ArticsScreen())));
                      },
                      icon: SvgPicture.asset("assets/images/favourite.svg",
                          color:
                              value.index == 2 ? Colors.green : Colors.black)),
                  IconButton(
                      onPressed: () {
                        value.index = 3;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => ProfilePage())));
                      },
                      icon: SvgPicture.asset("assets/images/user.svg",
                          color:
                              value.index == 3 ? Colors.green : Colors.black)),
                ],
              ),
            ]));
      },
    );
  }
}
