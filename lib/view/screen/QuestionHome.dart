
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/view/widget/Home/customhomeContainer.dart';

class QuestionHomeScreen extends StatelessWidget {
  const QuestionHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
   

    return  Scaffold(
        
        appBar: AppBar(
          
          backgroundColor: Colors.blueGrey[50],
          title: const Text("صفحة الاختبارات",style: TextStyle(color: Appcolors.primarycolor,fontSize: 30),),),
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
                    
                    
                      Get.toNamed(RoutesApp.questionsentencepage);
                    
                  },
                   child: const CustomHomeContianer(
                                   imagUrl: "assets/images/que.png", title: "جمل"),
                 ),
            
                 InkWell(
                  onTap: (){
                    
                    Get.toNamed(RoutesApp.questionlettersandnumhomepage);
                  },
                   child: const CustomHomeContianer(
                                   imagUrl: "assets/images/que.png", title: "حروف وأرقام"),
                 ),

                //  InkWell(
                //   onTap: (){
                    
                    
                //       Get.toNamed(RoutesApp.questiondayspage);
                    
                //   },
                //    child: CustomHomeContianer(
                //                    imagUrl: "assets/images/que.png", title: "أيام الاسبوع"),
                //  ),

                 InkWell(
                  onTap: (){
                    
                    
                      Get.toNamed(RoutesApp.questionwordshomepage);
                    
                  },
                   child: const CustomHomeContianer(
                                   imagUrl: "assets/images/que.png", title: "كلمات"),
                 ),
            
                
                
              
                
              ],),
          ),
         
       
      );
  }
}