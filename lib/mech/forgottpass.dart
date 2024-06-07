import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'forgotchang.dart';

class Forgottpass extends StatefulWidget {
  const Forgottpass({super.key});

  @override
  State<Forgottpass> createState() => _ForgottpassState();
}

class _ForgottpassState extends State<Forgottpass> {
  var email = TextEditingController();
  String id = '';
  String number = '';
  void mechLogin() async {
    final user = await FirebaseFirestore.instance
        .collection('mechsighn')
        .where('email', isEqualTo: email.text)
        .where('status', isEqualTo: 1)
        .get();
    if (user.docs.isNotEmpty) {
      id = user.docs[0].id;
      number = user.docs[0][""];

      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return Forgotchang(id: id);
        },
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        "username and password error",
        style: TextStyle(color: Colors.red),
      )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: email,
            decoration: InputDecoration(hintText: "email"),
          ),
          ElevatedButton(
              onPressed: () {
                mechLogin();
              },
              child: Text("check mail"))
        ],
      ),
    );
  }
}
