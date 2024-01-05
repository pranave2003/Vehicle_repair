import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Admin_Mechanic.dart';

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
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection('mechsighn').get(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
          final mesign = snapshot.data?.docs ?? [];
          return ListView.builder(
            // shrinkWrap: true,
            itemCount: mesign.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                ).r,
                child: ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return AdminMechanic(
                          id: mesign[index].id,

                        );
                      },
                    ));
                  },
                  tileColor: Colors.white,
                  leading: Image.asset('assets/dp.png'),
                  title: Text(mesign[index]['username']),
                  subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(mesign[index]['Phonenumber']),
                        Text(mesign[index]['shopename'])
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
