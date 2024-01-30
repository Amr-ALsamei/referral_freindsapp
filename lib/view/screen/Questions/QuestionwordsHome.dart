
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/view/widget/Home/customhomeContainer.dart';

class QuestionWordsHomeScreen extends StatelessWidget {
  const QuestionWordsHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
   

    return  Scaffold(
        
        appBar: AppBar(
          
          backgroundColor: Colors.blueGrey[50],
          title: const Text("صفحة اختبار الكلمات",style: TextStyle(color: Appcolors.primarycolor,fontSize: 30),),),
        //////////////////////////////////////////////
        
        body: Padding(
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
                    
                    
                      Get.offNamed(RoutesApp.questiondayspage);
                    
                  },
                   child: const CustomHomeContianer(
                                   imagUrl: "assets/images/que.png", title: "أيام الاسبوع"),
                 ),

                 InkWell(
                  onTap: (){
                    
                    
                      Get.offNamed(RoutesApp.questionfamlypage);
                    
                  },
                   child: const CustomHomeContianer(
                                   imagUrl: "assets/images/que.png", title: "الاسرة"),
                 ),
            
                
                
              
                
              ],),
          ),
         
       
      );
  }
}