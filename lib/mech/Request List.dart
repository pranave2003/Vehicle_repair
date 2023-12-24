import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Mech_service_accept or reject.dart';

class RequestList extends StatefulWidget {
  const RequestList({super.key});

  @override
  State<RequestList> createState() => _RequestListState();
}

class _RequestListState extends State<RequestList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(10.sp),
            child: InkWell(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MechServiceAccept();
              },));
            },
              child: Container(
                height: 120.h,
                width: 100.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffCFE2FF)),
                child: Column(children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            CircleAvatar(radius: 30,
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
                      )
                    ],
                  )

                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
