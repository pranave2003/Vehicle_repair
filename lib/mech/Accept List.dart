import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Mech_Status complted.dart';

class AcceptList extends StatefulWidget {
  const AcceptList({super.key});

  @override
  State<AcceptList> createState() => _AcceptListState();
}

class _AcceptListState extends State<AcceptList> {
  var ID;
  var pth;
  @override
  void initState() {
    super.initState();
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
            .where("status", isEqualTo: "1")

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
          final AcceptList = snapshot.data?.docs ?? [];
          return ListView.builder(
            itemCount: AcceptList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  if (AcceptList[index]['payment'] == '5') {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        duration: Duration(seconds: 1),
                        backgroundColor: Colors.green,
                        behavior: SnackBarBehavior.floating,
                        content: Text(
                          "payment successfully received",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        )));
                  } else {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return MechStatusCompleated(id: AcceptList[index].id);
                      },
                    ));
                  }
                },
                child: Padding(
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
                                  backgroundImage: NetworkImage(
                                      AcceptList[index]['UserProfile']),
                                ),
                                Text(AcceptList[index]['username'])
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Text(AcceptList[index]['Work']),
                                Text(AcceptList[index]['Time']),
                                Text(AcceptList[index]['time']),
                                Text(AcceptList[index]['Location']),
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AcceptList[index]['payment'] == '3'
                                  ? Container(
                                      height: 30.h,
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.green,
                                      ),
                                      child: Center(
                                        child: Text("payment request send",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    )
                                  : AcceptList[index]['payment'] == "4"
                                      ? Container(
                                          height: 30.h,
                                          width: 100.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.red,
                                          ),
                                          child: Center(
                                            child: Text("Payment request faild",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                        )
                                      : AcceptList[index]['payment'] == '5'
                                          ? Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text("recived",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.green,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                              ),
                                            )
                                          : Container(
                                              height: 30.h,
                                              width: 100.w,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.red,
                                              ),
                                              child: Center(
                                                child: Text("approved",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                              ),
                                            ))
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
