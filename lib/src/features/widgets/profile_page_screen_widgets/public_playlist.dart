// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_onur/src/providers/profile_playlist_provider.dart';

class PublicPlayList extends StatefulWidget {
  const PublicPlayList({super.key});

  @override
  State<PublicPlayList> createState() => _PublicPlayListState();
}

//getPlaylist()
class _PublicPlayListState extends State<PublicPlayList> {
  ProfilePlaylistProvider? data12;
  @override
  void initState() {
    super.initState();
    data12 = Provider.of<ProfilePlaylistProvider>(context, listen: false);
    data12!.getPlaylist();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfilePlaylistProvider>(
      builder: (context, value, widget) {
        return Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: FadeInLeftBig(
              child: SizedBox(
                height: 60.h,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: value.profilePlaylist.items![0].track!.name
                        .toString()
                        .length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          top: 1.h,
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 9.h,
                                width: 20.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                      value.profilePlaylist.items![index].track!
                                          .album!.images![2].url
                                          .toString(),
                                    ))),
                                child: Image.network(
                                  value.profilePlaylist.items![index].track!
                                      .album!.images![0].url
                                      .toString(),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.w),
                                child: SizedBox(
                                  width: 41.w,
                                  height: 7.h,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FittedBox(
                                          child: Text(
                                              value.profilePlaylist
                                                  .items![index].track!.name
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Color(0xff222222),
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 2.3.h)),
                                        ),
                                        SizedBox(
                                          height: 1.5.h,
                                        ),
                                        FittedBox(
                                          child: Text(
                                              value
                                                  .profilePlaylist
                                                  .items![index]
                                                  .track!
                                                  .artists![0]
                                                  .name!
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Color(0xff222222),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 2.h)),
                                        ),
                                      ]),
                                ),
                              ),
                              SizedBox(width: 17.w),
                              SizedBox(
                                width: 10.w,
                                height: 5.h,
                                child: Center(
                                  child: GestureDetector(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.more_horiz_outlined,
                                        color: Color(0xffA68C8C),
                                      )),
                                ),
                              )
                            ]),
                      );
                    })),
              ),
            ));
      },
    );
  }
}
