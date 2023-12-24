import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Usermechanicdetailpage extends StatefulWidget {
  const Usermechanicdetailpage({super.key});

  @override
  State<Usermechanicdetailpage> createState() => _UsermechanicdetailpageState();
}

class _UsermechanicdetailpageState extends State<Usermechanicdetailpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xffCFE2FF),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
              Text("Needed service"),
              SizedBox()
            ],
          )),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    height: 130.h,
                    width: 130.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/bMan.png"),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Name",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Contact Number",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "2+ year experience",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    width: 100.w,
                    height: 30.h,
                    child: Center(
                        child: Text("Available",
                            style: TextStyle(color: Colors.white))),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green),
                  ),
                ],
              )
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Text("Add needed service"),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 260.w,
                height: 40.h,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Fuel leaking"),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.keyboard_arrow_down))
                    ]),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffCFE2FF)),
              ),
              IconButton(onPressed: () {

              }, icon: Icon(Icons.add))
            ],
          ),

          //
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Text("Place"),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 260.w,
                height: 70.h,
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Beach road Calicut"),
                  ),
                ]),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffCFE2FF)),
              )
            ],
          ),
          Padding(
            padding:  EdgeInsets.only(top: 100.sp),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 180.w,
                  height: 50.h,
                  child: TextButton(
                      onPressed: () {},
                      child: Center(
                        child: Text(
                          "Request",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue.shade900),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
