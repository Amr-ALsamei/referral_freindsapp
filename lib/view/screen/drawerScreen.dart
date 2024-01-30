import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';
import 'package:referral_freindsapp/core/constant/imageAssest.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/services/services.dart';
import 'package:referral_freindsapp/view/widget/CustomDrawerContainer.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices=Get.find();
    return Drawer(
      child: Scaffold(
        appBar: AppBar(
          title: ListTile(
            title: const Text("القائمة الرئيسية"),
            trailing: IconButton(onPressed: (){
              Get.back();
            }, icon: const Icon(Icons.double_arrow)),
          ),
          backgroundColor: Appcolors.secondcolor,
          automaticallyImplyLeading: false,),
          body: Container(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                InkWell(
                  onTap: (){
                    Get.toNamed(RoutesApp.profilemainpage);
                  },
                  child: const CustomDrawerContainer(imag: AppImageAssets.acount, titl: "الملف الشخصي")),
                
                if( myServices.sharedPref.getString("usertype") !="children")
                 InkWell(
                  onTap: (){
                    Get.toNamed(RoutesApp.addchildrenpage);
                  },
                  child: const CustomDrawerContainer(imag: AppImageAssets.addchild, titl: "أضافة الطفل ")
                  ),

              if( myServices.sharedPref.getString("usertype") !="children")
                InkWell(
                  onTap: (){
                    Get.toNamed(RoutesApp.tracechildrenmainpage);
                  },
                  child: const CustomDrawerContainer(imag: AppImageAssets.trackchaild, titl: "تتبع الطفل ")),

               InkWell(
                  onTap: (){
                    
                      Get.toNamed(RoutesApp.resultmainpage);
                    
                    
                  },
                  child: const CustomDrawerContainer(imag: AppImageAssets.resultexam, titl: "نتائج الاختبارات")
                  ),  
                
                
                 if( myServices.sharedPref.getString("usertype") =="children")
                InkWell(
                  onTap: (){
                    Get.toNamed(RoutesApp.favoritechildrenpage);
                  },
                  child: const CustomDrawerContainer(imag: AppImageAssets.favorite, titl: "المفضلة")),
                 
                 InkWell(
                  onTap: (){
                    Get.offAllNamed(RoutesApp.login);
                  },
                  child: const CustomDrawerContainer(imag: AppImageAssets.logout, titl: "تسجيل الخروج")),

                
              ],
            ),
          ),
      ),
    );
  }
}