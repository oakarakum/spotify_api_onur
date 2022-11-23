import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomepageAppbar extends StatefulWidget {
  const HomepageAppbar({super.key});

  @override
  State<HomepageAppbar> createState() => _HomepageAppbarState();
}

class _HomepageAppbarState extends State<HomepageAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/images/search_icon.svg")),
      title: SvgPicture.asset("assets/images/spotify_title.svg"),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/images/three_dot_icon.svg"),
        )
      ],
    );
  }
}
