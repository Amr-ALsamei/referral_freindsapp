import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/controller/addchildren_controller.dart';
import 'package:referral_freindsapp/core/class/handlingdataview.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';
import 'package:referral_freindsapp/core/function/validator.dart';
import 'package:referral_freindsapp/view/widget/Auth_FormFields/customformLabel.dart';
import 'package:referral_freindsapp/view/widget/Auth_FormFields/customformfield.dart';

class AddChildrenScreenPage extends StatelessWidget {
  const AddChildrenScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddchildernControllerImp());
    return Scaffold(
      
      body: GetBuilder<AddchildernControllerImp>(
          builder:(controller)=>  HandlingDataRequest(statusRequest: controller.statusRequest,
              widget: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: ListView(
                      children: [
                       const SizedBox(height: 25,),
                       const CustumFormLable1(label: " أضافة طفلك",),
                       const Icon(Icons.note_alt_outlined,size: 100,color: Appcolors.primarycolor,),
                       const SizedBox(height: 10,),
                       
                      const SizedBox(height: 30,),
                        Form(
                          key:controller.formstateadd,
                          child: Column(
                          children: [
                             CustumFormField(
                              isNumber: false,
                              valid: (val) {
                              return  ValidInput(val!, 2, 50, "username");
                              },
                              label:"الاسم" ,hinttext: "أدخل اسم طفلك هنا",
                            icon: Icons.person_outline,
                            mycontroller: controller.userName), 
                       const SizedBox(height: 15,),
                            CustumFormField(
                              isNumber: false,
                              valid: (val) {
                                return ValidInput(val!, 5, 100, "email");
                              },
                              label:"الايميل" ,hinttext: "ادخل الايميل هنا",
                            icon: Icons.email_outlined,
                            mycontroller: controller.email), 
                            
                          ],
                  
                        ) ),
                         const SizedBox(height: 100,),
                       ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Appcolors.primarycolor
                        ),
                        onPressed: (){
                          controller.addChildren();
                        }, child: const Text("أضافة",style: TextStyle(fontSize: 25,color: Colors.black),)
                        )
                        
                        
                       
                      ],
                    ),
                  ),
            ),
          ), 
      
    );
  }
}