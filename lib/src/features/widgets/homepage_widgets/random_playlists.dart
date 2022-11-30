// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_onur/src/providers/random_playlist_provider.dart';

class RandomPlayLists extends StatefulWidget {
  const RandomPlayLists({super.key});

  @override
  State<RandomPlayLists> createState() => _RandomPlayListsState();
}

class _RandomPlayListsState extends State<RandomPlayLists> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RandomPlayListProvider>(builder: ((context, value, widget) {
      return value.randomPlayList.href != null
          ? SizedBox(
              height: 24.h,
              width: 100.w,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: ((context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 17.h,
                          width: 35.w,
                          child: Image.network(
                              value.randomPlayList.items![index].images![0].url
                                  .toString(),
                              fit: BoxFit.cover),
                        ),
                        SizedBox(
                            height: 5.h,
                            width: 40.w,
                            child: Center(
                              child: AutoSizeText(
                                  value.randomPlayList.items![index].name!
                                      .toString(),
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 58, 56, 56),
                                      fontSize: 2.h,
                                      fontWeight: FontWeight.w500)),
                            )),
                      ],
                    );
                  })),
            )
          : LinearProgressIndicator(
              backgroundColor: Colors.black,
              color: Colors.green,
            );
    }));
  }
}


//