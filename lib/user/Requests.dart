import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Mechanic_faild_page.dart';
import 'User_mech_bill_ page.dart';

class Requests extends StatefulWidget {
  const Requests({super.key});

  @override
  State<Requests> createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection("UserRequest").get(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Error:${snapshot.error}"),
            );
          }
          final reqastss = snapshot.data?.docs ?? [];

          return ListView.builder(
            itemCount: reqastss.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(10.sp),
                child: InkWell(
                  onTap: () {
                    if (reqastss[index]['payment'] == '3') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                UserMechBill(id: reqastss[index].id),
                          ));
                      print("pay");
                    } else if (reqastss[index]['payment'] == "4") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Mechanic_Faiod(id:reqastss[index].id),
                          ));
                      print('work faild');
                    } else if (reqastss[index]['status'] == '2') {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: Duration(seconds: 1),
                          behavior: SnackBarBehavior.floating,
                          content: Text(
                            "your request will be rejected",
                            style: TextStyle(color: Colors.red),
                          )));
                      print('rejected');
                    }
                  },
                  child: Container(
                    height: 130.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffCFE2FF)),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Text(reqastss[index]['mechname']),
                                Text(reqastss[index]['Time']),
                                Text(reqastss[index]['time']),
                                Text(reqastss[index]['Work']),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: reqastss[index]['payment'] == '3'
                                        ? Container(
                                            height: 40.h,
                                            width: 130.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.green,
                                            ),
                                            child: Center(
                                              child: Text("pay",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            ),
                                          )
                                        : reqastss[index]['payment'] == '4'
                                            ? Container(
                                                height: 40.h,
                                                width: 130.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.red,
                                                ),
                                                child: Center(
                                                  child: Text(" work faild",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                ),
                                              )
                                            : reqastss[index]['status'] == '2'
                                                ? Container(
                                                    height: 40.h,
                                                    width: 130.w,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color: Colors.red,
                                                    ),
                                                    child: Center(
                                                      child: Text("rejected",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)),
                                                    ),
                                                  )
                                                : reqastss[index]['payment'] ==
                                                        '5'
                                                    ? Center(
                                                        child: Text(
                                                            "payment compleated ✔️",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .green,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                      )
                                                    : Container(
                                                        height: 40.h,
                                                        width: 130.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          color: Colors.amber,
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                              "processing",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)),
                                                        ),
                                                      ))
                              ],
                            ),
                          ),
                        ],
                      )
                    ]),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
