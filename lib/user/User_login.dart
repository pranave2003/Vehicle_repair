import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicle_project/user/user%20sighnup.dart';
import 'package:vehicle_project/user/user_mechanic_list.dart';

import '../admin/Admin_home_User.dart';

class Userlogin extends StatefulWidget {
  const Userlogin({super.key});

  @override
  State<Userlogin> createState() => _UserloginState();
}

class _UserloginState extends State<Userlogin> {
  bool isloading = false;
  void _handleButtonPress() {
    setState(() {
      isloading = true;
    });

    // Future.delayed(Duration(seconds: 2), () {
    //   setState(() {
    //     isloading = false;
    //   });
    // });
  }

  var username = TextEditingController();
  var password = TextEditingController();
  final formkey = GlobalKey<FormState>();
  String id = '';
  String name = '';
  String email = '';
  String phone = '';
  String path = '';

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffCFE2FF),
        body: SingleChildScrollView(
          child: Form(
            key: formkey,
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
                        " USER LOGIN",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 20),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 50),
                  child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'empty Email id';
                        }
                      },
                      controller: username,
                      cursorColor: Colors.blue,
                      style: TextStyle(),
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Username",
                          enabledBorder: OutlineInputBorder(),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))))),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 70),
                  child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'empty password';
                        }
                      },
                      controller: password,
                      cursorColor: Colors.blue,
                      style: TextStyle(),
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Enter Password",
                          enabledBorder: OutlineInputBorder(),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))))),
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
                  padding: EdgeInsets.only(top: 60.h),
                  child: isloading
                      ? const CircularProgressIndicator(
                          color: Colors.blue,
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 190.w,
                              height: 50.h,
                              child: TextButton(
                                  onPressed: () {
                                    if (formkey.currentState!.validate()) {
                                      _handleButtonPress();
                                      userLogin();
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "LOGIN",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Do you have account ?"),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return UserSighnup();
                                },
                              ));
                            });
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(color: Colors.blueAccent),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void userLogin() async {
    final user = await FirebaseFirestore.instance
        .collection('User')
        .where('Mail', isEqualTo: username.text)
        .where('password', isEqualTo: password.text)
        .where('status', isEqualTo: 1)
        .get();

    if (user.docs.isNotEmpty) {
      id = user.docs[0].id;
      name = user.docs[0]['username'];
      email = user.docs[0]['Mail'];
      phone = user.docs[0]['phone'];
      path = user.docs[0]['profilepath'];
      SharedPreferences data = await SharedPreferences.getInstance();

      data.setString('id', id);
      data.setString('name', name);
      data.setString('email', email);
      data.setString('phone', phone);
      data.setString('paath', path);
      setState(() {
        isloading = false;
      });

      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return UserMechanicList();
        },
      ));
    } else {
      setState(() {
        isloading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          elevation: BorderSide.strokeAlignOutside,
          content: Text(
            "username and password error",
            style: TextStyle(color: Colors.red),
          )));
    }
  }
}
