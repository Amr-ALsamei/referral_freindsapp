import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';
import 'package:referral_freindsapp/core/constant/imageAssest.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/services/services.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices=Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.secondcolor,
        title: const Text("الملف الشخصي",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(children: [
               Container(child: Column(
                children: [
                  const Icon(Icons.account_circle,size: 100,color: Appcolors.secondcolor,),
                  Text(myServices.sharedPref.getString("username")!), 
                  Text(myServices.sharedPref.getString("email")!),

                 Container(
                   margin: const EdgeInsets.only(top: 15),
                  padding: const EdgeInsets.only(right: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[100]
                  ),
                  child: const Text("الاعدادات العامة",
                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Appcolors.primarycolor)),
                ),

                Column(children: [
                  ListTile(
                    leading: IconButton(onPressed: (){
                      Get.toNamed(RoutesApp.editnamepage);
                    },
                     icon: const Icon(Icons.edit_square,size: 30,color: Appcolors.secondcolor,)),
                    title: const Text("تعديل الاسم"),
                  ),
                if(myServices.sharedPref.getString("admin") =="1")
                   ListTile(
                    leading: IconButton(onPressed: (){
                      Get.toNamed(RoutesApp.manageuserpage);
                    },
                     icon: const Icon(Icons.vpn_key_outlined,size: 30,color: Appcolors.secondcolor,)),
                    title: const Text("ادارة المستخدمين"),
                  ),

                   ListTile(
                    leading: IconButton(onPressed: (){
                      Get.toNamed(RoutesApp.notificationpage);
                    },
                     icon: const Icon(Icons.notifications_active,size: 30,color: Appcolors.secondcolor,)),
                    title: const Text("الاشعارات"),
                  ),

                 if( myServices.sharedPref.getString("usertype") !="children")
                   ListTile(
                    leading:InkWell(
                      onTap:
                       (){
                        Get.toNamed(RoutesApp.addchildrenpage);
                      },
                      child: Image.asset(AppImageAssets.addchild,width: 40,height: 40,)), 
                      title: Text("هل تريد اضافة طفلك؟"),
                  )
                ],),
               Container(
                  padding: const EdgeInsets.only(right: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[100]
                  ),
                  child: const Text("معلومات",
                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Appcolors.primarycolor)),
                ),
                ListTile(
                    leading: IconButton(onPressed: (){
                      Get.toNamed(RoutesApp.aboutapplicationpage);
                    },
                     icon: const Icon(Icons.app_blocking_sharp,size: 30,color: Appcolors.secondcolor,)),
                    title: const Text("عن التطبيق"),
                  ),
                // ListTile(
                //     leading: IconButton(onPressed: (){},
                //      icon: const Icon(Icons.share_outlined,size: 30,color: Appcolors.secondcolor,)),
                //     title: const Text("مشاركة التطبيق"),
                //   ),
                ],
               ),)

        ],),
      ),
    );
  }
}