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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 50,
                  width: 200,
                  color: Colors.grey,
                  child: TextFormField(
                    controller:gett ,
                    decoration: InputDecoration(hintText: "enter your code"),
                  )),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                register();
              },
              child: Text("Add"))
        ],
      ),
    );
  }
}
