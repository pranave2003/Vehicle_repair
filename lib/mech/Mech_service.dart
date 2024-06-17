import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Mech_service_home.dart';

class MechService extends StatefulWidget {
  const MechService({super.key});

  @override
  State<MechService> createState() => _MechServiceState();
}

class _MechServiceState extends State<MechService> {
  var Ser = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("Service")
            .where("mechid", isEqualTo: ID)
            .get(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LinearProgressIndicator(
              color: Colors.red,
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Error:${snapshot.error}"),
            );
          }
          final Serviceeee = snapshot.data?.docs ?? [];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 350.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffCFE2FF)),
                    child: ListView.builder(
                      itemCount: Serviceeee.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Text(Serviceeee[index]["Serviceinfo"],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700)),
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        FirebaseFirestore.instance
                                            .collection('Service')
                                            .doc(Serviceeee[index].id)
                                            .delete();
                                      });
                                    },
                                    icon: Icon(Icons.delete_rounded))
                              ],
                            ),
                            Divider(
                              endIndent: 10,
                              indent: 10,
                              color: Colors.black87,
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: Color(0xffCFE2FF),
                title: Text("Add service"),
                content: TextFormField(
                    controller: Ser,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'empty file';
                      }
                    },
                    style: TextStyle(),
                    decoration: InputDecoration(
                        filled: true,
                        border: InputBorder.none,
                        hintText: "Enter")),
                actions: [
                  Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        onPressed: () {
                          service();
                        },
                        child: Text(
                          "Add",
                          style: TextStyle(color: Colors.white),
                        )),
                  )
                ],
              );
            },
          );
        },
      ),
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xffCFE2FF),
          title: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return MechServiceHome();
                      },
                    ));
                  },
                  icon: Icon(Icons.arrow_back_ios)),
              Text("service"),
            ],
          )),
    );
  }

  Future<dynamic> service() async {
    setState(() {
      FirebaseFirestore.instance
          .collection("Service")
          .add({"Serviceinfo": Ser.text, "mechid": ID});

      Navigator.of(context).pop();

      print("////////// service add successfully");
    });
    Ser.clear();
  }

  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      ID = spref.getString("id");

      spref.setString("id", ID ?? '');

      isLoading = false;
    });
    print("Updated");
  }

  var ID;
  bool isLoading = true;
}
