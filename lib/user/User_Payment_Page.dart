import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vehicle_project/user/user_mechanic_list.dart';

import 'User_rating.dart';

class UserPaymentPage extends StatefulWidget {
  const UserPaymentPage({super.key});

  @override
  State<UserPaymentPage> createState() => _UserPaymentPageState();
}

class _UserPaymentPageState extends State<UserPaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              height: 110.h,
              width: 110.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/check 1.png"), fit: BoxFit.fill),
              ),
            )
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Successful",
                style: TextStyle(fontSize: 25),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 300.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 180.w,
                  height: 40.h,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserMechanicList(),
                            ));
                      },
                      child: Center(
                        child: Text(
                          "Back to home page",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue.shade900),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
