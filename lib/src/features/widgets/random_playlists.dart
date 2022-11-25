// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RandomPlayLists extends StatefulWidget {
  const RandomPlayLists({super.key});

  @override
  State<RandomPlayLists> createState() => _RandomPlayListsState();
}

class _RandomPlayListsState extends State<RandomPlayLists> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24.h,
      width: 100.w,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: ((context, index) {
            return Padding(
              padding: EdgeInsets.only(left: 1.w),
              child: Container(
                  width: 40.w,
                  color: Color.fromARGB(255, 228, 219, 219),
                  child: Padding(
                    padding: EdgeInsets.all(2.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 17.h,
                          width: 35.w,
                        ),
                        SizedBox(
                            height: 5.h,
                            width: 40.w,
                            child: Center(
                              child: AutoSizeText("Barış Manço Mix",
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 58, 56, 56),
                                      fontSize: 2.h,
                                      fontWeight: FontWeight.w500)),
                            )),
                      ],
                    ),
                  )),
            );
          })),
    );
  }
}


//