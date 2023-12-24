import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserMechBill extends StatefulWidget {
  const UserMechBill({super.key});

  @override
  State<UserMechBill> createState() => _UserMechBillState();
}

class _UserMechBillState extends State<UserMechBill> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xffCFE2FF),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
              Text("Mechanic Bill"),
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
                            IconButton(onPressed: () {

                            }, icon: Icon(Icons.edit))
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
                  "Amount",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200.w,
                height: 50.h,
                decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text(" \$2000 /-",
                      style:
                      TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
                ),
              )
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
                          "Payment",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
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
