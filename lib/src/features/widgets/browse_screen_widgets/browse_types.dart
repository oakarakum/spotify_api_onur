// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../providers/categories_provider.dart';

class BrowseTypes extends StatefulWidget {
  const BrowseTypes({super.key});

  @override
  State<BrowseTypes> createState() => _BrowseTypesState();
}

//Harfi büyük yazmak için
extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

class _BrowseTypesState extends State<BrowseTypes> {
  CategoriesProvider? data;
  @override
  void initState() {
    super.initState();
    data = Provider.of<CategoriesProvider>(context, listen: false);
    data!.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65.h,
      child: GridView.builder(
          itemCount: 12,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 1.5.h,
            mainAxisSpacing: 2.h,
            mainAxisExtent: 12.h,
          ),
          itemBuilder: ((context, index) {
            return Consumer(
                builder: ((context, CategoriesProvider value, widget) {
              return value.categoriesList.categories != null
                  ? Container(
                      alignment: Alignment.bottomRight,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                              image: NetworkImage(value.categoriesList
                                  .categories!.items![index].icons![0].url
                                  .toString()),
                              fit: BoxFit.cover)),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 1.25.h, right: 2.w),
                        child: Text(
                            "${value.categoriesList.categories!.items![index].name!.toTitleCase()}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400)),
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(
                      backgroundColor: Colors.greenAccent,
                      color: Colors.pink,
                    ));
            }));
          })),
    );
  }
}
