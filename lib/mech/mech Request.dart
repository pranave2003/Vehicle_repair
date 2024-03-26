// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'Accept List.dart';
// import 'Mech_Edit_profile.dart';
// import 'Mech_notification.dart';
// import 'Request List.dart';
//
// class Request extends StatefulWidget {
//   const Request({super.key});
//
//   @override
//   State<Request> createState() => _RequestState();
// }
//
// class _RequestState extends State<Request> {
//   var ID;
//   var pth;
//   var email;
//   var name;
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color(0xffCFE2FF),
//           actions: [
//             IconButton(
//                 onPressed: () {
//                   Navigator.push(context, MaterialPageRoute(
//                     builder: (context) {
//                       return MechNotification();
//                     },
//                   ));
//                 },
//                 icon: Icon(Icons.notification_add))
//           ],
//           title: Row(
//             children: [
//               CircleAvatar(backgroundImage: NetworkImage(pth)),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(name, style: TextStyle(fontSize: 25)),
//               ),
//             ],
//           ),
//         ),
//         drawer: Drawer(
//           child: ListView(children: [
//             UserAccountsDrawerHeader(
//               accountName: Text(name),
//               accountEmail: Text(email),
//               currentAccountPicture: InkWell(
//                   onTap: () {
//                     Navigator.push(context, MaterialPageRoute(
//                       builder: (context) {
//                         return MechEditProfile();
//                       },
//                     ));
//                   },
//                   child: CircleAvatar(backgroundImage: NetworkImage(pth))),
//             ),
//             ListTile(
//               leading: Icon(Icons.person),
//               title: Text("profile", style: TextStyle(fontSize: 20)),
//             ),
//             ListTile(
//               title: Text("Logout", style: TextStyle(fontSize: 20)),
//               leading: Icon(Icons.exit_to_app),
//             )
//           ]),
//           backgroundColor: Color(0xffCFE2FF),
//         ),
//         body: Column(children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 10, right: 10, top: 20).r,
//             child: Container(
//               height: 50.h,
//               // width: 330.w,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10.r),
//                   color: Color(0xffE8F1FF)),
//               child: TabBar(
//                 labelColor: Colors.white,
//                 unselectedLabelColor: Colors.black,
//                 indicatorSize: TabBarIndicatorSize.tab,
//                 indicator: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10.r),
//                   color: Color(0xffCFE2FF),
//                 ),
//                 tabs: [
//                   Tab(
//                       child: Text(
//                     'Requests',
//                     style: TextStyle(
//                       // color: Colors.white,
//                       fontSize: 16.sp,
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w500,
//                       height: 0.h,
//                     ),
//                   )),
//                   Tab(
//                       child: Text(
//                     'Accepted',
//                     style: TextStyle(
//                       // color: Colors.black,
//                       fontSize: 16.sp,
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w500,
//                       height: 0.h,
//                     ),
//                   ))
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: TabBarView(children: [RequestList(), AcceptList()]),
//           )
//         ]),
//       ),
//     );
//   }
//
//   void initState() {
//     getData();
//   }
//
//   Future<void> getData() async {
//     SharedPreferences spref = await SharedPreferences.getInstance();
//     setState(() {
//       ID = spref.getString("id");
//       email = spref.getString("email");
//       name = spref.getString("name");
//       //
//
//       pth = spref.getString('paath');
//
//       spref.setString("id", ID);
//       spref.setString("email", email);
//       spref.setString("name", name);
//
//       spref.setString('paath', pth);
//     });
//     print("Updated");
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Accept List.dart';
import 'Mech_Edit_profile.dart';
import 'Mech_notification.dart';
import 'Request List.dart';

class Request extends StatefulWidget {
  const Request({Key? key}) : super(key: key);

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
  var ID;
  var pth;
  var email;
  var name;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffCFE2FF),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return MechNotification();
                    },
                  ));
                },
                icon: Icon(Icons.notification_add))
          ],
          title: Row(
            children: [
              CircleAvatar(backgroundImage: NetworkImage(pth ?? '')),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(name ?? '', style: TextStyle(fontSize: 25)),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(children: [
            UserAccountsDrawerHeader(
              accountName: Text(name ?? ''),
              accountEmail: Text(email ?? ''),
              currentAccountPicture: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return MechEditProfile();
                      },
                    ));
                  },
                  child:
                      CircleAvatar(backgroundImage: NetworkImage(pth ?? ''))),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("profile", style: TextStyle(fontSize: 20)),
            ),
            ListTile(
              title: Text("Logout", style: TextStyle(fontSize: 20)),
              leading: Icon(Icons.exit_to_app),
            )
          ]),
          backgroundColor: Color(0xffCFE2FF),
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, top: 20).r,
                  child: Container(
                    height: 50.h,
                    // width: 330.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Color(0xffE8F1FF)),
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
                  child: TabBarView(children: [RequestList(), AcceptList()]),
                )
              ]),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      ID = spref.getString("id");
      email = spref.getString("email");
      name = spref.getString("name");
      pth = spref.getString('paath');

      spref.setString("id", ID ?? '');
      spref.setString("email", email ?? '');
      spref.setString("name", name ?? '');
      spref.setString('paath', pth ?? '');

      isLoading = false;
    });
    print("Updated");
  }
}
