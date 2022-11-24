// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AlbumListview extends StatefulWidget {
  const AlbumListview({super.key});

  @override
  State<AlbumListview> createState() => _AlbumListviewState();
}

class _AlbumListviewState extends State<AlbumListview> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26.h,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: ((context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 22.h,
                  width: 49.w,
                  margin: EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/album_photo2.png")),
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10.w)),
                ),
                SizedBox(height: 1.h),
                Text(
                  "Happier Than Ever",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 2.h,
                      color: Color(0xff3A3A3A)),
                )
              ],
            );
          })),
    );
  }
}
