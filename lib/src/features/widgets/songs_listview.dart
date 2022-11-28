// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spotify_api_onur/src/providers/album_tracks_provider.dart';

import '../../providers/fav_artist_album_provider.dart';
import '../../providers/fav_artist_provider.dart';

class SongsListView extends StatefulWidget {
  const SongsListView({super.key});

  @override
  State<SongsListView> createState() => _SongsListViewState();
}

class _SongsListViewState extends State<SongsListView> {
  bool? isAlbumTracksLoaded;
  @override
  void initState() {
    isAlbumTracksLoaded = false;
    Future.delayed(Duration(seconds: 2));
    isAlbumTracksLoaded = true;
    AlbumTracksProvider? data15;
    super.initState();
    data15 = Provider.of<AlbumTracksProvider>(context, listen: false);
    data15.getAlbumTracks();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AlbumTracksProvider>(
      builder: (context, value, widget) {
        return SizedBox(
            height: 30.h,
            width: double.infinity,
            child: ListView.builder(
                itemCount: value.albumTracks.items!.length, //length gelecek
                itemBuilder: ((context, index) {
                  return value.albumTracks != null
                      ? Padding(
                          padding: EdgeInsets.only(
                            top: 2.h,
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: SvgPicture.asset(
                                    "assets/images/play_button.svg",
                                    height: 5.h,
                                    width: 5.w,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.w),
                                  child: SizedBox(
                                    width: 45.5.w,
                                    height: 5.h,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              value.albumTracks.items![index]
                                                  .name!,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Color(0xff222222),
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 2.2.h)),
                                          FittedBox(
                                            child: Text(
                                                value.albumTracks.items![index]
                                                    .artists![0].name!
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Color(0xff222222),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 2.h)),
                                          ),
                                        ]),
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                SizedBox(
                                    width: 10.w,
                                    height: 5.h,
                                    child: Center(child: Text("5:33"))),
                                Padding(
                                  padding: EdgeInsets.only(left: 6.w),
                                  child: SizedBox(
                                    width: 10.w,
                                    height: 5.h,
                                    child: Center(
                                      child: GestureDetector(
                                          onTap: () {},
                                          child: SvgPicture.asset(
                                              "assets/images/favourite.svg")),
                                    ),
                                  ),
                                )
                              ]),
                        )
                      : Shimmer.fromColors(
                          child: SizedBox(
                            width: 45.5.w,
                            height: 5.h,
                          ),
                          baseColor: Colors.red,
                          highlightColor: Colors.blue);
                })));
      },
    );
  }
}
