import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/controller/QuestionDays/view_controller.dart';
import 'package:referral_freindsapp/controller/QuestionFamly/view_controller.dart';
import 'package:referral_freindsapp/controller/QuestionNumber/view_controller.dart';
import 'package:referral_freindsapp/controller/QuestionSentences/view_controller.dart';
import 'package:referral_freindsapp/controller/Questions/view_children_controller.dart';
import 'package:referral_freindsapp/controller/Questions/view_controller.dart';
import 'package:referral_freindsapp/controller/homeScreen_controller.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/view/screen/drawerScreen.dart';
import 'package:referral_freindsapp/view/widget/Home/customhomeContainer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    // Get.put(ResultExamController());
    Get.put(QuestionSentenceController());
    Get.put(QuestionDaysController());
    Get.put(QuestionFamlyController());
    Get.put(QuestionsController());
    Get.put(ChildrenQuestionsController());
    Get.put(QuestionNumbersController());
    return GetBuilder<HomeScreenControllerImp>(
      builder:(controller)=> Scaffold(
        
        appBar: AppBar(
          
          backgroundColor: Colors.blueGrey[50],
          title: const Text("الصفحة الرئيسية",style: TextStyle(color: Appcolors.primarycolor,fontSize: 30),),),
        //////////////////////////////////////////////
        
        body:WillPopScope(
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: GridView(
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // mainAxisSpacing: 1,
                // crossAxisSpacing: 0.7,
                childAspectRatio: 0.7
              ),
              children: [
                
               InkWell(
                onTap: (){
                  Get.toNamed(RoutesApp.sentencespage);
                },
                 child: const CustomHomeContianer(
                  imagUrl: "assets/images/sentences.png", title: "جمل"),
               ),
            
                InkWell(
                  onTap: (){
                    Get.toNamed(RoutesApp.wordshomepage);
                  },
                  child: const CustomHomeContianer(
                  imagUrl: "assets/images/words.png", title: "كلمات"),
                ),
            
                 InkWell(
                  onTap: (){
                    
                   
                      Get.toNamed(RoutesApp.questionhomepage);
                    
                  },
                   child: const CustomHomeContianer(
                                   imagUrl: "assets/images/que.png", title: "اختبارات قصيرة"),
                 ),
            
                 InkWell(
                  onTap: (){
                    Get.toNamed(RoutesApp.numberandletterpage);
                  },
                   child: const CustomHomeContianer(
                                   imagUrl: "assets/images/numbers.png", title: "أرقام وحروف"),
                 ),
                
              
                
              ],),
          ),
          onWillPop: (){
            Get.defaultDialog(
              title: "Alert",
              middleText: "Do you want to Exit",
              onConfirm: (){
                exit(0);
              },
              onCancel: () {
                
              },
              buttonColor: Appcolors.primarycolor
              );
           return Future.value(false);
         }),
         drawer: const DrawerScreen(),
      ),
    );
  }
}