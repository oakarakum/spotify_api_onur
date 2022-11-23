import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BrowseTypes extends StatefulWidget {
  const BrowseTypes({super.key});

  @override
  State<BrowseTypes> createState() => _BrowseTypesState();
}

class _BrowseTypesState extends State<BrowseTypes> {
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
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.green),
              child: Padding(
                padding: EdgeInsets.only(top: 3.h, left: 2.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Podcast'ler",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                    Container(
                      margin: EdgeInsets.only(bottom: 60),
                      height: 100,
                      width: 50,
                      child: Image.asset(
                        "assets/images/spotify-dissect-podcast.jpg",
                        fit: BoxFit.fitHeight,
                      ),
                    )
                  ],
                ),
              ),
            );
          })),
    );
  }
}
