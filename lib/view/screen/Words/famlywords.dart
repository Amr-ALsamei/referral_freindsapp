import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/controller/Words/famlywords_Controller.dart';
import 'package:referral_freindsapp/core/class/handlingdataview.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';

class FamlyWordsScreen extends StatelessWidget {
  const FamlyWordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    FamlyWordsController controller=Get.put(FamlyWordsController());
    return Scaffold(
      body: Container(
      padding: const EdgeInsets.all(10),
      child: GetBuilder<FamlyWordsController>(
        builder: (controller)=>HandlingDataView(
          statusRequest: controller.statusRequest, 
          widget: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:2,
              childAspectRatio: 1.6 ),
        children: [
          ...List.generate(controller.data.length, (index) => Card(
            color: Appcolors.secondcolor,
            child: Column(
              children: [
              //   controller.goToVideoScreen(controller.data[index].letterVideo!,
              //  controller.data[index].letterId.toString());
                Text(controller.data[index].wordBody!),
                 SizedBox(
                    width: double.infinity,
                    child: MaterialButton(
                        textColor: Colors.white,
                        // padding: EdgeInsets.symmetric(horizontal: 60),
                        onPressed: (){
              
                          controller.goToVideoScreen(controller.data[index].wordVideo!,
                           controller.data[index].wordId.toString());
                           },
                        color: Appcolors.primarycolor,
                        child: const Text("انقر للمشاهدة", style:TextStyle( fontWeight: FontWeight.bold,fontSize: 20,
                         color: Appcolors.black,
                          
                          ),),
                        ),
                  ) ,

                
              ],
            ),
          ),)
          
          
          
        ],
      ),))
    ),
    );
  }
}