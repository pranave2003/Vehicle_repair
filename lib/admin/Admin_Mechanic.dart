import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminMechanic extends StatefulWidget {
  const AdminMechanic({
    super.key,
    required this.id,
  });
  final id;

  @override
  State<AdminMechanic> createState() => _AdminMechanicState();
}

class _AdminMechanicState extends State<AdminMechanic> {
  DocumentSnapshot? mesign;
  //
  //
  //
  getdata() async {
    mesign = await FirebaseFirestore.instance
        .collection('mechsighn')
        .doc(widget.id)
        .get();
  }

  //
  //
  //
  void accepts(id) {
    setState(() {
      FirebaseFirestore.instance
          .collection('mechsighn')
          .doc(id)
          .update({'status': 1});
    });
  }

  //
  //
  //
  //
  void rejects(id) {
    setState(() {
      FirebaseFirestore.instance
          .collection('mechsighn')
          .doc(id)
          .update({'status': 2});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE8F1FF),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            Center(
              child: FutureBuilder(future: getdata(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting){return const Center(child: CircularProgressIndicator());}
                    if (snapshot.hasError) {
                      return Text("Error${snapshot.error}");
                    }
                    return  Container(
                      width: 350.w,
                      height: 830.h,
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
                                  height: 120.h,
                                  width: 120.w,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage("assets/officedp.jpg"),
                                          fit: BoxFit.fill),
                                      borderRadius: BorderRadius.circular(130),
                                      color: Colors.black87),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(mesign!['username'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600, fontSize: 18)),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RatingBar.builder(
                                        initialRating: 3,
                                        itemCount: 5,
                                        itemSize: 20,
                                        direction: Axis.horizontal,
                                        itemBuilder: (Context, _) =>
                                            Icon(Icons.star, color: Colors.amber),
                                        onRatingUpdate: (rating) {}),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                    mesign!['Location'],
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
                                      hintText: mesign!['username'],
                                      hintStyle: TextStyle(color: Colors.black87))),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  color: Color(0xffE8F1FF)),
                            )
                          ],
                        ),
                        //   phone

                        Padding(
                          padding: EdgeInsets.only(left: 30.w, top: 2.h),
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
                                      hintText: mesign!['Phonenumber'],
                                      hintStyle: TextStyle(color: Colors.black87))),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  color: Color(0xffE8F1FF)),
                            )
                          ],
                        ),
                        //   email

                        Padding(
                          padding: EdgeInsets.only(left: 30.w, top: 2.h),
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
                                        hintText: mesign!['email'],
                                        hintStyle: TextStyle(color: Colors.black87))),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  color: Color(0xffE8F1FF)),
                            )
                          ],
                        ),
                        //
                        Padding(
                          padding: EdgeInsets.only(left: 30.w, top: 2.h),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Work experience",
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
                                      hintText: mesign!['experience'],
                                      hintStyle: TextStyle(color: Colors.black87))),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  color: Color(0xffE8F1FF)),
                            )
                          ],
                        ),
                        //
                        Padding(
                          padding: EdgeInsets.only(left: 30.w, top: 2.h),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Work shop name",
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
                                      hintText:mesign!['shopename'],
                                      hintStyle: TextStyle(color: Colors.black87))),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  color: Color(0xffE8F1FF)),
                            )
                          ],
                        ),
                        //
                        Padding(
                          padding: EdgeInsets.only(left: 30.w, top: 2.h),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Your location",
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
                                      hintText: mesign!['Location'],
                                      hintStyle: TextStyle(color: Colors.black87))),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  color: Color(0xffE8F1FF)),
                            )
                          ],
                        ),
                        //

                        //button
                        Padding(
                          padding:  EdgeInsets.only(top: 20.h, bottom: 50.h,),
                          child:mesign!['status']==0?
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 150.w,
                                height: 50.h,
                                decoration: BoxDecoration(
                                    color: Color(0xff73ABFF),
                                    borderRadius: BorderRadius.circular(5.sp)),
                                child: TextButton(
                                    onPressed: () {
                                      accepts(widget.id);
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
                                    borderRadius: BorderRadius.circular(5.sp)),
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
                              :mesign!['status']==1?
                          Row(  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 150.w,
                                height: 50.h,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius:
                                    BorderRadius.circular(5.sp)),
                                child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Accepted",
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ),
                            ],
                          )
                              :
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 150.w,
                                height: 50.h,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius:
                                    BorderRadius.circular(5.sp)),
                                child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Rejected",
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ),
                            ],
                          )
                        )
                      ]),
                    );
                  },

              ),
            )
          ]),
        ),
      ),
    );
  }
}
