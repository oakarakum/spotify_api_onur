// ignore_for_file: prefer_const_constructors

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
    return Consumer<ProfilePlaylistProvider>(builder: (context, value, widget) {
      return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: SizedBox(
        height: 60.h,
        width: double.infinity,
        child: ListView.builder(
            itemCount: 6, //length gelecek
            itemBuilder: ((context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  top: 1.h,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () {},
                           child: 

                              //Image.network(value.publicPlayList.tracks!.items![index].track!.album!.images![index].url.toString())
                              Image.asset("assets/images/publicplaylist_pic.png"),
                                  ), 
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: SizedBox(
                          width: 43.w,
                          height: 7.h,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(value.profilePlaylist.items![index].track!.name.toString()),
                                 /* Text(value.publicPlayList.description!
                                    ,
                                  //"dont smile at me",
                                      style: TextStyle(
                                          color: Color(0xff222222),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 2.2.h)), */ 

                                SizedBox(
                                  height: .5.h,
                                ),
                                Text("Singer Name",
                                    style: TextStyle(
                                        color: Color(0xff222222),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 1.6.h)),
                              ]),
                        ),
                      ),
                      SizedBox(width: 2.w),
                      SizedBox(
                          width: 15.w,
                          height: 5.h,
                          child: Center(
                              child: Padding(
                            padding: EdgeInsets.only(right: 8.w),
                            child: Text("5:33"),
                          ))),
                      Padding(
                        padding: EdgeInsets.only(left: 3.w),
                        child: SizedBox(
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
                        ),
                      )
                    ]),
              );
            })),
      )
      
    );
    },);
  }
}


 