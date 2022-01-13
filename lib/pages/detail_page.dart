import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:sqflitetest/models/user_model.dart';
import 'package:sqflitetest/shared/mycolors.dart';
import 'package:sqflitetest/shared/mystyles.dart';

class Detailpage extends StatelessWidget {
  final UserModel userModel;

  const Detailpage({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.secondaryColor,
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: const Text('Detail page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20.r)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(
                  thickness: 4.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Nama',
                        style: MyStyles.body1.copyWith(
                            fontSize: 20.sp, fontWeight: FontWeight.w700),
                      )),
                      Text(
                        ' :  ',
                        style: MyStyles.body1.copyWith(
                            fontSize: 20.sp, fontWeight: FontWeight.w700),
                      ),
                      Expanded(
                          child: Text(
                        userModel.name,
                        style: MyStyles.body1.copyWith(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: MyColors.primaryColor),
                      )),
                    ],
                  ),
                ),
                Divider(
                  thickness: 4.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Email',
                        style: MyStyles.body1.copyWith(
                            fontSize: 20.sp, fontWeight: FontWeight.w700),
                      )),
                      Text(
                        ' :  ',
                        style: MyStyles.body1.copyWith(
                            fontSize: 20.sp, fontWeight: FontWeight.w700),
                      ),
                      Expanded(
                          child: Text(
                        userModel.email,
                        style: MyStyles.body1.copyWith(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: MyColors.primaryColor),
                      )),
                    ],
                  ),
                ),
                Divider(
                  thickness: 4.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        'No Hp',
                        style: MyStyles.body1.copyWith(
                            fontSize: 20.sp, fontWeight: FontWeight.w700),
                      )),
                      Text(
                        ' :  ',
                        style: MyStyles.body1.copyWith(
                            fontSize: 20.sp, fontWeight: FontWeight.w700),
                      ),
                      Expanded(
                          child: Text(
                        userModel.phone!,
                        style: MyStyles.body1.copyWith(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: MyColors.primaryColor),
                      )),
                    ],
                  ),
                ),
                Divider(
                  thickness: 4.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Kota',
                        style: MyStyles.body1.copyWith(
                            fontSize: 20.sp, fontWeight: FontWeight.w700),
                      )),
                      Text(
                        ' :  ',
                        style: MyStyles.body1.copyWith(
                            fontSize: 20.sp, fontWeight: FontWeight.w700),
                      ),
                      Expanded(
                          child: Text(
                        userModel.city!,
                        style: MyStyles.body1.copyWith(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: MyColors.primaryColor),
                      )),
                    ],
                  ),
                ),
                Divider(
                  thickness: 4.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Login',
                        style: MyStyles.body1.copyWith(
                            fontSize: 20.sp, fontWeight: FontWeight.w700),
                      )),
                      Text(
                        ' :  ',
                        style: MyStyles.body1.copyWith(
                            fontSize: 20.sp, fontWeight: FontWeight.w700),
                      ),
                      Expanded(
                          child: Text(
                        userModel.loginAt == '-'
                            ? 'Never'
                            : DateFormat('dd MMMM yyyy HH:mm')
                                .format(DateTime.parse(userModel.loginAt!))
                                .toString(),
                        style: MyStyles.body1.copyWith(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: MyColors.primaryColor),
                      )),
                    ],
                  ),
                ),
                Divider(
                  thickness: 4.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
