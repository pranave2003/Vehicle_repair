import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AcceptList extends StatefulWidget {
  const AcceptList({super.key});

  @override
  State<AcceptList> createState() => _AcceptListState();
}

class _AcceptListState extends State<AcceptList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(10.sp),
            child: Container(
              height: 120.h,
              width: 100.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffCFE2FF)),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage("assets/dp.png"),
                          ),
                          Text("Name")
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text("Fuel leaking"),
                          Text("Data"),
                          Text("Time"),
                          Text("Place"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 40.h,
                        width: 130.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red,
                        ),
                        child: Center(
                          child: Text("payment Pending",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                    )
                  ],
                )

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Column(
                //       children: [
                //         Text(
                //           "Name",
                //           style: TextStyle(fontWeight: FontWeight.w700),
                //         ),
                //         Text(
                //           "5455 /-",
                //           style: TextStyle(fontWeight: FontWeight.w500),
                //         ),
                //         Text("Service"),
                //         Text("Mechanic Name"),
                //       ],
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Text("10/11/2023"),
                //     )
                //   ],
                // )
              ]),
            ),
          );
        },
      ),
    );
  }
}
