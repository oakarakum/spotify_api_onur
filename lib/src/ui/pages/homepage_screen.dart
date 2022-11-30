// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_onur/src/features/widgets/bottomnavbar.dart';
import 'package:spotify_api_onur/src/features/widgets/homepage_widgets/fav_artist_listview.dart';
import 'package:spotify_api_onur/src/features/widgets/homepage_widgets/favorite_mixes_listview.dart';
import 'package:spotify_api_onur/src/features/widgets/homepage_widgets/homepage_appbar.dart';
import 'package:spotify_api_onur/src/features/widgets/homepage_widgets/random_playlists.dart';

import '../../providers/artist_provider.dart';
import '../../providers/fav_mixes_provider.dart';
import '../../providers/random_playlist_provider.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  void initState() {
    FavouriteMixesProvider? data4;
    super.initState();
    data4 = Provider.of<FavouriteMixesProvider>(context, listen: false);
    data4.getFavMixes();
    ArtistProvider? data3;
    data3 = Provider.of<ArtistProvider>(context, listen: false);
    data3.getArtist();
    RandomPlayListProvider? data5;
    data5 = Provider.of<RandomPlayListProvider>(context, listen: false);
    data5.getRandomPlayList();
  }

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
                    "Tracks",
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
