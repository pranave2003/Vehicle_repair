import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vehicle_project/user/User_login.dart';
import 'Test.dart';
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: Mechlogin()),
      designSize: Size(390, 844),
    );
  }
}
