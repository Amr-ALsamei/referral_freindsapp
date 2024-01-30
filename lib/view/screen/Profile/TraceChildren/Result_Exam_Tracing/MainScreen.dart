import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';
import 'package:referral_freindsapp/core/constant/imageAssest.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/services/services.dart';

class ResultExamMainTracing extends StatelessWidget {
  const ResultExamMainTracing({super.key});

  @override
  Widget build(BuildContext context) {
   MyServices myServices=Get.find();
    return Scaffold(
      appBar: AppBar(title: const Text("نتائج الاختبارات")),
      body: Container(
      padding: const EdgeInsets.all(10),
      child: ListView(children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Column(children: [
                const Text("نتائج اختبارات الحروف"),
                MaterialButton(
                  color: Appcolors.primarycolor,
                  onPressed: (){
                    
                      Get.offNamed(RoutesApp.resultexamlettertracingpage
                      ,arguments: {"ChildId":myServices.sharedPref.getString("childid")});
                      },
                    
                child: const Text("فتح",style: TextStyle(fontSize: 20),),)
              ],),
              Image.asset(AppImageAssets.resultexam,width: 100,height: 100,fit: BoxFit.cover,)
            ],),
          ),
        ),
      
      
      Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Column(children: [
                const Text("نتائج اختبارات الارقام"),
                MaterialButton(
                  color: Appcolors.primarycolor,
                  onPressed: (){
                    Get.offNamed(RoutesApp.resultexamnumbertacingpage,
                                arguments: {"ChildId":myServices.sharedPref.getString("childid")});
                    
                },
                child: const Text("فتح",style: TextStyle(fontSize: 20),),)
              ],),
              Image.asset(AppImageAssets.resultexam,width: 100,height: 100,fit: BoxFit.cover,)
            ],),
          ),
        ),
      
      Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Column(children: [
                const Text("نتائج اختبارات الجمل"),
                MaterialButton(
                  color: Appcolors.primarycolor,
                  onPressed: (){
                    Get.offNamed(RoutesApp.resultexamsentencestracingpage,
                     arguments: {"ChildId":myServices.sharedPref.getString("childid")});
                    
                },
                child: const Text("فتح",style: TextStyle(fontSize: 20),),)
              ],),
              Image.asset(AppImageAssets.resultexam,width: 100,height: 100,fit: BoxFit.cover,)
            ],),
          ),
        ),
      
      Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Column(children: [
                const Text("نتائج اختبارات الايام"),
                MaterialButton(
                  color: Appcolors.primarycolor,
                  onPressed: (){
                    Get.offNamed(RoutesApp.resultexamdaystracingpage,
                     arguments: {"ChildId":myServices.sharedPref.getString("childid")});
                    
                },
                child: const Text("فتح",style: TextStyle(fontSize: 20),),)
              ],),
              Image.asset(AppImageAssets.resultexam,width: 100,height: 100,fit: BoxFit.cover,)
            ],),
          ),
        ),
      
      Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Column(children: [
                const Text("نتائج اختبارات الاسرة"),
                MaterialButton(
                  color: Appcolors.primarycolor,
                  onPressed: (){
                    Get.offNamed(RoutesApp.resultexamfamlytracingpage,
                     arguments: {"ChildId":myServices.sharedPref.getString("childid")});
                    
                },
                child: const Text("فتح",style: TextStyle(fontSize: 20),),)
              ],),
              Image.asset(AppImageAssets.resultexam,width: 100,height: 100,fit: BoxFit.cover,)
            ],),
          ),
        ),
      ],),
    ),
    );
  }
}