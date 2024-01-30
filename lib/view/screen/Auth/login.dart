
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/controller/Auth/loginController.dart';
import 'package:referral_freindsapp/core/class/handlingdataview.dart';
import 'package:referral_freindsapp/core/function/AlertExitApp.dart';
import 'package:referral_freindsapp/core/function/validator.dart';
import 'package:referral_freindsapp/view/widget/Auth_FormFields/customButtonAuth.dart';
import 'package:referral_freindsapp/view/widget/Auth_FormFields/customformLabel.dart';
import 'package:referral_freindsapp/view/widget/Auth_FormFields/customformfield.dart';
import 'package:referral_freindsapp/view/widget/Auth_FormFields/customtextSignup&signIn.dart';


class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
   Get.lazyPut(()=>LogInControllerImp());
    return Scaffold(
      
      body:GetBuilder<LogInControllerImp>(
        builder: (controller)=> WillPopScope(
          onWillPop: AlertExitApp,
          child: HandlingDataRequest(statusRequest: controller.statusRequest,
            widget: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
                    children: [
                      const SizedBox(height: 60,),
                     const CustumFormLable1(label: "تسجيل الدخول",),
                  
                     const SizedBox(height: 10,),
                      CustumTextSignUpORSignIn(txt1: "لا تزال جديد هنا؟",
                       txt2: "انشاء حساب جديد",onTap:(){
                         controller.goToSignUp();
                         },),
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
                          GetBuilder<LogInControllerImp>(builder: (controller){
                            return CustumFormField(
                            obsecureText: controller.isShowPassword,
                            onTapIcon: () => controller.ShowPassword(),
                            isNumber: false,
                            valid: (val) {
                              return ValidInput(val!, 5, 30, "password");
                            },
                            label:"كلمة المرور" ,hinttext: "أدحل كلمة المرور هنا",
                          icon: Icons.lock_outline,
                          mycontroller: controller.password
                          );
                          })
                          
                        ],
                
                      ) ),
                      const SizedBox(height: 20,),
                      InkWell(onTap: () {
                        controller.goToForgetPassword();
                      },
                        child: const Text("نسيت كلمة المرور",textAlign: TextAlign.start,)),
                  
                      CustumButtonAuth(text: "تسجيل الدخول",onPressed: () {
                        controller.login();
                      },),

                      const SizedBox(height: 25,),
                      CustumButtonAuth(text: "الدخول كطفل",onPressed: () {
                        controller.loginAsChildren();
                      },),
                     
                    ],
                  ),
                ),
          ),
              
        ),)
      
    );
  }
}