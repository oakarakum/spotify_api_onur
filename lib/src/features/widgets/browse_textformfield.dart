import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BrowseTextformfield extends StatefulWidget {
  const BrowseTextformfield({super.key});

  @override
  State<BrowseTextformfield> createState() => _BrowseTextformfieldState();
}

class _BrowseTextformfieldState extends State<BrowseTextformfield> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5.h,
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            //isDense: true,
            fillColor: Colors.white,
            filled: true,
            prefixIcon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              color: Colors.grey,
              iconSize: 3.h,
            ),
            prefixIconColor: Colors.white,
            hintText: "Ne dinlemek istiyorsun?",
            hintStyle: TextStyle(
                color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w500),
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
