import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sqflitetest/database/my_database.dart';
import 'package:sqflitetest/models/user_model.dart';
import 'package:sqflitetest/pages/detail_page.dart';
import 'package:sqflitetest/shared/mycolors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.secondaryColor,
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: const Text('Home page'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.w),
        child: FutureBuilder<List<UserModel>>(
          future: MyDatabase.instance.readAllUser(),
          builder: (ctx, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(color: MyColors.primaryColor,),
              );
            }

            if(!snapshot.hasData){
              return const Center(
                child: Text('No Data')
              );
            }

            return ListView.separated(itemBuilder: (ctx, index){
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r)
                ),
                child: ListTile(
                  onTap: ()=>Get.to(()=>Detailpage(userModel: snapshot.data![index])),
                  title: Text(snapshot.data![index].name),
                subtitle: Text(snapshot.data![index].email),
                  trailing: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text('Last Login'),
                      Text(snapshot.data![index].loginAt == '-' ? 'Never' : DateFormat('dd MMMM yyyy HH:mm').format(DateTime.parse(snapshot.data![index].loginAt!)).toString()),
                    ],
                  ),
                ),
              );

            }, separatorBuilder: (ctx, index)=>const Divider(), itemCount: snapshot.data!.length);
          },
        ),
      ),
    );
  }
}
