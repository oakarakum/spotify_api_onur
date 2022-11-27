// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_onur/src/providers/fav_artist_album_provider.dart';

import '../../providers/artist_provider.dart';

class AlbumListview extends StatefulWidget {
  const AlbumListview({super.key});
  @override
  State<AlbumListview> createState() => _AlbumListviewState();
}

class _AlbumListviewState extends State<AlbumListview> {

   @override
  void initState() {
    FavArtAlbumProvider? data18;
    super.initState();
    data18 = Provider.of<FavArtAlbumProvider>(context, listen: false);
    data18.getFavArtAlbum();

  }


  @override
  Widget build(BuildContext context) {
    return Consumer<FavArtAlbumProvider>(builder: (context, value, widget) {
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
                FadeInRightBig(
                  delay: Duration(seconds: 1),
                  child: Container(
                    height: 22.h,
                    width: 49.w,
                    margin: EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(value.favArtAlbumlist.items![index].images![0].url.toString())
                            
                            ),
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10.w)),
                  ),
                ),
                SizedBox(height: 1.h),
                FadeInUp(
                                    delay: Duration(seconds: 1),

                  child: Padding(
                    padding: EdgeInsets.only(right: 4.w),
                    child: Text(
                      value.favArtAlbumlist.items![index].name.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 2.h,
                          color: Color(0xff3A3A3A)),
                    ),
                  ),
                )
              ],
            );
          })),
    );
    },);
  }
}
