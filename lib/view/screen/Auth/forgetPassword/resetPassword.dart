

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/controller/Auth/resetPasswordController.dart';
import 'package:referral_freindsapp/core/class/handlingdataview.dart';
import 'package:referral_freindsapp/core/function/validator.dart';
import 'package:referral_freindsapp/view/widget/Auth_FormFields/customButtonAuth.dart';
import 'package:referral_freindsapp/view/widget/Auth_FormFields/customformLabel.dart';
import 'package:referral_freindsapp/view/widget/Auth_FormFields/customformText.dart';
import 'package:referral_freindsapp/view/widget/Auth_FormFields/customformfield.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
   Get.lazyPut(()=>ResetPasswordControllerImp());
    return Scaffold(
      // appBar: AppBar(
      //   title:Text( "Reset Password",style: Theme.of(context).textTheme.headline1,),
      //   elevation: 0.0,
      //   centerTitle: true,
      //   backgroundColor: Appcolors.background,
      // ),
      body: GetBuilder<ResetPasswordControllerImp>(
        builder: (controller)=>Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: HandlingDataRequest(statusRequest: controller.statusRequest,
          widget: ListView(
                  children: [
                   const SizedBox(height: 45,),
                   const CustumFormLable(label: "كلمة السر الجديدة",),
        
                   const SizedBox(height: 10,),
                 const  CustumFormText(text: " من فضلك أدخل كلمة السر الجديدة"),
        
                  const SizedBox(height: 30,),
                    Form(
                      key: controller.formstateRestpassword,
                      child: Column(
                      children: [
                       GetBuilder<ResetPasswordControllerImp>(
                        builder: (controller){
                            return  CustumFormField(
                              obsecureText: controller.isShowPassWord,
                              onTapIcon: () => controller.ShowPassWord(),
                             isNumber: false,
                             valid: (val) {
                                return  ValidInput(val!, 5, 30, "password");
                          },
                          label:"كلمة السر الجديدة" ,
                          hinttext: "أدخل كلمة السر هنا",
                        icon: Icons.lock_outline,
                        mycontroller: controller.NewPassword);
                       }),
                        const SizedBox(height: 25,),
        
                        GetBuilder<ResetPasswordControllerImp>(
                          builder: (controller){
                          return CustumFormField(
                            obsecureText: controller.isShowPassWord1,
                            onTapIcon: () => controller.ShowPassWord1(),
                           isNumber: false,
                          valid: (val) {
                            return  ValidInput(val!, 5, 30, "password");
                          },
                          label:" تاكد من كلمةالسرالجديدة" ,
                        hinttext: "أدخل كلمة السر هنا",
                        icon: Icons.lock_outline,
                        mycontroller: controller.ReNewPassword);
                        }),
                        const SizedBox(height: 25,),
                        
                        
                      ],
              
                    ) ),
                    const SizedBox(height: 30,),
                   
                    CustumButtonAuth(text: "حفظ",onPressed: () {
                       if(controller.NewPassword.text==controller.ReNewPassword.text){
                         controller.goTSuccessResetPassword();
                       }
                       else{
                        Get.defaultDialog(title: "خطا",
                        middleText: "كلمة السر التي أدخلتها غير متطابقة"
                        
                        );
                       }
                      
                    },),
                   
                  ],
                ),
        ),
      ),)
      
    );
  }
}