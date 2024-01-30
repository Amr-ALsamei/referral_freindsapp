
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/controller/Auth/forgetpasswordController.dart';
import 'package:referral_freindsapp/core/class/handlingdataview.dart';
import 'package:referral_freindsapp/core/function/validator.dart';
import 'package:referral_freindsapp/view/widget/Auth_FormFields/customButtonAuth.dart';
import 'package:referral_freindsapp/view/widget/Auth_FormFields/customformLabel.dart';
import 'package:referral_freindsapp/view/widget/Auth_FormFields/customformText.dart';
import 'package:referral_freindsapp/view/widget/Auth_FormFields/customformfield.dart';
import 'package:referral_freindsapp/view/widget/Auth_FormFields/logoAuth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
   Get.lazyPut(()=>ForgetPasswordControllerImp());
    return Scaffold(
      
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller)=>Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: HandlingDataRequest(statusRequest: controller.statusRequest,
          widget: ListView(
                  children: [
                   const LogoAuth(),
                   const CustumFormLable(label: "التحقق من الايميل",),
        
                   const SizedBox(height: 10,),
                 const  CustumFormText(text: "أدخل ايميلك لنتأكد من أنك صاحب الحساب ولتتمكن من تغير كلمة لمرور"),
        
                  const SizedBox(height: 20,),
                    Form(
                      key:controller.formstateforgetpassword ,
                      child: Column(
                      children: [
                        CustumFormField(
                          isNumber: false,
                          valid: (val) {
                          return  ValidInput(val!, 5, 100, "email");
                          },
                          label:"الايميل" ,hinttext: "أدخل الايميل هنا",
                        icon: Icons.email_outlined,
                        mycontroller: controller.email),
                        const SizedBox(height: 25,),
                        
                        
                      ],
              
                    ) ),
                    const SizedBox(height: 30,),
                   
                    CustumButtonAuth(text: "تحقق",onPressed: () {
                       controller.CheckEmail();
                    },),
                   
                  ],
                ),
        ),
      ),)
      
    );
  }
}