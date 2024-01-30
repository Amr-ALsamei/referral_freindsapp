import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/controller/Sentences/view_controller.dart';
import 'package:referral_freindsapp/core/class/handlingdataview.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/services/services.dart';

class SentencesScreen extends StatelessWidget {
  const SentencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices=Get.find();
    // ignore: unused_local_variable
    SentencesController controller=Get.put(SentencesController());
    return Scaffold(
      floatingActionButton:myServices.sharedPref.getString("admin") =="1"? FloatingActionButton(
       backgroundColor:  Appcolors.primarycolor,
        onPressed: (){
          Get.toNamed(RoutesApp.addsentencespage);
        },
        child: const Icon(Icons.add,),):null,
      body: Container( 
      padding: const EdgeInsets.all(10),
      child: GetBuilder<SentencesController>(
        builder: (controller)=>HandlingDataView(
          statusRequest: controller.statusRequest, 
          widget: ListView(
        children: [
          ...List.generate(controller.data.length, (index) => Card(
            color: Appcolors.secondcolor,
            child: Column(
              children: [
                Text(controller.data[index].sentenceBody!),
                if(myServices.sharedPref.getString("admin") =="0")
                 SizedBox(
                    width: double.infinity,
                    child: MaterialButton(
                        textColor: Colors.white,
                        // padding: EdgeInsets.symmetric(horizontal: 60),
                        onPressed: (){
              
                          controller.goToVideoScreen(controller.data[index].sentenceVideo!,
                           controller.data[index].sentenceId.toString());
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
                        Get.toNamed(RoutesApp.editsentencespage,arguments: {
                          "SentenceModel":controller.data[index]
                        });
                      }, icon: const Icon(Icons.edit)),
                    IconButton(
                      onPressed: (){
                       Get.defaultDialog(
                        title: "تنبيه",middleText: "هل تريد بالفعل حذف هذه الجملة",
                        onCancel: (){
                           
                        },
                        onConfirm: (){
                           controller.deleteData(controller.data[index].sentenceId.toString(),
                           controller.data[index].sentenceVideo!);
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