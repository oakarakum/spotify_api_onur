// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_onur/src/features/widgets/album_listview.dart';
import 'package:spotify_api_onur/src/features/widgets/songs_listview.dart';
import 'package:spotify_api_onur/src/providers/fav_artist_provider.dart';
import 'package:spotify_api_onur/src/ui/pages/artist_all_songs.dart';
import 'package:spotify_api_onur/src/ui/pages/browse_screen.dart';

class ArticsScreen extends StatefulWidget {
  const ArticsScreen({super.key});

  @override
  State<ArticsScreen> createState() => _ArticsScreenState();
}

class _ArticsScreenState extends State<ArticsScreen> {
  @override
  void initState() {
    FavArtistProvider? data15;
    super.initState();
    data15 = Provider.of<FavArtistProvider>(context, listen: false);
    data15.getFavArtist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.white,
        ),
        body: Consumer<FavArtistProvider>(
          builder: (context, value, widget) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                          width: double.infinity,
                          child: Image.network(value
                              .favArtistname!.artists!.items![0].images![0].url
                              .toString())),
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
                            child: SvgPicture.asset(
                                "assets/images/left_arrow.svg"),
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.5.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          value.favArtistname!.artists!.items![0].name
                              .toString(),
                          style: TextStyle(
                              color: Color(0xff222222),
                              fontWeight: FontWeight.w600,
                              fontSize: 3.h),
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          "${value.favArtistname!.artists!.items![0].followers!.total.toString()} followers , ${value.favArtistname!.artists!.items![0].popularity!} Popularity",
                          style: TextStyle(
                              color: Color(0xff222222),
                              fontWeight: FontWeight.w300,
                              fontSize: 2.2.h),
                        ),
                        SizedBox(height: 1.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          child: Text(//substring(1, loginToken.length() - 1)
                            //value.favArtistname!.artists!.items![3].genres!.replaceAll("[", "").replaceAll("]", "").toString(),
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Album",
                                style: TextStyle(
                                    color: Color(0xff222222),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 2.2.h))),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          child: AlbumListview(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Songs",
                                style: TextStyle(
                                    color: Color(0xff222222),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 2.2.h)),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            ArtistAllSongs())));
                              },
                              child: Text("See More",
                                  style: TextStyle(
                                      color: Color(0xff222222),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 2.h)),
                            )
                          ],
                        ),
                        SongsListView()
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}