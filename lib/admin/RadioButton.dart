import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../mech/mech login.dart';
import '../user/User_login.dart';
import 'Admin_login.dart';

class Abcs extends StatefulWidget {
  const Abcs({super.key});
  @override
  State<Abcs> createState() => _AbcsState();
}

class _AbcsState extends State<Abcs> {
  int? usermechadmin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffCFE2FF),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 100.h),
                child: SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 140.h,
                        width: 140.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/tow 3.png"),
                                fit: BoxFit.fill)),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(
                      20,
                    ),
                    child: Text(
                      "Who are you",
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                  )
                ],
              ),
              ListTile(
                  trailing: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/users.png")),
                  title: Text("USER"),
                  leading: Radio(
                    value: 1,
                    activeColor: Colors.green,
                    groupValue: usermechadmin,
                    onChanged: (value) {
                      setState(() {
                        usermechadmin = value;
                      });
                    },
                  )),
              ListTile(
                  trailing: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/mechs.png")),
                  title: Text("MECH"),
                  leading: Radio(
                    activeColor: Colors.red,
                    value: 2,
                    groupValue: usermechadmin,
                    onChanged: (value) {
                      setState(() {
                        usermechadmin = value;
                      });
                    },
                  )),
              ListTile(
                  trailing: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/admins.jpg")),
                  title: Text("ADMIN"),
                  leading: Radio(
                    value: 3,
                    activeColor: Colors.blueAccent,
                    groupValue: usermechadmin,
                    onChanged: (value) {
                      setState(() {
                        usermechadmin = value;
                      });
                    },
                  )),
              Padding(
                padding: EdgeInsets.only(top: 250.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 190.w,
                      height: 50.h,
                      child: TextButton(
                          onPressed: () {
                            if (1 == usermechadmin)
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return Userlogin();
                                },
                              ));
                            if (2 == usermechadmin)
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return Mechlogin();
                                },
                              ));
                            if (3 == usermechadmin)
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return Adminlogin();
                                },
                              ));
                          },
                          child: Text(
                            "CONTINUE",
                            style: TextStyle(color: Colors.white),
                          )),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          color: Color(0xff2357D9)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
