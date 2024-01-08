import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Addteacher extends StatefulWidget {
  const Addteacher({super.key});

  @override
  State<Addteacher> createState() => _AddteacherState();
}

class _AddteacherState extends State<Addteacher> {
  var gett = TextEditingController();

  Future<dynamic> register() async {
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${gett.text}');
    await FirebaseFirestore.instance.collection('Teacher').add({
      "Teacher": gett.text,
    }).then((value) {
      print('object');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.greenAccent,title: Text("Add video")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 50,
                  width: 300,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),  color: Colors.greenAccent,),
                  child: TextFormField(
                    controller:gett ,
                    decoration: InputDecoration(hintText: "   enter your video link",border: InputBorder.none),
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  register();
                },
                child: Text("Add link")),
          )
        ],
      ),
    );
  }
}
