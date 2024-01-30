
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/controller/Auth/signUpController.dart';
import 'package:referral_freindsapp/core/class/handlingdataview.dart';
import 'package:referral_freindsapp/core/function/AlertExitApp.dart';
import 'package:referral_freindsapp/core/function/validator.dart';
import 'package:referral_freindsapp/view/widget/Auth_FormFields/customButtonAuth.dart';
import 'package:referral_freindsapp/view/widget/Auth_FormFields/customformLabel.dart';
import 'package:referral_freindsapp/view/widget/Auth_FormFields/customformfield.dart';
import 'package:referral_freindsapp/view/widget/Auth_FormFields/customtextSignup&signIn.dart';


class SignApp extends StatelessWidget {
  const SignApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=>SignUpControllerImp());
    return Scaffold(
      
      body: GetBuilder<SignUpControllerImp>(
        builder:(controller)=>  WillPopScope(
          onWillPop: AlertExitApp,
          child: HandlingDataRequest(statusRequest: controller.statusRequest,
            widget: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
                    children: [
                     const SizedBox(height: 25,),
                     const CustumFormLable1(label: "انشاء حساب جديد",),
                  
                     const SizedBox(height: 20,),
                      CustumTextSignUpORSignIn(txt1:"هل لديك حساب بالفعل؟",
                      txt2:"سجل دخولك هنا" ,
                      onTap: () {
                        controller.goToLogIn();
                      },
                      ),
                    const SizedBox(height: 30,),
                      Form(
                        key:controller.formstateSignUp ,
                        child: Column(
                        children: [
                           CustumFormField(
                            isNumber: false,
                            valid: (val) {
                            return  ValidInput(val!, 2, 50, "username");
                            },
                            label:"الاسم" ,hinttext: "أدخل اسمك هنا",
                          icon: Icons.person_outline,
                          mycontroller: controller.userName),
                          
                  
                          CustumFormField(
                            isNumber: false,
                            valid: (val) {
                            return  ValidInput(val!, 5, 100, "email");
                            },
                            label:"الايميل" ,hinttext: "أدحل الايميل هنا",
                          icon: Icons.email_outlined,
                          mycontroller: controller.email),
                          
                           CustumFormField(
                            isNumber: true,
                            valid: (val) {
                             return ValidInput(val!, 9, 15, "phone");
                            },
                            label:"الجوال" ,hinttext: "أدحل رقم الجوال هنا",
                          icon: Icons.phone_android_outlined,
                          mycontroller: controller.phonNumber),
                          
                          GetBuilder<SignUpControllerImp>(
                            builder: (controller){
                              return CustumFormField(
                                obsecureText: controller.isShowPassWord,
                                onTapIcon: () => controller.ShowPassWord(),
                              isNumber: false,
                              valid: (val) {
                                 return ValidInput(val!, 5, 30, "password");
                            },
                            label:"كلمة المرور" ,hinttext: "أدحل كلمة المرور هنا",
                            icon: Icons.lock_outline,
                            mycontroller:controller.password);
                          }),
                          
                        ],
                
                      ) ),
                      const SizedBox(height: 30,),
                     
                      CustumButtonAuth(text: "انشاء حساب",onPressed: () {
                        controller.signUp();
                      },),
                      
                     
                    ],
                  ),
                ),
          ),
        ), )
      
    );
  }
}