import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../admin/Admin_Mechanic.dart';

class MechanicalList extends StatefulWidget {
  const MechanicalList({super.key});

  @override
  State<MechanicalList> createState() => _MechanicalListState();
}

class _MechanicalListState extends State<MechanicalList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE7F0FF),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ).r,
            child: ListTile(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder:  (context) {
                return AdminMechanic();
              },));
            },
              tileColor: Colors.white,
              leading: Image.asset('assets/dp.png'),
              title: Text('Name'),
              subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text('Mobile Number'),
                    Text('service')
                  ]),
            ),
          );
        },
      ),
    );
  }
}
