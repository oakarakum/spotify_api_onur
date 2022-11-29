// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_onur/src/features/widgets/search_appbar.dart';
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
                          child: //SearchPageTextfield()//
                              SearchPageTextfield(value),
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
                          child: SearchPage_Albums_Listview(value),
                        ),
                      ],
                    ),
                  )
                : Center(child: CircularProgressIndicator());
          },
        ));
  }

  TextFormField SearchPageTextfield(SearchListProvider value) {
    return TextFormField(
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
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(5)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(5))),
    );
  }

  SearchPage_Albums_Listview(SearchListProvider value) {
    return SizedBox(
      height: 65.h,
      child: ListView.builder(
        itemCount: 10,
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
        },
      ),
    );
  }
}
