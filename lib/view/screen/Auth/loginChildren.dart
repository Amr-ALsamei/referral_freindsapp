
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/controller/Auth/loginchildrenController.dart';
import 'package:referral_freindsapp/core/class/handlingdataview.dart';
import 'package:referral_freindsapp/core/function/validator.dart';
import 'package:referral_freindsapp/view/widget/Auth_FormFields/customButtonAuth.dart';
import 'package:referral_freindsapp/view/widget/Auth_FormFields/customformLabel.dart';
import 'package:referral_freindsapp/view/widget/Auth_FormFields/customformfield.dart';


class LoginchildrenApp extends StatelessWidget {
  const LoginchildrenApp({super.key});

  @override
  Widget build(BuildContext context) {
   Get.lazyPut(()=>LogInchildrenControllerImp());
    return Scaffold(
      
      body:GetBuilder<LogInchildrenControllerImp>(
        builder: (controller)=> HandlingDataRequest(statusRequest: controller.statusRequest,
            widget: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
                    children: [
                      const SizedBox(height: 60,),
                     const CustumFormLable1(label: "تسجيل الدخول",),
                  
                     
                      
                    const SizedBox(height: 20,),
                      Form(
                        key: controller.formstate,
                        child: Column(
                        children: [
                          CustumFormField(
                            isNumber: false,
                            valid: (val) {
                              return ValidInput(val!, 5, 100, "email");
                            },
                            label:"الايميل" ,hinttext: "ادخل الايميل هنا",
                          icon: Icons.email_outlined,
                          mycontroller: controller.email),
                          // const SizedBox(height: 25,),
                          
                          
                        ],
                
                      ) ),
                     
                  
                      CustumButtonAuth(text: "تسجيل الدخول",onPressed: () {
                        controller.login();
                      },),
                      // SizedBox(height: 15,),
                     
                    ],
                  ),
                ),
          ),
              
        ),
      
    );
  }
}