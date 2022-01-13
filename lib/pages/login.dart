import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflitetest/database/my_database.dart';
import 'package:sqflitetest/pages/home_page.dart';
import 'package:sqflitetest/pages/register.dart';
import 'package:sqflitetest/shared/mycolors.dart';
import 'package:sqflitetest/shared/mystyles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();
  bool hidePassword = true;
  _loginUser() async {
    try {
      var data =
          await MyDatabase.instance.loginUser(emailC.text, passwordC.text);
      var datas = await MyDatabase.instance.readAllUser();
      print("data : ");
      print(data);
      print("data : ");
      print(data.runtimeType);
      await MyDatabase.instance.updateUser(data.copy(loginAt: DateTime.now().toIso8601String()));
      Get.to(()=>const HomePage());
      print(datas);
    } catch (e) {
      Get.snackbar('Error', e.toString(), backgroundColor: MyColors.primaryColor, colorText: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.secondaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40.h, right: 31.w, bottom: 20.h),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'LOGIN',
                  style: MyStyles.body1.copyWith(
                      color: MyColors.primaryColor,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Container(
              height: 229.h,
              child: Icon(
                Icons.login,
                size: 200.w,
                color: MyColors.primaryColor,
              ),
            ),
            SizedBox(
              height: 37.h,
            ),
            Container(
              height: 445.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 32.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(36.r))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email',
                    style: MyStyles.body1.copyWith(
                        fontSize: 14.sp, color: MyColors.primaryColor),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormField(
                    controller: emailC,
                    decoration: InputDecoration(
                      hintText: 'Masukan email',
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: MyColors.primaryColor,
                      ),
                      filled: true,
                      fillColor: MyColors.secondaryColor,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: MyColors.primaryColor),
                          borderRadius: BorderRadius.circular(20.r)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: MyColors.primaryColor),
                          borderRadius: BorderRadius.circular(20.r)),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Password',
                    style: MyStyles.body1.copyWith(
                        fontSize: 14.sp, color: MyColors.primaryColor),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  TextFormField(
                    controller: passwordC,
                    obscureText: hidePassword,
                    decoration: InputDecoration(
                      hintText: 'Masukan password',
                      prefixIcon: Icon(
                        Icons.lock_outlined,
                        color: MyColors.primaryColor,
                      ),
                      suffixIcon: InkWell(
                          onTap: (){
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                          child: hidePassword?Icon(Icons.visibility_off,color: MyColors.primaryColor,):Icon(Icons.visibility,color: MyColors.primaryColor,)),
                      filled: true,
                      fillColor: MyColors.secondaryColor,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: MyColors.primaryColor),
                          borderRadius: BorderRadius.circular(20.r)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: MyColors.primaryColor),
                          borderRadius: BorderRadius.circular(20.r)),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _loginUser();
                    },
                    child: Text(
                      'Masuk',
                      style: MyStyles.body1.copyWith(fontSize: 20.sp),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r)),
                        primary: MyColors.primaryColor,
                        fixedSize: Size(280.w, 58.h)),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  InkWell(
                    onTap: () => Get.to(() => const RegisterPage()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Belum punya Akun? ',
                          style: MyStyles.body1.copyWith(
                              fontSize: 18.sp, color: MyColors.primaryColor),
                        ),
                        Text(
                          ' DAFTAR',
                          style: MyStyles.body1.copyWith(
                              color: MyColors.primaryColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
