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
  List<String> locationlist = [
    'Alappuzha',
    'Ernakulam',
    'Idukki',
    'Kannur',
    'Kasaragod',
    'Kollam',
    'Kottayam',
    'Kozhikode',
    'Malappuram',
    'Pathanamthitta',
    'Thiruvananthapuram',
    'Thrissur',
    'Wayanad',
  ];
  String? selectedvalue;
  XFile? _image;

  var imageURL;
  //
  final formkey = GlobalKey<FormState>();
  //
  var Username = TextEditingController();
  var Phonenumber = TextEditingController();
  var email = TextEditingController();
  var Password = TextEditingController();

  Future<dynamic> sigh() async {
    await FirebaseFirestore.instance.collection('User').add({
      "username": Username.text,
      "phone": Phonenumber.text,
      "Mail": email.text,
      "Location": selectedvalue,
      "password": Password.text,
      "profilepath": imageURL,
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6).r,
                      color: Colors.white,
                    ),
                    child: DropdownButton<String>(
                        isExpanded: true,
                        elevation: 0,
                        dropdownColor: Colors.orange,
                        hint: const Text("Location"),
                        underline: const SizedBox(),
                        value: selectedvalue,
                        items: locationlist.map((String value) {
                          return DropdownMenuItem<String>(
                              value: value, child: Text(value));
                        }).toList(),
                        onChanged: (newvalue) {
                          setState(() {
                            selectedvalue = newvalue;
                            print(selectedvalue);
                          });
                        },
                        padding: const EdgeInsets.symmetric(horizontal: 10)),
                  ),
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
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      imageURL == null
                          ? IconButton(
                              onPressed: () {
                                pickimage();
                              },
                              icon: Icon(
                                Icons.image,
                                color: Colors.blue,
                              ))
                          : imageURL != null
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Icon(
                                          Icons.photo,
                                          color: Colors.green,
                                        ),
                                        Text(
                                          "Image Uploaded",
                                          style: TextStyle(color: Colors.green),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              : Text("444 line")
                    ],
                  )),
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
                            if (formkey.currentState!.validate()) {
                              if (selectedvalue == null) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        content: Text(
                                  "Please choose your district",
                                  style: TextStyle(color: Colors.red),
                                )));
                              }

                              if (_image == null) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        content: Text(
                                  "Please upload image ",
                                  style: TextStyle(color: Colors.red),
                                )));

                                print("please pick image &");

                                Center(
                                    child: Text(
                                  "Uploading error",
                                  style: TextStyle(color: Colors.red),
                                ));
                              } else {
                                sigh();
                              }
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
        print("Image upload succersfully");
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
        imageURL = await storrageReference.getDownloadURL();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          "Uploaded succesfully",
          style: TextStyle(color: Colors.green),
        )));
        print("/////////picked$imageURL");
      } else
        CircularProgressIndicator();
    } catch (e) {
      print("Error uploading image:$e");
    }
  }
}
