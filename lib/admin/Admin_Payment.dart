import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminPayment extends StatefulWidget {
  const AdminPayment({super.key});

  @override
  State<AdminPayment> createState() => _AdminPaymentState();
}

class _AdminPaymentState extends State<AdminPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE8F1FF),
      appBar: AppBar(
        backgroundColor: Color(0xffE8F1FF),
        leading: CircleAvatar(backgroundImage: AssetImage("assets/officedp.jpg")),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(10.sp),
            child: Container(
              height: 100.h,
              width: 100.w,
              color: Colors.white,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "5455 /-",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Text("Service"),
                          Text("Mechanic Name"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("10/11/2023"),
                    )
                  ],
                )
              ]),
            ),
          );
        },
      ),
    );
  }
}
