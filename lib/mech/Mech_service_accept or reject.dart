import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MechServiceAccept extends StatefulWidget {
  const MechServiceAccept({super.key, required this.id});
  final id;

  @override
  State<MechServiceAccept> createState() => _MechServiceAcceptState();
}

class _MechServiceAcceptState extends State<MechServiceAccept> {
  DocumentSnapshot? reqaccreg;

  getDtata() async {
    reqaccreg = await FirebaseFirestore.instance
        .collection('UserRequest')
        .doc(widget.id)
        .get();
  }

  void accept(id) {
    setState(() {
      FirebaseFirestore.instance
          .collection('UserRequest')
          .doc(id)
          .update({'status': "1"});

      //
      //
    });
  }

  void rejects(id) {
    setState(() {
      FirebaseFirestore.instance
          .collection('UserRequest')
          .doc(id)
          .update({'status': "2"});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getDtata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text("Error${snapshot.error}");
          }
          return Stack(children: [
            SafeArea(
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios))),
            Center(
              child: Container(
                width: 330.w,
                height: 600.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffCFE2FF)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 80.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                          backgroundImage:
                              NetworkImage(reqaccreg!['UserProfile']),
                          radius: 40.sp),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(reqaccreg!['username'],
                            style: TextStyle(fontSize: 18)),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 250.h, left: 90.w),
              child: Column(
                children: [
                  Row(
                    children: [Text("sf")],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                            width: 100,
                            child: Text(
                              "Problem",
                              style: TextStyle(fontSize: 18),
                            )),
                        SizedBox(
                          width: 10,
                          child: Text(":"),
                        ),
                        SizedBox(
                          width: 100,
                          child: Text(reqaccreg!['Work'],
                              style: TextStyle(fontSize: 18)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                            width: 100,
                            child: Text(
                              "Place",
                              style: TextStyle(fontSize: 18),
                            )),
                        SizedBox(
                          width: 10,
                          child: Text(":"),
                        ),
                        SizedBox(
                          width: 100,
                          child: Text(reqaccreg!['Location'],
                              style: TextStyle(fontSize: 18)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                            width: 100,
                            child: Text(
                              "Date",
                              style: TextStyle(fontSize: 18),
                            )),
                        SizedBox(
                          width: 10,
                          child: Text(":"),
                        ),
                        SizedBox(
                          width: 100,
                          child: Text(reqaccreg!['Time'],
                              style: TextStyle(fontSize: 18)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                            width: 100,
                            child: Text(
                              "Time",
                              style: TextStyle(fontSize: 18),
                            )),
                        SizedBox(
                          width: 10,
                          child: Text(":"),
                        ),
                        SizedBox(
                          width: 100,
                          child: Text(reqaccreg!['time'],
                              style: TextStyle(fontSize: 18)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                            width: 100,
                            child: Text(
                              "Contact number",
                              style: TextStyle(fontSize: 18),
                            )),
                        SizedBox(
                          width: 10,
                          child: Text(":"),
                        ),
                        SizedBox(
                          width: 100,
                          child: Text(reqaccreg!["usermob"],
                              style: TextStyle(fontSize: 18)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 100.h),
                    child: reqaccreg!["status"] == "0"
                        ? Row(
                            children: [
                              Container(
                                height: 40.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.green,
                                ),
                                child: Center(
                                    child: TextButton(
                                        onPressed: (() {
                                          accept(widget.id);
                                        }),
                                        child: Text(
                                          "Accept",
                                          style: TextStyle(color: Colors.white),
                                        ))),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Container(
                                height: 40.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.red,
                                ),
                                child: Center(
                                    child: TextButton(
                                        onPressed: (() {
                                          rejects(widget.id);
                                        }),
                                        child: Text(
                                          "Reject",
                                          style: TextStyle(color: Colors.white),
                                        ))),
                              ),
                            ],
                          )
                        : reqaccreg!['status'] == "1"
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 40.h,
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.green,
                                    ),
                                    child: Center(
                                        child: TextButton(
                                            onPressed: (() {}),
                                            child: Text(
                                              "Accepted",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ))),
                                  ),
                                ],
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 40.h,
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.red,
                                    ),
                                    child: Center(
                                        child: TextButton(
                                            onPressed: (() {}),
                                            child: Text(
                                              "Rejected",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ))),
                                  ),
                                ],
                              ),
                  )
                ],
              ),
            ),
          ]);
        },
      ),
    );
  }
}
