import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflitetest/database/my_database.dart';
import 'package:sqflitetest/pages/login.dart';
import 'package:path/path.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () {
        return const GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Test',
          home: LoginPage(),
        );
      }
    );
  }
}

