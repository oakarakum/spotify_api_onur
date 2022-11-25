import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomHomepageAppbar extends StatelessWidget with PreferredSizeWidget {
  const CustomHomepageAppbar({
    Key? key,
  }) : super(key: key);

  @override // Appbar boyu
  Size get preferredSize => Size.fromHeight(15.h);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(top: 3.5.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset("assets/images/search_icon.svg"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: SvgPicture.asset(
                "assets/images/spotify_title.svg",
                height: 5.h,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset("assets/images/three_dot_icon.svg"),
            ),
          ],
        ),
      ),
    );
  }
}
