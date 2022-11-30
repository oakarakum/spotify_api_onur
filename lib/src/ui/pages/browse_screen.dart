// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_onur/src/features/widgets/bottomnavbar.dart';
import 'package:spotify_api_onur/src/features/widgets/browse_screen_widgets/browse_textformfield.dart';

import '../../features/widgets/browse_screen_widgets/browse_types.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Color(0xffFAFAFA),
      ),
      bottomNavigationBar: BottomNavBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 3.h),
              Text(
                "Ara",
                style: TextStyle(
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w600,
                    fontSize: 3.5.h),
              ),
              SizedBox(height: 4.h),
              BrowseTextformfield(),
              SizedBox(height: 5.h),
              Align(
                  child: Text("Hepsine göz at",
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 2.5.h,
                          fontWeight: FontWeight.w600))),
              SizedBox(height: 3.h),
              //Gridview burada

              BrowseTypes()
            ],
          ),
        ),
      ),
    );
  }
}
