import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Admin_home_User.dart';

class Adminlogin extends StatefulWidget {
  const Adminlogin({super.key});

  @override
  State<Adminlogin> createState() => _AdminloginState();
}

class _AdminloginState extends State<Adminlogin> {
  final formkey = GlobalKey<FormState>();
  var Name = TextEditingController();
  var Pass = TextEditingController();
  login() {
    if (Name.text == 'admin@gmail.com' && Pass.text == '123') {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return AdminHomeuser();
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xffCFE2FF),
            automaticallyImplyLeading: false,
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_ios)),
          ),
          backgroundColor: Color(0xffCFE2FF),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.h),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(
                        20,
                      ),
                      child: Text(
                        "ADMIN LOGIN",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 20),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40,
                    right: 40,
                  ),
                  child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'empty username';
                        }
                      },
                      controller: Name,
                      cursorColor: Colors.blue,
                      style: TextStyle(),
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Enter username",
                          enabledBorder: OutlineInputBorder(),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))))),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 50),
                  child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'empty Password';
                        }
                      },
                      controller: Pass,
                      cursorColor: Colors.blue,
                      style: TextStyle(),
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Enter password",
                          enabledBorder: OutlineInputBorder(),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))))),
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
                              if (formkey.currentState!.validate()) {
                                login();
                              }
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
              ],
            ),
          )),
    );
  }
}
