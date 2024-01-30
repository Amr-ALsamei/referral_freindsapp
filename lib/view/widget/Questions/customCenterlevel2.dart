import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/controller/Questions/view_children_controller.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/services/services.dart';

class CustomCenterLevel2 extends GetView<ChildrenQuestionsController> {
  final String txt1;
  final String txt2;
  final void Function() onPressed;
  final void Function() onPressed2;
  const CustomCenterLevel2({super.key, required this.txt1, required this.onPressed, required this.txt2, required this.onPressed2});

  @override
  Widget build(BuildContext context) {
    MyServices myServices=Get.find();
    return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(txt1,textAlign: TextAlign.center,),
                const SizedBox(height: 15,),
                const Text("هل تريد الحصول على فرصة أخرى",style: TextStyle(fontSize: 25,color: Appcolors.primarycolor),),
               const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Appcolors.secondcolor
                    ),
                    onPressed: onPressed, child: const Text("نعم",style: TextStyle(fontSize: 25,color: Colors.black))
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Appcolors.secondcolor
                    ),
                    onPressed: onPressed2, child: Text(txt2,style: const TextStyle(fontSize: 25,color: Colors.black))
                  )
                ],),
                const SizedBox(height: 50,),
              if(controller.index== controller.data.length)
                   ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Appcolors.primarycolor,
                      foregroundColor: Colors.white
                    ),
                    onPressed: (){
                       myServices.sharedPref.setString("usertype", "children");
                       if(myServices.sharedPref.getString("usertype")=="children"){
                        Get.offNamed(RoutesApp.childrenresultexampage);
                       }else{
                        Get.offNamed(RoutesApp.resultexampage);
                       }
                     
                   }, child: const Text(" ادخل هنا لرؤية جميع النتائج",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                   )
              ],
            ),
            /////////////////level2//////////
          );
  }
}