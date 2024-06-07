import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Changpass extends StatefulWidget {
  const Changpass({super.key});

  @override
  State<Changpass> createState() => _ChangpassState();
}

class _ChangpassState extends State<Changpass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
                hintText: "Current  pass",
                prefixIcon: Icon(Icons.key),
                suffixIcon: Icon(Icons.add_a_photo)),
          ),
          TextFormField(),
          TextFormField(),
          ElevatedButton(onPressed: () {}, child: Text("submit"))
        ],
      ),
    );
  }
}
