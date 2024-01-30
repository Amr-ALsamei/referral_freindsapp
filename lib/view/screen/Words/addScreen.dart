
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/controller/Words/add_controller.dart';
import 'package:referral_freindsapp/core/class/handlingdataview.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';
import 'package:referral_freindsapp/core/function/validator.dart';
import 'package:referral_freindsapp/view/widget/Auth_FormFields/customformLabel.dart';
import 'package:referral_freindsapp/view/widget/Auth_FormFields/customformfield.dart';
import 'package:video_player/video_player.dart';


class AddWordsScreen extends StatelessWidget {
  const AddWordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
   Get.lazyPut(()=>WordsAddController());
    return Scaffold(
      
      body:GetBuilder<WordsAddController>(
        builder: (controller)=>  HandlingDataRequest(statusRequest: controller.statusRequest,
            widget: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
                    children: [
                      const SizedBox(height: 60,),
                     const CustumFormLable1(label: "أضافة كلمة جديدة",),
                      const Icon(Icons.note_alt_outlined,size: 100,color: Appcolors.primarycolor,),
                     const SizedBox(height: 10,),
                      
                   
                      Form(
                        key: controller.formsate,
                        child: Column(
                        children: [
                          CustumFormField(
                            isNumber: false,
                            valid: (val) {
                              return ValidInput(val!, 3, 100, "username");
                            },
                            label:"الكلمة" ,hinttext: "ادخل الكلمة هنا",
                          icon: Icons.note_add,
                          mycontroller: controller.word),
                           if(controller.file !=null)
                      Center(
                      child: controller.controllervideo!.value.isInitialized?
                    AspectRatio(aspectRatio: controller.controllervideo!.value.aspectRatio, child: VideoPlayer(controller.controllervideo!),)
                        : const CircularProgressIndicator(),
                  ),
                    

                 Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 50),
                         child: MaterialButton(
                        
                             color: Appcolors.thirdcolor,
                                onPressed: (){
                               controller.chooseVideogallery();
                        },child: const Text("اختار الفيديو",style: TextStyle(fontSize: 25),),),
                 ),
                // Spacer(),
                 
                          
                          
                        ],
                
                      ) ),
                     
                      
                     
                    ],
                    
                  ),
                ),
          ),
              
        ),
      bottomNavigationBar: GetBuilder<WordsAddController>(builder: (controller)=>ElevatedButton(
                        style: ElevatedButton.styleFrom(
                           
                          backgroundColor: Appcolors.primarycolor
                        ),
                        onPressed: (){
                          controller.addData();
                        }, child: const Text("اضافة",style: TextStyle(fontSize: 25,color: Colors.black),)
                        ),),
        
      
    );
  }
}