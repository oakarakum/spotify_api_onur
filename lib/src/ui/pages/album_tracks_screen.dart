// ignore_for_file: prefer_const_literals_to_create_immutables, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_onur/src/features/widgets/artist_info_screen_widgets/albums_songs_listview.dart';

class AlbumTracksScreen extends StatefulWidget {
  String id;
  AlbumTracksScreen({super.key, required this.id});

  @override
  State<AlbumTracksScreen> createState() => _AlbumTracksScreenState();
}

class _AlbumTracksScreenState extends State<AlbumTracksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 4.h,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (() {
            Navigator.pop(context);
          }),
          child: Icon(
            Icons.arrow_back_ios,
            size: 15,
            color: Color(0xff545454),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          children: [
            SizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 20.h,
                  width: 30.w,
                  child: Image.network(
                    "https://i.scdn.co/image/ab67616d0000b2730a209d82aa08c43949f78b1f",
                    fit: BoxFit.cover,
                    width: 5.w,
                  ),
                ), //Albüm fotoğrafı,
                SizedBox(width: 3.w),
                SizedBox(
                  width: 57.w,
                  child: Column(
                    //Snatçı hakkında bilgi
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Album"),
                      Padding(
                        padding: EdgeInsets.only(top: 1.2.h),
                        child: Text("Album Adı"),
                      ),
                      SizedBox(height: 1.5.h),
                      Text("Sanatçı adı,yayınlanma tarihi,tkı"),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("* TITLE"), Icon(Icons.timer_sharp)],
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.h, bottom: 2.h),
              child: Divider(thickness: 1, color: Colors.grey),
            ),
            AlbumsSongsListview()
          ],
        ),
      ),
    );
  }
}
