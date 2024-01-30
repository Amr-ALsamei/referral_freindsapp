
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/controller/Auth/SuccedResPassWordControler.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';
import 'package:referral_freindsapp/view/widget/Auth_FormFields/customButtonAuth.dart';
import 'package:referral_freindsapp/view/widget/Auth_FormFields/customformText.dart';

class SuccessedResetPassword extends StatelessWidget {
  const SuccessedResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
  Get.lazyPut(()=>SuccessedResetPasswordControllerImp());
    return Scaffold(
      appBar:  AppBar(
        title:Text( "تم تغيير كلمة السر بنجاح",style: Theme.of(context).textTheme.displayLarge,),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Appcolors.background,
      ),
      backgroundColor: Appcolors.background,
      body: GetBuilder<SuccessedResetPasswordControllerImp>(
        builder: (controller)=>Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle_outline,size: 200,color: Appcolors.primarycolor,),
              const CustumFormText(text:"شكرا لك لاتمام خطوات تغير كلمة المرور بنجاح"),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                width: double.infinity,
                child: CustumButtonAuth(text: "ذهاب الى الدخول",onPressed: () {
                      controller.goToLogin();
                    },),
              ),]
              )
              ))
             
    );
  }
}