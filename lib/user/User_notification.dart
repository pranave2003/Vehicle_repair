import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserNotification extends StatefulWidget {
  const UserNotification({super.key});

  @override
  State<UserNotification> createState() => _UserNotificationState();
}

class _UserNotificationState extends State<UserNotification> {
  final lists = FirebaseFirestore.instance.collection("Notification");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios)),
          title: Center(child: Text("Notification")),
          backgroundColor: Color(0xffCFE2FF)),
      body: StreamBuilder(
        stream: lists.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LinearProgressIndicator(color: Colors.red),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Error:${snapshot.error}"),
            );
          }
          final UserNoti = snapshot.data?.docs ?? [];
          return ListView.builder(
            itemCount: UserNoti.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(20.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 300.w,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: 200,
                                    child: Text(
                                      UserNoti[index]['content'],
                                      style: TextStyle(
                                          color: Colors.black87, fontSize: 15),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    UserNoti[index]['Time'],
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    UserNoti[index]['date'],
                                    style: TextStyle(color: Colors.black),
                                  ),
                                )
                              ],
                            )
                          ],
                        )),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
