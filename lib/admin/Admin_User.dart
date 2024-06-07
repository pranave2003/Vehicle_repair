import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminUser extends StatefulWidget {
  const AdminUser({super.key, required this.id});

  final id;
  @override
  State<AdminUser> createState() => _AdminUserState();
}

class _AdminUserState extends State<AdminUser> {
  DocumentSnapshot? user;
  //
  //
  //
  getDtata() async {
    user = await FirebaseFirestore.instance
        .collection('User')
        .doc(widget.id)
        .get();
  }

  //
  //
  //
  void accept(id) {
    setState(() {
      FirebaseFirestore.instance
          .collection('User')
          .doc(id)
          .update({'status': 1});
      //
      //
      //
      //
    });
  }

  void rejects(id) {
    setState(() {
      FirebaseFirestore.instance
          .collection('User')
          .doc(id)
          .update({'status': 2});
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE8F1FF),
      body: SafeArea(
        child: ListView(children: [
          Center(
              child: FutureBuilder(
            future: getDtata(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text("Error${snapshot.error}");
              }
              return Container(
                width: 350.w,
                height: 800.h,
                color: Colors.white,
                child: ListView(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(Icons.arrow_back_ios))
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 150.h,
                            width: 150.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/officedp.jpg"),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(130),
                                color: Colors.grey),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(user!['username'],
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              user!['Location'],
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 20),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.w, top: 20.h),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Username",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 290.w,
                        height: 50.h,
                        child: TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: user!['username'],
                                hintStyle: TextStyle(color: Colors.black87))),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            color: Color(0xffE8F1FF)),
                      )
                    ],
                  ),
                  //   phone

                  Padding(
                    padding: EdgeInsets.only(left: 30.w, top: 20.h),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Phone number",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 290.w,
                        height: 50.h,
                        child: TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: user!['phone'],
                                hintStyle: TextStyle(color: Colors.black87))),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            color: Color(0xffE8F1FF)),
                      )
                    ],
                  ),
                  //   email

                  Padding(
                    padding: EdgeInsets.only(left: 30.w, top: 20.h),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "email address",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 290.w,
                        height: 50.h,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                              readOnly: true,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: user!['Mail'],
                                  hintStyle: TextStyle(color: Colors.black87))),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            color: Color(0xffE8F1FF)),
                      )
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 130.h),
                      child: user!['status'] == 0
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 150.w,
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                      color: Color(0xff73ABFF),
                                      borderRadius:
                                          BorderRadius.circular(5.sp)),
                                  child: TextButton(
                                      onPressed: () {
                                        accept(widget.id);
                                      },
                                      child: Text(
                                        "Accept",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                                // second
                                Container(
                                  width: 150.w,
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                      color: Color(0xffFF9F9D),
                                      borderRadius:
                                          BorderRadius.circular(5.sp)),
                                  child: TextButton(
                                      onPressed: () {
                                        rejects(widget.id);
                                      },
                                      child: Text(
                                        "reject",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                )
                              ],
                            )
                          : user!['status'] == 1
                              ? Container(
                                  width: 150.w,
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius:
                                          BorderRadius.circular(5.sp)),
                                  child: TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Accepted",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                )
                              : Container(
                                  width: 150.w,
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius:
                                          BorderRadius.circular(5.sp)),
                                  child: TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Rejected",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ))
                ]),
              );
            },
          ))
        ]),
      ),
    );
  }
}
