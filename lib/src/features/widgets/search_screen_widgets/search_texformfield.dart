import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_onur/src/providers/search_list_providers.dart';

class SearchTextformfield extends StatefulWidget {
  const SearchTextformfield({super.key});

  @override
  State<SearchTextformfield> createState() => _SearchTextformfieldState();
}

class _SearchTextformfieldState extends State<SearchTextformfield> {
  @override
  void initState() {
    SearchListProvider data20;
    data20 = Provider.of<SearchListProvider>(context, listen: false);
    data20.getSearchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchListProvider>(
      builder: (context, value, child) {
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
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(5)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(5))),
        );
      },
    );
  }
}
