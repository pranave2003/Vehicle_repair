import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Mech_service_accept or reject.dart';

class RequestList extends StatefulWidget {
  const RequestList({super.key});

  @override
  State<RequestList> createState() => _RequestListState();
}

class _RequestListState extends State<RequestList> {
  var ID;
  var pth;
  void initState() {
    getData();
  }

  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      ID = spref.getString("id");
      //

      pth = spref.getString('paath');

      spref.setString("id", ID);

      spref.setString('paath', pth);
    });
    print("Updated");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("UserRequest")
            .where("mechid", isEqualTo: ID)
            .where("status", isEqualTo: '0')

            // .where("Location", isEqualTo: selectedvalue)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Error:${snapshot.error}"),
            );
          }
          final Rquastlist = snapshot.data?.docs ?? [];
          return ListView.builder(
            itemCount: Rquastlist.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(10.sp),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return MechServiceAccept(id: Rquastlist[index].id);
                      },
                    ));
                  },
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
                                  backgroundImage: NetworkImage(
                                      Rquastlist[index]['UserProfile']),
                                ),
                                Text(Rquastlist[index]['username'])
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Text(Rquastlist[index]['Work']),
                                Text(Rquastlist[index]['Time']),
                                Text(Rquastlist[index]['time']),
                                Text(Rquastlist[index]['Location']),
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
          );
        },
      ),
    );
  }
}
