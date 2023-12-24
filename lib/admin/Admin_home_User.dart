import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Admin_Notification.dart';
import 'Admin_Payment.dart';
import 'Home.dart';
import '../mech/Mechanical_list.dart';
import 'User_list.dart';

class AdminHomeuser extends StatefulWidget {
  const AdminHomeuser({super.key});

  @override
  State<AdminHomeuser> createState() => _AdminHomeuserState();
}

class _AdminHomeuserState extends State<AdminHomeuser> {
  int indexNum = 0;
  List page=[HOME(),AdminPayment(),AdminNotification()];

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(length: 2,initialIndex: 0,
      child: Scaffold(
        backgroundColor: Color(0xffE8F1FF),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexNum,
          selectedIconTheme: IconThemeData(color: Colors.blue),
          onTap: (int Index) {
            setState(() {
              indexNum = Index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'payment'),
            BottomNavigationBarItem(
                icon: Icon(Icons.message), label: 'Notification'),
          ],
        ),
        body: page[indexNum],
      ),
    );
  }
}
