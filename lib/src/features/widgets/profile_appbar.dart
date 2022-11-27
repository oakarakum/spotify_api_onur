// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_onur/src/ui/pages/artist_info_screen.dart';
import 'package:spotify_api_onur/src/ui/pages/homepage_screen.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override // Appbar boyu
  Size get preferredSize => Size.fromHeight(15.h);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      delay: Duration(
        seconds: 2
      ),
      child: Container(
        height: 8.h,
        color: Colors.white,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(top: 4.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => HomePageScreen())));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 2.w),
                    child: CircleAvatar(
                      radius: 4.4.w,
                      backgroundColor: Color.fromARGB(255, 241, 232, 232),
                      child: Padding(
                        padding: EdgeInsets.only(left: 1.2.w),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 15,
                          color: Color(0xff545454),
                        ),
                      ),
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(right: 3.w),
                child: Text(
                  "Profile",
                  style: TextStyle(
                      color: Color(0xff222222),
                      fontWeight: FontWeight.w600,
                      fontSize: 3.h),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 3.w),
                child: Icon(
                  Icons.more_vert,
                  color: Color(0xffA68C8C),
                ),
              )
            ],
          ),
        ),
      ),
    );
    /* AppBar(
      // custom yapmayı unutma appbar widgetini kullanma
      elevation: 0,
      backgroundColor: Colors.white,
      leading: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => ArticsScreen())));
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 15,
            color: Color(0xff545454),
          )
          /* SvgPicture.asset(
          "assets/images/left_arrow.svg",
        ), */
          ),
      title: Text(
        "Profile",
        style: TextStyle(
            color: Color(0xff222222),
            fontWeight: FontWeight.w600,
            fontSize: 3.h),
      ),
      centerTitle: true,
      actions: const [
        Icon(
          Icons.more_vert,
          color: Color(0xffA68C8C),
        )
      ],
    ); */
  }
}
