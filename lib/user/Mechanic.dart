import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Mechanic extends StatefulWidget {
  const Mechanic({super.key});

  @override
  State<Mechanic> createState() => _MechanicState();
}

class _MechanicState extends State<Mechanic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(10.sp),
            child: Container(
              height: 150.h,
              width: 100.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffCFE2FF)),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          Text("1+ year experience"),
                          Text("Fuel leaking"),
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
                      ),
                    ),

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
