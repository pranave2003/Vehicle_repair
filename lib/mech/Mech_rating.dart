import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MechRating extends StatefulWidget {
  const MechRating({super.key});

  @override
  State<MechRating> createState() => _MechRatingState();
}

class _MechRatingState extends State<MechRating> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xffCFE2FF),
          title: Row(
            children: [
              Text("Rating"),
            ],
          )),
      body: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 120.h,
              width: 330.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffCFE2FF)),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage("assets/dp.png"),
                          ),
                          Text("Name")
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: Column(
                        children: [
                          Text(" engine work"),
                          Text("Data"),
                          Text("Time"),
                          Text("Place"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text("Rating"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RatingBar.builder(
                                  initialRating: 3,
                                  itemCount: 5,
                                  itemSize: 10,
                                  direction: Axis.horizontal,
                                  itemBuilder: (Context, _) =>
                                      Icon(Icons.star, color: Colors.amber),
                                  onRatingUpdate: (rating) {}),
                            ],
                          ),
                          Text("4/5")
                        ],
                      ),
                    )
                  ],
                ),
              ]),
            ),
          );
        },
      ),
      //
      //
      //
      //
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Container(
      //       height: 120.h,
      //       width: 330.w,
      //       decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(20),
      //           color: Color(0xffCFE2FF)),
      //       child: Column(children: [
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Padding(
      //               padding: const EdgeInsets.all(20),
      //               child: Column(
      //                 children: [
      //                   CircleAvatar(
      //                     radius: 30,
      //                     backgroundImage: AssetImage("assets/dp.png"),
      //                   ),
      //                   Text("Name")
      //                 ],
      //               ),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(3),
      //               child: Column(
      //                 children: [
      //                   Text(" engine work"),
      //                   Text("Data"),
      //                   Text("Time"),
      //                   Text("Place"),
      //                 ],
      //               ),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(20),
      //               child: Column(
      //                 children: [
      //                   Text("Rating"),
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.center,
      //                     children: [
      //                       RatingBar.builder(
      //                           initialRating: 3,
      //                           itemCount: 5,
      //                           itemSize: 10,
      //                           direction: Axis.horizontal,
      //                           itemBuilder: (Context, _) =>
      //                               Icon(Icons.star, color: Colors.amber),
      //                           onRatingUpdate: (rating) {}),
      //                     ],
      //                   ),
      //                   Text("4/5")
      //                 ],
      //               ),
      //             )
      //           ],
      //         ),
      //       ]),
      //     ),
      //   ],
      // ),
    );
  }
}
