import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vehicle_project/splash.dart';
import 'package:vehicle_project/user%20and%20mechanic%20list.dart';
import 'package:vehicle_project/user%20or%20mech.dart';
import 'package:vehicle_project/user/Mechanic_faild_page.dart';
import 'package:vehicle_project/user/Requests.dart';
import 'package:vehicle_project/user/User_Payment_Page.dart';
import 'package:vehicle_project/user/User_login.dart';
import 'package:vehicle_project/user/User_mech_bill_%20page.dart';
import 'package:vehicle_project/user/User_profile.dart';
import 'package:vehicle_project/user/User_rating.dart';
import 'package:vehicle_project/user/user%20sighnup.dart';
import 'package:vehicle_project/user/user_mechanic_detail%20page.dart';
import 'package:vehicle_project/user/user_mechanic_list.dart';

import 'kmo/View student.dart';
import 'kmo/add teacher.dart';
import 'admin/Admin_Mechanic.dart';
import 'admin/Admin_Notification.dart';
import 'admin/Admin_Payment.dart';
import 'admin/Admin_User.dart';
import 'admin/Admin_home_User.dart';
import 'admin/Admin_login.dart';
import 'firebase_options.dart';
import 'mech/Accept List.dart';
import 'mech/Mech_Edit_profile.dart';
import 'mech/Mech_Status complted.dart';
import 'mech/Mech_notification.dart';
import 'mech/Mech_profile.dart';
import 'mech/Mech_rating.dart';
import 'mech/Mech_service.dart';
import 'mech/Mech_service_accept or reject.dart';
import 'mech/Mech_service_home.dart';
import 'mech/Mech_status_reject.dart';
import 'mech/Request List.dart';
import 'mech/mech Request.dart';
import 'mech/mech login.dart';
import 'mech/mech_signup.dart';

void main()async { WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) =>
       MaterialApp(debugShowCheckedModeBanner:  false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: Addteacher()),
      designSize: Size(390, 844),
    );
  }
}
