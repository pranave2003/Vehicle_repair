import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicle_project/mech/mech_signup.dart';

import 'Mech_service_home.dart';

class Mechlogin extends StatefulWidget {
  const Mechlogin({super.key});

  @override
  State<Mechlogin> createState() => _MechloginState();
}

class _MechloginState extends State<Mechlogin> {
  var Username=TextEditingController();
  var Password=TextEditingController();
  //
  final formkey=GlobalKey<FormState>();
  //
  String id = '';
  String name = '';
  String email = '';
  String phone = '';
  String experience='';
  String Location='';
  String shopName='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffCFE2FF),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50.h),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(
                      20,
                    ),
                    child: Text(
                      "LOGIN",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 50.w),
                child: Row(
                  children: [
                    Text(
                      "Enter Email",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
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
                      width: 290.w,
                      height: 50.h,
                      child: TextFormField(
                        controller: Username,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "  Email",
                              hintStyle: TextStyle(color: Colors.grey))),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 50.w, top: 30.h),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Enter Password",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 290.w,
                      height: 50.h,
                      child: TextFormField(
                        controller:  Password,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "  Enter Password",
                              hintStyle: TextStyle(color: Colors.grey))),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.only(right: 45.w),
                        child: Text(
                          "Forgot password ?",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 15.sp,
                          ),
                        ),
                      ))
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 90.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 190.w,
                      height: 50.h,
                      child: TextButton(
                          onPressed: () {
                            mechLogin();
                          },
                          child: Text(
                            "LOGIN",
                            style: TextStyle(color: Colors.white),
                          )),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          color: Color(0xff2357D9)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Do you have account ?"),
                    TextButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Mechsignup();
                      },));
                    }, child: Text("Sign up",style: TextStyle(color: Colors.blueAccent),))
                  ],
                ),
              )
            ],
          ),
        ));
  }
  void mechLogin() async {
    final user = await FirebaseFirestore.instance
        .collection('mechsighn')
        .where('email', isEqualTo: Username.text)
        .where('password', isEqualTo: Password.text)
        .where('status', isEqualTo: 1)
        .get();
    if (user.docs.isNotEmpty) {
      id = user.docs[0].id;
      name = user.docs[0]['username'];
      email = user.docs[0]['email'];
      phone = user.docs[0]['Phonenumber'];
      experience=user.docs[0]['experience'];
      Location=user.docs[0]['Location'];
      shopName=user.docs[0]['shopename'];



      SharedPreferences data = await SharedPreferences.getInstance();
      data.setString('id', id);
      data.setString('name', name);
      data.setString('email', email);
      data.setString('phone', phone);
      data.setString("exp", experience);
        data.setString('loc', Location);
      data.setString('spname', shopName);


      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return MechServiceHome();
        },
      ));
    } else {

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            "username and password error",
            style: TextStyle(color: Colors.red),
          )));
    }

  }
}
