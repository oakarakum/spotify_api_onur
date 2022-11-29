// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_onur/src/features/widgets/search_appbar.dart';
import 'package:spotify_api_onur/src/features/widgets/search_screen_widgets/search_page_album_listview.dart';
import 'package:spotify_api_onur/src/features/widgets/search_screen_widgets/search_texformfield.dart';
import 'package:spotify_api_onur/src/providers/search_list_providers.dart';

class SearchList extends StatefulWidget {
  const SearchList({super.key});

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  @override
  void initState() {
    SearchListProvider data20;
    data20 = Provider.of<SearchListProvider>(context, listen: false);
    data20.getSearchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBarSearchScreen(),
        resizeToAvoidBottomInset: false,
        body: Consumer<SearchListProvider>(
          builder: (context, value, widget) {
            return value.searchlist.artists != null
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          child: SearchTextformfield()
                             
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.h),
                            child: Text(
                              "Albums",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 2.5.h,
                                  fontWeight: FontWeight.w800),
                            )),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          child: SearchPageAlbumListview()
                        ),
                      ],
                    ),
                  )
                : Center(child: CircularProgressIndicator());
          },
        ));
  }

 
}
