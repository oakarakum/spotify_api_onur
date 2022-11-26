// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, sort_child_properties_last

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
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
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  value.isArtistLoaded == true
                  ? Container(
                      height: 17.h,
                      width: 35.w,
                      child: Image.network(value.artistList.artists!.items![index].images![index].url.toString(),fit: BoxFit.cover,)
                          )
                          : Shimmer.fromColors(child: Container(
                            height: 17.h,
                      width: 35.w,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(top:3.h,left: 2.w),
                          child: Text("Loading...",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 6, 135, 6),
                                    fontSize: 3.h,
                                    fontWeight: FontWeight.w500)),
                        ),
                      ),
                          )
                          , baseColor: Colors.white,
                           highlightColor: Color.fromARGB(255, 63, 226, 68))
                          ,
                  SizedBox(
                      height: 5.h,
                      width: 40.w,
                      child: Center(
                        child: AutoSizeText(
                             value.artistList.artists!.items![index].name!.toString(), 
                            maxLines: 2,
                            style: TextStyle(
                            color: Color.fromARGB(255, 58, 56, 56),
                                fontSize: 2.h,
                                fontWeight: FontWeight.w500)),
                      )),
                ],
              );
            })),
      );
    }));
  }
}
