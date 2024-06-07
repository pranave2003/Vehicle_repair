import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehicle_project/mech/mech%20login.dart';

class Forgotchang extends StatefulWidget {
  const Forgotchang({super.key, required this.id});
  final id;

  @override
  State<Forgotchang> createState() => _ForgotchangState();
}

class _ForgotchangState extends State<Forgotchang> {
  var pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(hintText: "pass"),
            controller: pass,
          ),
          ElevatedButton(
              onPressed: () {
                FirebaseFirestore.instance
                    .collection("mechsighn")
                    .doc(widget.id)
                    .update({"password": pass.text});
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return Mechlogin();
                  },
                ));
              },
              child: Text("chang password"))
        ],
      ),
    );
  }
}
