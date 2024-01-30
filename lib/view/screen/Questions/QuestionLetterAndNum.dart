
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/services/services.dart';
import 'package:referral_freindsapp/view/widget/Home/customhomeContainer.dart';

class QuestionLettersAndNumHomeScreen extends StatelessWidget {
  const QuestionLettersAndNumHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
 MyServices myServices=Get.find();
    return  Scaffold(
        
        appBar: AppBar(
          
          backgroundColor: Colors.blueGrey[50],
          title: const Text("صفحة اختبار الحروف والارقام",style: TextStyle(color: Appcolors.primarycolor,fontSize: 30),),),
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
                    
                    if(myServices.sharedPref.getString("usertype")=="children"){
                         Get.offNamed(RoutesApp.childrenquestionspage);
                    }else{
                      Get.offNamed(RoutesApp.questionspage);
                    }
                  },
                   child: const CustomHomeContianer(
                                   imagUrl: "assets/images/que.png", title: "حروف"),
                 ),

                 InkWell(
                  onTap: (){
                    
                    
                      Get.offNamed(RoutesApp.questionnumberpage);
                    
                  },
                   child: const CustomHomeContianer(
                                   imagUrl: "assets/images/que.png", title: "أرقام"),
                 ),
            
                
                
              
                
              ],),
          ),
         
       
      );
  }
}