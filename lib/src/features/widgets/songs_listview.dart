import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SongsListView extends StatefulWidget {
  const SongsListView({super.key});

  @override
  State<SongsListView> createState() => _SongsListViewState();
}

class _SongsListViewState extends State<SongsListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 30.h,
        width: double.infinity,
        child: ListView.builder(
            itemCount: 6, //length gelecek
            itemBuilder: ((context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  top: 2.h,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          "assets/images/play_button.svg",
                          height: 5.h,
                          width: 5.w,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 1.w),
                        child: SizedBox(
                          width: 47.w,
                          height: 5.h,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Songs",
                                    style: TextStyle(
                                        color: Color(0xff222222),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 2.2.h)),
                                Text("Singer Name",
                                    style: TextStyle(
                                        color: Color(0xff222222),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 1.6.h)),
                              ]),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      SizedBox(
                          width: 10.w,
                          height: 5.h,
                          child: Center(child: Text("5:33"))),
                      Padding(
                        padding: EdgeInsets.only(left: 6.w),
                        child: SizedBox(
                          width: 10.w,
                          height: 5.h,
                          child: Center(
                            child: GestureDetector(
                                onTap: () {},
                                child: SvgPicture.asset(
                                    "assets/images/favourite.svg")),
                          ),
                        ),
                      )
                    ]),
              );
            })));
  }
}
