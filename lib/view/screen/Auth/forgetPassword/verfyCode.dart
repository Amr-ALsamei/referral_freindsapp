
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:referral_freindsapp/controller/Auth/verify_controller.dart';
import 'package:referral_freindsapp/core/class/handlingdataview.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';
import 'package:referral_freindsapp/view/widget/Auth_FormFields/customformLabel.dart';
import 'package:referral_freindsapp/view/widget/Auth_FormFields/customformText.dart';

class VerificationCode extends StatelessWidget {
  const VerificationCode({super.key});

  @override
  Widget build(BuildContext context) {
 Get.lazyPut(()=>VerificationControllerImp());
    return Scaffold(
      // appBar: AppBar(
      //   title:Text( "Verification Code",style: Theme.of(context).textTheme.headline1,),
      //   elevation: 0.0,
      //   centerTitle: true,
      //   backgroundColor: Appcolors.background,
      // ),
      body: GetBuilder<VerificationControllerImp>(
        builder: (controller)=>Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: HandlingDataRequest(statusRequest: controller.statusRequest,
          widget: ListView(
                  children: [
                   const SizedBox(height: 50,),
                   const CustumFormLable(label: "أدخل الكود",),
        
                   const SizedBox(height: 10,),
                 const  CustumFormText(text: "سجل دحولك الان باستخدام الايميل وكلمة المرور"),
        
                  const SizedBox(height: 30,),
                    OtpTextField(
                      fieldWidth: 50,
                      borderRadius: BorderRadius.circular(20),
                      numberOfFields: 5,
                      borderColor: Appcolors.primarycolor,
                      showFieldAsBox: true,
                      onCodeChanged: (String Code) {},
                      onSubmit: (String Verification) {
                        controller.goToResetPassword(Verification);
                      },
                    ),
                    const SizedBox(height: 30,),
                   
                    
                   
                  ],
                ),
        ),
      ),)
      
    );
  }
}