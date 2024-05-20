import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import 'Admin_User.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE7F0FF),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection("User").get(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return  Center(
              child: Container(height: 100,width: 100,
                child: Lottie.asset('assets/Animation - 1715334676747.json',
                    height: 100, width: 100, fit: BoxFit.fill),
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Error:${snapshot.error}"),
            );
          }
          final user = snapshot.data?.docs ?? [];

          // print(user[0].id);
          return ListView.builder(
            itemCount: user.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return AdminUser(id: user[index].id);
                      },
                    ));
                  },
                  child: ListTile(
                    tileColor: Colors.white,
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/dp.png"),
                    ),
                    // Column(
                    //   children: [
                    //     Image.asset('assets/dp.png'),
                    //   ],
                    // ),
                    title: Text(user[index]['username']),
                    subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(user[index]['phone']),
                          Text(user[index]['Mail']),
                          Text(user[index]['Location']),
                          user[index]['status'] == 0
                              ? Row(
                                  children: [
                                    Container(
                                      width: 70.w,
                                      height: 20.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.amber),
                                      child: Center(
                                          child: Text("pending",
                                              style: TextStyle(
                                                  color: Colors.white))),
                                    )
                                  ],
                                )
                              : user[index]['status'] == 1
                                  ? Container(
                                      width: 70.w,
                                      height: 20.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.green),
                                      child: Center(
                                          child: Text("Accepted",
                                              style: TextStyle(
                                                  color: Colors.white))),
                                    )
                                  : Container(
                                      width: 70.w,
                                      height: 20.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.red),
                                      child: Center(
                                          child: Text("Rejected",
                                              style: TextStyle(
                                                  color: Colors.white))),
                                    )
                        ]),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
