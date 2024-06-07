import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'User_Payment_Page.dart';

class UserMechBill extends StatefulWidget {
  const UserMechBill({super.key, required this.id});
  final id;

  @override
  State<UserMechBill> createState() => _UserMechBillState();
}

class _UserMechBillState extends State<UserMechBill> {
  DocumentSnapshot? payment;
  double _rating = 0;
  getData() async {
    payment = await FirebaseFirestore.instance
        .collection('UserRequest')
        .doc(widget.id)
        .get();
    print('object');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text("Error${snapshot.error}");
        }
        return Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Color(0xffCFE2FF),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                  Text("Mechanic Bill"),
                  SizedBox()
                ],
              )),
          body: SingleChildScrollView(
            child: Column(
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
                            child: Text(payment!['mechname'],
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RatingBar.builder(
                                      initialRating: _rating,
                                      itemCount: 5,
                                      itemSize: 25,
                                      direction: Axis.horizontal,
                                      itemBuilder: (Context, _) =>
                                          Icon(Icons.star, color: Colors.amber),
                                      onRatingUpdate: (rating) {
                                        setState(() {
                                          _rating = rating;
                                        });
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
                        "Amount",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
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
                            border: Border.all(width: 1.5),
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                            child: Text(
                          payment!['WorkCompleteAmount'],
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.green),
                        )))
                  ],
                ),

                //

                Padding(
                  padding: EdgeInsets.only(top: 200.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 180.w,
                        height: 40.h,
                        child: TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: Color(0xffCFE2FF),
                                    title: Text("Add Rating"),
                                    content: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        RatingBar.builder(
                                            initialRating: _rating,
                                            itemCount: 5,
                                            itemSize: 30,
                                            direction: Axis.horizontal,
                                            itemBuilder: (Context, _) => Icon(
                                                Icons.star,
                                                color: Colors.amber),
                                            onRatingUpdate: (rating) {
                                              setState(() {
                                                _rating = rating;
                                              });
                                            }),
                                      ],
                                    ),
                                    actions: [
                                      Center(
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.green),
                                            onPressed: () {
                                              updatepayment();
                                            },
                                            child: Text(
                                              "Pay",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                      )
                                    ],
                                  );
                                },
                              );
                            },
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
          ),
        );
      },
    );
  }

  updatepayment() async {
    await FirebaseFirestore.instance
        .collection('UserRequest')
        .doc(widget.id)
        .update({'payment': '5', 'rating': _rating});
    FirebaseFirestore.instance.collection("Userratings").add({
      "mechname": payment!['mechname'],
      "rating": _rating,
      "mechid": payment!["mechid"],
      "User": payment!["Userid"]
    });

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserPaymentPage(),
        ));
  }
}
