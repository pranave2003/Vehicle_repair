import 'package:cloud_firestore/cloud_firestore.dart';
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
        leading:
            CircleAvatar(backgroundImage: AssetImage("assets/officedp.jpg")),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("UserRequest")
            .where("payment", isEqualTo: '5')
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LinearProgressIndicator(
              color: Colors.red,
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Error:${snapshot.error}"),
            );
          }
          final payment = snapshot.data?.docs ?? [];
          return payment == null
              ? Text('data')
              : ListView.builder(
                  itemCount: payment.length,
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
                                      payment[index]['username'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      payment[index]['WorkCompleteAmount'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(payment[index]["Work"]),
                                    Text(payment[index]["mechname"]),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(payment[index]['Time']),
                              )
                            ],
                          )
                        ]),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
