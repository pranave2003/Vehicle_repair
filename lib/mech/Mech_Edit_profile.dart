// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'Mech_profile.dart';
//
// class MechEditProfile extends StatefulWidget {
//   const MechEditProfile({super.key});
//
//   @override
//   State<MechEditProfile> createState() => _MechEditProfileState();
// }
//
// class _MechEditProfileState extends State<MechEditProfile> {
//   Future<void> update() async {
//     await FirebaseFirestore.instance.collection('mechsighn').doc(ID).update({});
//   }
//
//   void initState() {
//     getData();
//   }
//
//   Future<void> getData() async {
//     SharedPreferences spref = await SharedPreferences.getInstance();
//     setState(() {
//       nm = spref.getString("name");
//       ph = spref.getString('phone');
//       em = spref.getString("email");
//       ID = spref.getString("id");
//       //
//       ex = spref.getString('exp');
//       sn = spref.getString("spname");
//       lc = spref.getString('loc');
//       pth = spref.getString('paath');
//
//       spref.getString(
//         "id",
//       );
//       spref.setString("name", nm);
//       spref.setString("phone", ph);
//       spref.setString("email", em);
//       spref.setString('exp', ex);
//       spref.setString('spname', sn);
//       spref.setString('loc', lc);
//       spref.setString('paath', pth);
//
//       print(nm.toString());
//     });
//     print("Updated");
//   }
//
//   var nm;
//   var ph;
//   var em;
//   var ID;
//   var ex;
//   var sn;
//   var lc;
//   var pth;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Column(children: [
//             Center(
//               child: Container(
//                 width: 350.w,
//                 height: 830.h,
//                 color: Colors.white,
//                 child: ListView(children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         IconButton(
//                             onPressed: () {
//                               Navigator.of(context).pop();
//                             },
//                             icon: Icon(Icons.arrow_back_ios)),
//                         IconButton(
//                             onPressed: () {
//                               Navigator.push(context, MaterialPageRoute(
//                                 builder: (context) {
//                                   return MechProfile();
//                                 },
//                               ));
//                             },
//                             icon: Icon(Icons.edit))
//                       ],
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Column(
//                         children: [
//                           Container(
//                             height: 120.h,
//                             width: 120.w,
//                             decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     image: NetworkImage(pth), fit: BoxFit.fill),
//                                 borderRadius: BorderRadius.circular(130),
//                                 color: Colors.grey),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                   //
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           width: 310.w,
//                           height: 50.h,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(nm,
//                                 style: TextStyle(fontWeight: FontWeight.w700)),
//                           ),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10.sp),
//                               color: Color(0xffE8F1FF)),
//                         )
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           width: 310.w,
//                           height: 50.h,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(nm,
//                                 style: TextStyle(fontWeight: FontWeight.w700)),
//                           ),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10.sp),
//                               color: Color(0xffE8F1FF)),
//                         )
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           width: 310.w,
//                           height: 50.h,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(ph,
//                                 style: TextStyle(fontWeight: FontWeight.w700)),
//                           ),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10.sp),
//                               color: Color(0xffE8F1FF)),
//                         )
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           width: 310.w,
//                           height: 50.h,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(em,
//                                 // email
//                                 style: TextStyle(fontWeight: FontWeight.w700)),
//                           ),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10.sp),
//                               color: Color(0xffE8F1FF)),
//                         )
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           width: 310.w,
//                           height: 50.h,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(ex,
//                                 // experience
//                                 style: TextStyle(fontWeight: FontWeight.w700)),
//                           ),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10.sp),
//                               color: Color(0xffE8F1FF)),
//                         )
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           width: 310.w,
//                           height: 50.h,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(lc,
//                                 // location
//                                 style: TextStyle(fontWeight: FontWeight.w700)),
//                           ),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10.sp),
//                               color: Color(0xffE8F1FF)),
//                         )
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           width: 310.w,
//                           height: 50.h,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text(sn,
//                                 // shopename
//                                 style: TextStyle(fontWeight: FontWeight.w700)),
//                           ),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10.sp),
//                               color: Color(0xffE8F1FF)),
//                         )
//                       ],
//                     ),
//                   ),
//
//                   //
//
//                   //button
//                   Padding(
//                     padding: EdgeInsets.only(top: 20.h, bottom: 100.h),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Container(
//                           width: 150.w,
//                           height: 40.h,
//                           decoration: BoxDecoration(
//                               color: Color(0xff2357D9),
//                               borderRadius: BorderRadius.circular(5.sp)),
//                           child: TextButton(
//                               onPressed: () {},
//                               child: Text(
//                                 "Done",
//                                 style: TextStyle(color: Colors.white),
//                               )),
//                         ),
//                         // second
//                       ],
//                     ),
//                   )
//                 ]),
//               ),
//             )
//           ]),
//         ),
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Mech_profile.dart';

class MechEditProfile extends StatefulWidget {
  const MechEditProfile({super.key});

  @override
  State<MechEditProfile> createState() => _MechEditProfileState();
}

class _MechEditProfileState extends State<MechEditProfile> {
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      ID = spref.getString("id");

      print(ID.toString());
    });
    print("Updated");
  }

  GEtDtata() async {
    mech =
        await FirebaseFirestore.instance.collection('mechsighn').doc(ID).get();
  }

  DocumentSnapshot? mech;
  var ID;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GEtDtata(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text("Error${snapshot.error}");
        }
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(children: [
                Center(
                  child: Container(
                    width: 350.w,
                    height: 830.h,
                    color: Colors.white,
                    child: ListView(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(Icons.arrow_back_ios)),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return MechProfile();
                                    },
                                  ));
                                },
                                icon: Icon(Icons.edit))
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 120.h,
                                width: 120.w,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            mech!['MechProfilrpath']),
                                        fit: BoxFit.fill),
                                    borderRadius: BorderRadius.circular(130),
                                    color: Colors.grey),
                              ),
                            ],
                          )
                        ],
                      ),
                      //

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 310.w,
                              height: 50.h,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(mech!['username'],
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700)),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  color: Color(0xffE8F1FF)),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 310.w,
                              height: 50.h,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(mech!['email'],
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700)),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  color: Color(0xffE8F1FF)),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 310.w,
                              height: 50.h,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(mech!['experience'],
                                    // email
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700)),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  color: Color(0xffE8F1FF)),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 310.w,
                              height: 50.h,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(mech!['shopename'],
                                    // experience
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700)),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  color: Color(0xffE8F1FF)),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 310.w,
                              height: 50.h,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(mech!['Location'],
                                    // location
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700)),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  color: Color(0xffE8F1FF)),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 310.w,
                              height: 50.h,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(mech!['Phonenumber'],
                                    // shopename
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700)),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  color: Color(0xffE8F1FF)),
                            )
                          ],
                        ),
                      ),

                      //

                      //button
                      Padding(
                        padding: EdgeInsets.only(top: 20.h, bottom: 100.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 150.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                  color: Color(0xff2357D9),
                                  borderRadius: BorderRadius.circular(5.sp)),
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Done",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                            // second
                          ],
                        ),
                      )
                    ]),
                  ),
                )
              ]),
            ),
          ),
        );
      },
    );
  }
}
