import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/controller/Words/view_controller.dart';
import 'package:referral_freindsapp/core/class/handlingdataview.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/services/services.dart';

class WordsScreen extends StatelessWidget {
  const WordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices=Get.find();
    // ignore: unused_local_variable
    WordsController controller=Get.put(WordsController());
    return Scaffold(
      floatingActionButton:myServices.sharedPref.getString("admin") =="1"? FloatingActionButton(
       backgroundColor:  Appcolors.primarycolor,
        onPressed: (){
          Get.toNamed(RoutesApp.addwordspage);
        },
        child: const Icon(Icons.add,),):null,
      body: Container(
      padding: const EdgeInsets.all(10),
      child: GetBuilder<WordsController>(
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
                if(myServices.sharedPref.getString("admin") =="0")
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

                if(myServices.sharedPref.getString("admin") =="1")
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: (){
                        Get.toNamed(RoutesApp.editwordspage,arguments: {
                          "WordModel":controller.data[index]
                        });
                      }, icon: const Icon(Icons.edit)),
                    IconButton(
                      onPressed: (){
                       Get.defaultDialog(
                        title: "تنبيه",middleText: "هل تريد بالفعل حذف هذه الكلمة",
                        onCancel: (){
                           
                        },
                        onConfirm: (){
                           controller.deleteData(controller.data[index].wordId.toString(),
                           controller.data[index].wordVideo!);
                           Get.back();
                        }
                       );
                      }, icon: const Icon(Icons.delete))
                  ],
                )
              ],
            ),
          ),)
          
          
          
        ],
      ),))
    ),
    );
  }
}