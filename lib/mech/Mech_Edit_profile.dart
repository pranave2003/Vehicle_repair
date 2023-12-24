import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Mech_profile.dart';

class MechEditProfile extends StatefulWidget {
  const MechEditProfile({super.key});

  @override
  State<MechEditProfile> createState() => _MechEditProfileState();
}

class _MechEditProfileState extends State<MechEditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            Center(
              child: Container(
                width: 350.w,
                height: 830.h,
                color: Colors.white,
                child: ListView(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {Navigator.of(context).pop();}, icon: Icon(Icons.arrow_back_ios)),
                        IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return MechProfile();
                        },));}, icon: Icon(Icons.edit))
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
                                color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                  //
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 310.w,
                          height: 50.h,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Name",
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: Color(0xffE8F1FF)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 310.w,
                          height: 50.h,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(" User Name",
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: Color(0xffE8F1FF)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 310.w,
                          height: 50.h,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("phone number",
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: Color(0xffE8F1FF)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 310.w,
                          height: 50.h,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Email",
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: Color(0xffE8F1FF)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 310.w,
                          height: 50.h,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("experience",
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: Color(0xffE8F1FF)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 310.w,
                          height: 50.h,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Location",
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: Color(0xffE8F1FF)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 310.w,
                          height: 50.h,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Shop Name",
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: Color(0xffE8F1FF)),
                        )
                      ],
                    ),
                  ),

                  //

                  //button
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, bottom: 100.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 150.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                              color: Color(0xff2357D9),
                              borderRadius: BorderRadius.circular(5.sp)),
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Done",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        // second
                      ],
                    ),
                  )
                ]),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
