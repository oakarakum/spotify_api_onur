// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_onur/src/models/search_model.dart';
import 'package:spotify_api_onur/src/providers/search_list_providers.dart';

import '../../features/widgets/browse_textformfield.dart';

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
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: Consumer<SearchListProvider>(
          builder: (context, value, widget) {
            return value.searchlist.artists != null
                ? Column(
                    children: [
                      TextFormField(
                        onChanged: (deger) {
                          value.getQuery(deger);
                        },
                        style: TextStyle(color: Color(0xffFAFAFA)),
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            //isDense: true,
                            fillColor: Colors.green,
                            filled: true,
                            prefixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.search),
                              color: Colors.white,
                              iconSize: 3.h,
                            ),
                            prefixIconColor: Colors.white,
                            hintText: "Ne dinlemek istiyorsun?",
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(5)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(5))),
                      ),
                      SizedBox(
                        height: 65.h,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
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
                                        image: NetworkImage(value
                                            .searchlist
                                            .tracks!
                                            .items![index]
                                            .album!
                                            .images![0]
                                            .url
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
                                        value.searchlist.tracks!.items![0]
                                            .album!.name!,
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
                                    /*  Album fotoğraf */
                                    /* Image.network(value.searchlist.tracks!.items![index]
                                    .album!.images![0].url
                                    .toString()) */
                                    // Image.network(value.searchlist.artists.items[index].artists[0].)
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : Center(child: CircularProgressIndicator());
          },
        ));
  }
}
