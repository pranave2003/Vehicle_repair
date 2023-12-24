import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MechNotification extends StatefulWidget {
  const MechNotification({super.key});

  @override
  State<MechNotification> createState() => _MechNotificationState();
}

class _MechNotificationState extends State<MechNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(onPressed: () {
Navigator.of(context).pop();
          }, icon: Icon(Icons.arrow_back_ios)),
          title: Center(child: Text("Notification")),
          backgroundColor: Color(0xffCFE2FF)),
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 100.h,
                width: 300.w,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Admin notification",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("10:00 am"),
                        )
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "10/05/2023",
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      ],
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
