import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MechRating extends StatefulWidget {
  const MechRating({super.key});

  @override
  State<MechRating> createState() => _MechRatingState();
}

class _MechRatingState extends State<MechRating> {
  bool isloading = true;
  var ID;
  var pth;
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      ID = spref.getString("id");
      pth = spref.getString('paath');

      spref.setString("id", ID);

      spref.setString('paath', pth);
    });
    print("Updated");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xffCFE2FF),
          title: Row(
            children: [
              Text("Rating"),
            ],
          )),
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
          final requestlist = snapshot.data?.docs ?? [];
          return ListView.builder(
            itemCount: requestlist.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 120.h,
                  width: 330.w,
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
                              Text(requestlist[index]['username'])
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3),
                          child: Column(
                            children: [
                              Text(requestlist[index]['Work']),
                              Text(requestlist[index]['Time']),
                              Text(requestlist[index]["time"]),
                              Text(requestlist[index]['Location']),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Text("Rating"),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RatingBar.builder(
                                      initialRating: requestlist[index]
                                          ['rating'],
                                      itemCount: 5,
                                      itemSize: 10,
                                      direction: Axis.horizontal,
                                      itemBuilder: (Context, _) =>
                                          Icon(Icons.star, color: Colors.amber),
                                      onRatingUpdate: (rating) {}),
                                ],
                              ),
                              Text("4/5")
                            ],
                          ),
                        )
                      ],
                    ),
                  ]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
