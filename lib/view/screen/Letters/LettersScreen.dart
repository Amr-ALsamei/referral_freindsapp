import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/controller/Letters/view_controller.dart';
import 'package:referral_freindsapp/core/class/handlingdataview.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/services/services.dart';

class LettersScreen extends StatelessWidget {
  const LettersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices=Get.find();
    // ignore: unused_local_variable
    LettersController controller=Get.put(LettersController());
    return Scaffold(
      floatingActionButton:myServices.sharedPref.getString("admin") =="1"?  FloatingActionButton(
       backgroundColor:  Appcolors.primarycolor,
        onPressed: (){
         
          Get.toNamed(RoutesApp.addLetterpage);
        },
        child: const Icon(Icons.add,),):null,
      body: Container(
      padding: const EdgeInsets.all(10),
      child: GetBuilder<LettersController>(
        builder: (controller)=>HandlingDataView(
          statusRequest: controller.statusRequest, 
          widget: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:2,
              childAspectRatio:1.6 ),
        children: [
          ...List.generate(controller.data.length, (index) => Card(
            color: Appcolors.secondcolor,
            child:  Column(
                children: [
                 
                  Text(controller.data[index].letterName!,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),

                if(myServices.sharedPref.getString("admin") =="0")
                 SizedBox(
                    width: double.infinity,
                    child: MaterialButton(
                        textColor: Colors.white,
                        // padding: EdgeInsets.symmetric(horizontal: 60),
                        onPressed: (){
              
                          controller.goToVideoScreen(controller.data[index].letterVideo!,
                           controller.data[index].letterId.toString());
                           },
                        color: Appcolors.primarycolor,
                        child: const Text("انقر للمشاهدة", style:TextStyle( fontWeight: FontWeight.bold,fontSize: 20,
                         color: Appcolors.black,
                          
                          ),),
                        ),
                  ) ,

                 if(myServices.sharedPref.getString("admin") =="1")
                  const Divider(),
                  if(myServices.sharedPref.getString("admin") =="1")
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: (){
                          Get.toNamed(RoutesApp.EditLetterpage,arguments: {
                            "LetterModel":controller.data[index]
                          });
                        }, icon: const Icon(Icons.edit)),
                      IconButton(
                        onPressed: (){
                         Get.defaultDialog(
                          title: "تنبيه",middleText: "هل تريد بالفعل حذف هذا الحرف",
                          onCancel: (){
                             
                          },
                          onConfirm: (){
                             controller.deleteData(controller.data[index].letterId.toString(),
                             controller.data[index].letterVideo!);
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