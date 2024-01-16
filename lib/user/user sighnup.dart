import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import 'User_login.dart';

class UserSighnup extends StatefulWidget {
  const UserSighnup({super.key});

  @override
  State<UserSighnup> createState() => _UserSighnupState();
}

class _UserSighnupState extends State<UserSighnup> {
  XFile? _image;

  var imageUrl;
  //
  final formkey = GlobalKey<FormState>();
  //
  var Username = TextEditingController();
  var Phonenumber = TextEditingController();
  var email = TextEditingController();
  var Password = TextEditingController();
  var location = TextEditingController();
  Future<dynamic> sigh() async {
    await FirebaseFirestore.instance.collection('User').add({
      "username": Username.text,
      "phone": Phonenumber.text,
      "Mail": email.text,
      "Location": location.text,
      "password": Password.text,
      "profilepath":imageUrl,
      "status": 0
    }).then((value) {
      print("Success");
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return Userlogin();
        },
      ));
      print("Signup success");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffCFE2FF),
        body: Form(
          key: formkey,
          child: ListView(
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
                      "SIGN UP",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 50.w, bottom: 10.h),
                child: Row(
                  children: [
                    Text(
                      "Enter username",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'empty username';
                          }
                        },
                        controller: Username,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "  Username",
                            hintStyle: TextStyle(color: Colors.grey))),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                        color: Colors.white),
                  )
                ],
              ),
              // phone
              Padding(
                padding: EdgeInsets.only(
                  left: 50.w,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Enter Phone number",
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'empty number';
                          }
                        },
                        controller: Phonenumber,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "  Phone number",
                            hintStyle: TextStyle(color: Colors.grey))),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                        color: Colors.white),
                  )
                ],
              ),
              //email
              Padding(
                padding: EdgeInsets.only(
                  left: 50.w,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Enter Your email",
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'empty email';
                          }
                        },
                        controller: email,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "  Enter email",
                            hintStyle: TextStyle(color: Colors.grey))),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                        color: Colors.white),
                  )
                ],
              ),
              // location
              Padding(
                padding: EdgeInsets.only(left: 50.w, bottom: 10.h),
                child: Row(
                  children: [
                    Text(
                      "Enter District",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'empty location';
                          }
                        },
                        controller: location,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "  Location",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ))),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                        color: Colors.white),
                  )
                ],
              ),
              //pass
              Padding(
                padding: EdgeInsets.only(
                  left: 50.w,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Enter your Password",
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                        },
                        controller: Password,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "  Enter your Password",
                            hintStyle: TextStyle(color: Colors.grey))),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                        color: Colors.white),
                  )
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Upload your image",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        pickimage();
                      },
                      icon: Icon(Icons.camera_alt)),
                ],
              ),
              //

              // login
              Padding(
                padding: EdgeInsets.only(top: 50.h, bottom: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 190.w,
                      height: 50.h,
                      child: TextButton(
                          onPressed: () {
                            uploadimage();
                            if (formkey.currentState!.validate()) {
                              sigh();
                            }
                          },
                          child: Text(
                            "SIGN UP",
                            style: TextStyle(color: Colors.white),
                          )),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          color: Color(0xff2357D9)),
                    )
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Userlogin();
                      },
                    ));
                  },
                  child: Text(
                    "Log In",
                    style: TextStyle(color: Color(0xff2357D9)),
                  ))
            ],
          ),
        ));
  }

  Future<void> pickimage() async {
    final ImagePicker _picker = ImagePicker();
    try {
      XFile? pickedimage = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedimage != null) {
        setState(() {
          _image = pickedimage;
        });
        await uploadimage();
      }
    } catch (e) {
      print("Error picking image:$e");
    }
  }

//
  Future<void> uploadimage() async {
    try {
      if (_image != null) {
        Reference storrageReference =
            FirebaseStorage.instance.ref().child('profile/${_image!.path}');
        await storrageReference.putFile(File(_image!.path));
         imageUrl = await storrageReference.getDownloadURL();
      }
    } catch (e) {
      print("Error uploading image:$e");
    }
  }
}
