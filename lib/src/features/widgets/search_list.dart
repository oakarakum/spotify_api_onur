// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_onur/src/models/search_model.dart';
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
    return Scaffold(body: Consumer<SearchListProvider>(
      builder: (context, value, widget) {
        return value.searchlist != null
            ? SizedBox(
                height: 65.h,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /* Container(
                    height: 8.h,
                    width: 15.w,
                    margin: EdgeInsets.only(bottom: 2.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.pink,
                        image: DecorationImage(
                            image: NetworkImage(value.searchlist.artists!
                                .items![index].album!.images![0].url
                                .toString())),
                                ),
                  ), */
                        SizedBox(width: 3.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 1.h),
                              child: Text(
                                value.searchlist.artists!.items![index].album!
                                    .name!
                                    .toString(),
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
                              '',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 2.h,
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              )
            : CircularProgressIndicator();
      },
    ));
  }
}
