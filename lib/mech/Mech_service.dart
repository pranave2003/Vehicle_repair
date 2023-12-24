import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Mech_Add_service.dart';

class MechService extends StatefulWidget {
  const MechService({super.key});

  @override
  State<MechService> createState() => _MechServiceState();
}

class _MechServiceState extends State<MechService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 330.w,
                height: 400.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffCFE2FF)),
                child: Column(children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width:200.w,child: Text("Type puncher service",style: TextStyle(fontSize: 20))),
                      SizedBox(width: 50.w,child: IconButton(onPressed: () {}, icon: Icon(Icons.delete)))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Divider(color: Colors.black87,),
                  ),
                //
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width:200.w,child: Text("Engine service",style: TextStyle(fontSize: 20))),
                      SizedBox(width: 50.w,child: IconButton(onPressed: () {}, icon: Icon(Icons.delete)))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Divider(color: Colors.black87,),
                  ),
                //
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width:200.w,child: Text("A/c service",style: TextStyle(fontSize: 20))),
                      SizedBox(width: 50.w,child: IconButton(onPressed: () {}, icon: Icon(Icons.delete)))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Divider(color: Colors.black87,),
                  ),
                //
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width:200.w,child: Text("Electric service",style: TextStyle(fontSize: 20))),
                      SizedBox(width: 50.w,child: IconButton(onPressed: () {}, icon: Icon(Icons.delete)))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Divider(color: Colors.black87,),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child:Icon(Icons.add),
        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MechAddService();
        },));},
      ),
      appBar: AppBar(
          backgroundColor: Color(0xffCFE2FF),
          title: Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
              Text("service"),
            ],
          )),
    );
  }
}
