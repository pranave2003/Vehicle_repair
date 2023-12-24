import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Usermechaniclist extends StatefulWidget {
  const Usermechaniclist({super.key});

  @override
  State<Usermechaniclist> createState() => _UsermechaniclistState();
}

class _UsermechaniclistState extends State<Usermechaniclist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
      length: 2,
      child: Column(children: [
        Material(
          child: Container(height: 50.h, width: 100.w, color: Colors.blue),
        )
      ]),
    ));
  }
}
