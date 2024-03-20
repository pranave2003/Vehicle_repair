import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Mechanic_Faiod extends StatefulWidget {
  const Mechanic_Faiod({super.key, required this.id});
  final id;

  @override
  State<Mechanic_Faiod> createState() => _Mechanic_FaiodState();
}

class _Mechanic_FaiodState extends State<Mechanic_Faiod> {
  DocumentSnapshot? faild;
  getData() async {
    faild = await FirebaseFirestore.instance
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
                  Text("Faild project"),
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
                            child: Text(faild!['mechname'],
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
                                      initialRating: 3,
                                      itemCount: 5,
                                      itemSize: 25,
                                      direction: Axis.horizontal,
                                      itemBuilder: (Context, _) =>
                                          Icon(Icons.star, color: Colors.amber),
                                      onRatingUpdate: (rating) {}),
                                  IconButton(
                                      onPressed: () {}, icon: Icon(Icons.edit))
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
                        "Faild reason",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                Container(
                    height: 200.h,
                    width: 330.w,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(faild!['WorkReject'],
                          style: TextStyle(fontSize: 20)),
                    ),
                    // TextFormField(readOnly: true,
                    //     decoration: InputDecoration(
                    //
                    //         border: InputBorder.none)),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20))),

                //

                Padding(
                  padding: EdgeInsets.only(top: 50.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 180.w,
                        height: 40.h,
                        child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
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
          ),
        );
      },
    );
  }
}
