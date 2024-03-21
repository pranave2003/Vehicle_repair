import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

  class UserRating extends StatefulWidget {
  const UserRating({super.key});

  @override
  State<UserRating> createState() => _UserRatingState();
}

class _UserRatingState extends State<UserRating> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xffCFE2FF),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
              Text("Your rating"),
              SizedBox()
            ],
          )),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      height: 130.h,
                      width: 130.w,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/bMan.png"),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Name",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18)),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "2+ year experience",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      width: 100.w,
                      height: 30.h,
                      child: Center(
                          child: Text("Available",
                              style: TextStyle(color: Colors.white))),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green),
                    ),
                    Column(
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RatingBar.builder(
                                initialRating: 3,
                                itemCount: 5,
                                itemSize: 25,
                                direction: Axis.horizontal,
                                itemBuilder: (Context, _) => Icon(Icons.star,color: Colors.amber),
                                onRatingUpdate: (rating) {

                                }),

                          ],
                        ),

                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30.sp),
            child: Row(
              children: [
                Text(
                  "Add rating",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RatingBar.builder(
                  initialRating: 3,
                  itemCount: 5,
                  itemSize: 35,
                  direction: Axis.horizontal,
                  itemBuilder: (Context, _) => Icon(Icons.star_outline_outlined,color: Colors.black87),
                  onRatingUpdate: (rating) {

                  }),
            ],
          ),



          //

          Padding(
            padding:  EdgeInsets.only(top: 200.sp),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 180.w,
                  height: 40.h,
                  child: TextButton(
                      onPressed: () {},
                      child: Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue.shade900),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
