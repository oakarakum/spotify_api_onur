// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_onur/src/providers/artist_provider.dart';

class FavouriteArtists extends StatefulWidget {
  const FavouriteArtists({super.key});

  @override
  State<FavouriteArtists> createState() => _FavouriteArtistsState();
}

class _FavouriteArtistsState extends State<FavouriteArtists> {
  @override
  void initState() {
    ArtistProvider? data3;
    super.initState();
    data3 = Provider.of<ArtistProvider>(context, listen: false);
    data3.getArtist();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ArtistProvider>(builder: ((context, value, widget) {
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
                          Container(
                              height: 17.h,
                              width: 35.w,
                              child: Image.network(value
                                  .artistList.artists![index].images![0].url
                                  .toString())),
                          SizedBox(
                              height: 5.h,
                              width: 40.w,
                              child: Center(
                                child: AutoSizeText(
                                    value.artistList.artists![index].name!,
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
    }));
  }
}
