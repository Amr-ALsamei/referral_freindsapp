
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/view/widget/Home/customhomeContainer.dart';

class NumbersAndLettersHomeScreen extends StatelessWidget {
  const NumbersAndLettersHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        appBar: AppBar(
          
          backgroundColor: Colors.blueGrey[50],
          title: const Text("صفحة الحروف والارقام",style: TextStyle(color: Appcolors.primarycolor,fontSize: 30),),),
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
                    Get.toNamed(RoutesApp.numberspage);
                  },
                   child: const CustomHomeContianer(
                                   imagUrl: "assets/images/numbers.png", title: "أرقام"),
                 ),
                 InkWell(
                  onTap: (){
                    Get.toNamed(RoutesApp.letterspage);
                  },
                   child: const CustomHomeContianer(
                                   imagUrl: "assets/images/numbers.png", title: "حروف"),
                 ),
                
              
                
              ],),
          ),
         
         
      
    );
  }
}