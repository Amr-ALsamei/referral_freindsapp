
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/controller/Sentences/edit_controller.dart';
import 'package:referral_freindsapp/core/class/handlingdataview.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';
import 'package:referral_freindsapp/core/function/validator.dart';
import 'package:referral_freindsapp/view/widget/Auth_FormFields/customformLabel.dart';
import 'package:referral_freindsapp/view/widget/Auth_FormFields/customformfield.dart';
import 'package:video_player/video_player.dart';


class EditSentencesScreen extends StatelessWidget {
  const EditSentencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
   Get.put(SentenceEditController());
    return Scaffold(
      
      body:GetBuilder<SentenceEditController>(
        builder: (controller)=>  HandlingDataRequest(statusRequest: controller.statusRequest,
            widget: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
                    children: [
                      const SizedBox(height: 60,),
                     const CustumFormLable1(label: " تعديل هذه جملة ",),
                      const Icon(Icons.note_alt_outlined,size: 150,color: Appcolors.primarycolor,),
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
                            label:"الجملة" ,hinttext: "ادخل الجملة هنا",
                          icon: Icons.edit_note_rounded,
                          mycontroller: controller.sentence),
                          // const SizedBox(height: 25,),
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
                        },child: const Text("اختار الفيديو",style:TextStyle(fontSize: 25) ,),),
                 ),
                          
                          
                        ],
                
                      ) ),
                     
                      
                     
                    ],
                    
                  ),
                ),
          ),
              
        ),
        bottomNavigationBar: GetBuilder<SentenceEditController>(builder: (controller)=>ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Appcolors.primarycolor
                      ),
                      onPressed: (){
                        controller.editData();
                      }, child: const Text("تعديل",style: TextStyle(fontSize: 25,color: Colors.black),)
                      )),
      
    );
  }
}