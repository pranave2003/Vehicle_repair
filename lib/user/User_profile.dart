import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            Center(
              child: Container(
                width: 350.w,
                height: 800.h,
                color: Colors.white,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [IconButton(onPressed: () {
                        Navigator.of(context).pop();
                      }, icon: Icon(Icons.arrow_back_ios))],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 110.h,
                            width: 110.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/officedp.jpg"), fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(130),
                                color: Colors.grey),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Name",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18)),
                          ),

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
                            "Enter your Name",
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
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "  Name",
                                hintStyle: TextStyle(color: Colors.grey))),
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
                            " Enter your Phone number",
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
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "   Phone number",
                                hintStyle: TextStyle(color: Colors.grey))),
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
                            " Enter email address",
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
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Example@gmail.com",
                                  hintStyle: TextStyle(color: Colors.grey))),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            color: Color(0xffE8F1FF)),
                      )
                    ],
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 130.h),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 150.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade900,
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
