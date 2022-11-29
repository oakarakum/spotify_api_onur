import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AlbumsSongsListview extends StatefulWidget {
  const AlbumsSongsListview({super.key});

  @override
  State<AlbumsSongsListview> createState() => _AlbumsSongsListviewState();
}

class _AlbumsSongsListviewState extends State<AlbumsSongsListview> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: double.infinity,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 2.h),
            child: PhysicalModel(
                color: Color(0xffe2f1f8),
                elevation: 8,
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  width: double.infinity,
                  height: 10.h,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("1"),
                            SizedBox(width: 1.5.w),
                            Column(
                              children: [
                                SizedBox(width: 1.5.w),
                                Text("Song NAME"),
                                SizedBox(height: 1.h),
                                Text("Singer Name")
                              ],
                            )
                          ],
                        ),
                        Text("2:59"),
                      ],
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}
