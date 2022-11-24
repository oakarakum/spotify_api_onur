// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_onur/src/ui/pages/artist_info_screen.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => ArticsScreen())));
          },
          child: Center(
              child: Icon(
            Icons.arrow_back_ios,
            size: 15,
            color: Color(0xff545454),
          ))
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
    );
  }

  @override // Appbar boyu
  Size get preferredSize => Size.fromHeight(6.5.h);
}
