import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Accept List.dart';
import 'Mech_Edit_profile.dart';
import 'Mech_notification.dart';
import 'Request List.dart';

class Request extends StatefulWidget {
  const Request({super.key});

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
  var nm;
  var ph;
  var em;
  var ID;
  var ex;
  var sn;
  var lc;
  var pth;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2,
      child: Scaffold(
        body: Column(children: [
          SafeArea(
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return MechEditProfile();
                    },));
                  },
                    child: CircleAvatar(
                        backgroundImage: NetworkImage(pth),radius: 30),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: InkWell(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return MechNotification();
                    },));
                  },
                    child: CircleAvatar(
                        backgroundImage: AssetImage("assets/notification 1.png")),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10,top: 20).r,
            child: Container(
              height: 50.h,
              // width: 330.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.white),
              child: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Color(0xffCFE2FF),
                ),
                tabs: [
                  Tab(
                      child: Text(
                        'Requests',
                        style: TextStyle(
                          // color: Colors.white,
                          fontSize: 16.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0.h,
                        ),
                      )),
                  Tab(
                      child: Text(
                        'Accepted',
                        style: TextStyle(
                          // color: Colors.black,
                          fontSize: 16.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0.h,
                        ),
                      ))
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(children: [
              RequestList(),
              AcceptList()

            ]),
          )
        ]),
      ),
    );
  }
  void initState() {
    getData();
  }
  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      nm = spref.getString("name");
      ph = spref.getString('phone');
      em = spref.getString("email");
      ID = spref.getString("id");
      //
      ex=spref.getString('exp');
      sn=spref.getString("spname");
      lc=spref.getString('loc');
      pth=spref.getString('paath');

      spref.getString(
        "id",
      );
      spref.setString("name", nm);
      spref.setString("phone", ph);
      spref.setString("email", em);
      spref.setString('exp', ex);
      spref.setString('spname', sn);
      spref.setString('loc', lc);
      spref.setString('paath', pth);

      print(nm.toString());
    });
    print("Updated");
  }
}
