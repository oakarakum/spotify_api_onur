// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_onur/src/ui/pages/search_screen.dart';

class BrowseTextformfield extends StatefulWidget {
  const BrowseTextformfield({super.key});

  @override
  State<BrowseTextformfield> createState() => _BrowseTextformfieldState();
}

class _BrowseTextformfieldState extends State<BrowseTextformfield> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5.3.h,
      child: TextFormField(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchList()));
        },
        style: TextStyle(color: Color(0xffFAFAFA)),
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
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
      ),
    );
  }
}
