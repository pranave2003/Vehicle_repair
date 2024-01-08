import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';




class Viewstudent extends StatefulWidget {
  const Viewstudent({super.key});

  @override
  State<Viewstudent> createState() => _ViewstudentState();
}

class _ViewstudentState extends State<Viewstudent> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("hgh")),
      body:FutureBuilder(future: FirebaseFirestore.instance.collection('Teacher').get(),
        builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
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
          final vedio=snapshot.data?.docs??[];
          return ListView.builder(
            itemCount: vedio.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(10.sp),
                child: Container(
                  height: 100.h,
                  width: 100.w,
                  color: Colors.white,
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(width:200,
                                child: Text(
                                  vedio[index]['Teacher'],
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                              ),
                           Text("class${vedio[index]}")


                            ],
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(onPressed: () {
                              print('$vedio');
                              launchUrl(Uri.parse('${vedio[index]['Teacher']}'));


                            }, icon: Icon(Icons.play_arrow))
                        )
                      ],
                    )
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
