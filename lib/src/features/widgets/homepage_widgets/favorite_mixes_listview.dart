// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_onur/src/providers/fav_mixes_provider.dart';

class FavouriteMixes extends StatefulWidget {
  const FavouriteMixes({super.key});

  @override
  State<FavouriteMixes> createState() => _FavouriteMixesState();
}

class _FavouriteMixesState extends State<FavouriteMixes> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavouriteMixesProvider>(builder: ((context, value, widget) {
      return value.favMixesList.tracks != null
          ? SizedBox(
              height: 24.h,
              width: 100.w,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: value.favMixesList.tracks!.length,
                  itemBuilder: ((context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 17.h,
                          width: 35.w,
                          child: Image.network(
                            value.favMixesList.tracks![index].album!
                                .images![index].url
                                .toString(),
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                            height: 5.h,
                            width: 40.w,
                            child: Padding(
                              padding: EdgeInsets.only(left: 6.w, top: .7.h),
                              child: AutoSizeText(
                                  value.favMixesList.tracks![index].album!.name!
                                      .toString(),
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 58, 56, 56),
                                      fontSize: 1.7.h,
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
