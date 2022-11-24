// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_onur/src/features/widgets/bottomnavbar.dart';
import 'package:spotify_api_onur/src/features/widgets/profile_appbar.dart';
import 'package:spotify_api_onur/src/features/widgets/public_playlist.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 232, 232),
      appBar: CustomAppBar(),
      //extendBodyBehindAppBar: true,
      bottomNavigationBar: BottomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 33.6.h,
              width: 100.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.w),
                      bottomRight: Radius.circular(12.w))),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 5.6.h,
                    backgroundColor: Color(0xffAAAAAA),
                    backgroundImage:
                        AssetImage("assets/images/profile_pic.png"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: Text("soroushnorozyui@gmail.com"),
                  ),
                  Text(
                    "Soroushnrz",
                    style: TextStyle(
                        fontSize: 2.75.h, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 4.h, horizontal: 5.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              "778",
                              style: TextStyle(
                                  color: Color(0xff222222),
                                  fontSize: 2.75.h,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 1.h),
                            Text(
                              "Followes",
                              style: TextStyle(
                                  color: Color(0xff585858),
                                  fontSize: 2.h,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "243",
                              style: TextStyle(
                                  color: Color(0xff222222),
                                  fontSize: 2.75.h,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 1.h),
                            Text(
                              "Followes",
                              style: TextStyle(
                                  color: Color(0xff585858),
                                  fontSize: 2.h,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
              child: Text("PUBLIC PLAYLISTS",
                  style: TextStyle(
                      color: Color(0xff222222),
                      fontSize: 2.2.h,
                      fontWeight: FontWeight.w700)),
            ),
            //Public Playlists
            PublicPlayList()
          ],
        ),
      ),
    );
  }
}
