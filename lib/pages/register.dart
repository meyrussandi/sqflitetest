import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflitetest/database/my_database.dart';
import 'package:sqflitetest/models/user_model.dart';
import 'package:sqflitetest/shared/mycolors.dart';
import 'package:sqflitetest/shared/mystyles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final TextEditingController nameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();
  final TextEditingController phoneC = TextEditingController();
  final TextEditingController cityC = TextEditingController();
  bool hidePassword = true;

  _validateForm(){
    if(nameC.text.isEmpty){
      Get.snackbar('Error', 'nama tidak boleh kosong', backgroundColor: MyColors.primaryColor, colorText: Colors.white);
    }else if(emailC.text.isEmpty){
      Get.snackbar('Error', 'email tidak boleh kosong', backgroundColor: MyColors.primaryColor, colorText: Colors.white);
    }else if(passwordC.text.isEmpty){
      Get.snackbar('Error', 'password tidak boleh kosong', backgroundColor: MyColors.primaryColor, colorText: Colors.white);
    }else if(phoneC.text.isEmpty){
      Get.snackbar('Error', 'no hp tidak boleh kosong', backgroundColor: MyColors.primaryColor, colorText: Colors.white);
    }else if(cityC.text.isEmpty){
      Get.snackbar('Error', 'kota tidak boleh kosong', backgroundColor: MyColors.primaryColor, colorText: Colors.white);
    }else{
      _registerUser();
    }
  }

  _registerUser()async{
    await MyDatabase.instance.createUser(UserModel(name: nameC.text, email: emailC.text, password: passwordC.text, city: cityC.text, phone: phoneC.text));
    var list = await MyDatabase.instance.readAllUser();

    print('list user');
    print(list);
    Get.back();
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
              padding: EdgeInsets.only(top: 40.h, right: 31.w, bottom: 10.h, left: 31.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: ()=>Get.back(), icon: Icon(Icons.arrow_back_ios, color: MyColors.primaryColor,)),
                  Text('REGISTER', style: MyStyles.body1.copyWith(color: MyColors.primaryColor,fontSize: 24.sp, fontWeight: FontWeight.w700),),
                ],
              ),
            ),
            Container(

              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 20.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(36.r))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nama', style: MyStyles.body1.copyWith(fontSize: 14.sp,color: MyColors.primaryColor),),
                  SizedBox(height: 10.h,),
                  TextFormField(
                    controller: nameC,
                    decoration: InputDecoration(
                      hintText: 'Masukan Nama',
                      prefixIcon: Icon(Icons.person, color: MyColors.primaryColor,),
                      filled: true,
                      fillColor: MyColors.secondaryColor,
                      border: OutlineInputBorder(borderSide: BorderSide(color: MyColors.primaryColor), borderRadius: BorderRadius.circular(20.r)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: MyColors.primaryColor), borderRadius: BorderRadius.circular(20.r)),
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Text('Email', style: MyStyles.body1.copyWith(fontSize: 14.sp,color: MyColors.primaryColor),),
                  SizedBox(height: 10.h,),
                  TextFormField(
                    controller: emailC,
                    decoration: InputDecoration(
                      hintText: 'Masukan email',
                      prefixIcon: Icon(Icons.email_outlined, color: MyColors.primaryColor,),
                      filled: true,
                      fillColor: MyColors.secondaryColor,
                      border: OutlineInputBorder(borderSide: BorderSide(color: MyColors.primaryColor), borderRadius: BorderRadius.circular(20.r)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: MyColors.primaryColor), borderRadius: BorderRadius.circular(20.r)),
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Text('Password', style: MyStyles.body1.copyWith(fontSize: 14.sp,color: MyColors.primaryColor),),
                  SizedBox(height: 10.h,),
                  TextFormField(
                    controller: passwordC,
                    obscureText: hidePassword,
                    decoration: InputDecoration(
                      hintText: 'Masukan password',
                      prefixIcon: Icon(Icons.lock_outlined, color: MyColors.primaryColor,),
                      suffixIcon: InkWell(
                          onTap: (){
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                          child: hidePassword?Icon(Icons.visibility_off,color: MyColors.primaryColor,):Icon(Icons.visibility,color: MyColors.primaryColor,)),
                      filled: true,
                      fillColor: MyColors.secondaryColor,
                      border: OutlineInputBorder(borderSide: BorderSide(color: MyColors.primaryColor), borderRadius: BorderRadius.circular(20.r)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: MyColors.primaryColor), borderRadius: BorderRadius.circular(20.r)),
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Text('No Handphone', style: MyStyles.body1.copyWith(fontSize: 14.sp,color: MyColors.primaryColor),),
                  SizedBox(height: 10.h,),
                  TextFormField(
                    controller: phoneC,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'Masukan No Handphone',
                      prefixIcon: Icon(Icons.phone_android, color: MyColors.primaryColor,),
                      filled: true,
                      fillColor: MyColors.secondaryColor,
                      border: OutlineInputBorder(borderSide: BorderSide(color: MyColors.primaryColor), borderRadius: BorderRadius.circular(20.r)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: MyColors.primaryColor), borderRadius: BorderRadius.circular(20.r)),
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Text('Kota', style: MyStyles.body1.copyWith(fontSize: 14.sp,color: MyColors.primaryColor),),
                  SizedBox(height: 10.h,),
                  TextFormField(
                    controller: cityC,
                    decoration: InputDecoration(
                      hintText: 'Masukan Kota anda',
                      prefixIcon: Icon(Icons.phone_android, color: MyColors.primaryColor,),
                      filled: true,
                      fillColor: MyColors.secondaryColor,
                      border: OutlineInputBorder(borderSide: BorderSide(color: MyColors.primaryColor), borderRadius: BorderRadius.circular(20.r)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: MyColors.primaryColor), borderRadius: BorderRadius.circular(20.r)),
                    ),
                  ),
                  SizedBox(height: 40.h,),
                  ElevatedButton(onPressed: (){
                    _validateForm();
                  }, child: Text('Daftar', style: MyStyles.body1.copyWith(fontSize: 20.sp),),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
                    primary: MyColors.primaryColor,
                    fixedSize: Size(280.w, 58.h)
                  ),
                  ),
                  SizedBox(height: 10.h,),
                  InkWell(
                    onTap: ()=>Get.back(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Sudah punya Akun? ', style: MyStyles.body1.copyWith(fontSize: 18.sp, color: MyColors.primaryColor),),
                        Text(' MASUK', style: MyStyles.body1.copyWith(color: MyColors.primaryColor,fontSize: 18.sp,fontWeight: FontWeight.w700),),
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
