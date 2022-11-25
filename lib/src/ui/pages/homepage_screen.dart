// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_onur/src/features/widgets/bottomnavbar.dart';
import 'package:spotify_api_onur/src/features/widgets/fav_artist_listview.dart';
import 'package:spotify_api_onur/src/features/widgets/favorite_mixes_listview.dart';
import 'package:spotify_api_onur/src/features/widgets/homepage_appbar.dart';
import 'package:spotify_api_onur/src/features/widgets/random_playlists.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      appBar: CustomHomepageAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            children: [
              SizedBox(height: 1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Mixes",
                    style: TextStyle(
                        fontSize: 3.h,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff131313)),
                  ),
                  Text("See More", style: TextStyle(color: Color(0xff131313))),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: FavouriteMixes(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Artist",
                    style: TextStyle(
                        fontSize: 3.h,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff131313)),
                  ),
                  Text("See More", style: TextStyle(color: Color(0xff131313))),
                ],
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: FavouriteArtists()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "PlayLists",
                    style: TextStyle(
                        fontSize: 3.h,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff131313)),
                  ),
                  Text("See More", style: TextStyle(color: Color(0xff131313))),
                ],
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: RandomPlayLists())
            ],
          ),
        ),
      ),
    );
  }
}
