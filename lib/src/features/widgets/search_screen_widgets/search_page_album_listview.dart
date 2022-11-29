import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_onur/src/providers/album_tracks_provider.dart';

import '../../../providers/search_list_providers.dart';

class SearchPageAlbumListview extends StatefulWidget {
  const SearchPageAlbumListview({super.key});

  @override
  State<SearchPageAlbumListview> createState() => _SearchPageAlbumListviewState();
}

class _SearchPageAlbumListviewState extends State<SearchPageAlbumListview> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65.h,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Consumer<SearchListProvider>(builder: (context, value, child) {
            return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 10.h,
                  width: 22.w,
                  margin: EdgeInsets.only(bottom: 2.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(value.searchlist.tracks!.items![index]
                          .album!.images![0].url
                          .toString()),
                    ),
                  )),
              SizedBox(width: 3.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 1.h),
                    child: Text(
                      value.searchlist.tracks!.items![0].album!.name!,
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 2.h,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    "",
                    //value.searchlist.artists!.items![index].artists![0].name!.toString(),
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 2.h,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ],
          );
          },);
        },
      ),
    );
    
  }
}