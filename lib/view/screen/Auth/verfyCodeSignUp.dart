
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:referral_freindsapp/controller/Auth/verify_controller_SignUp.dart';
import 'package:referral_freindsapp/core/class/handlingdataview.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';
import 'package:referral_freindsapp/view/widget/Auth_FormFields/customformLabel.dart';
import 'package:referral_freindsapp/view/widget/Auth_FormFields/customformText.dart';


class VerificationCodeSignUp extends StatelessWidget {
  const VerificationCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
   Get.lazyPut(()=>VerificationControllerSignUpImp());
    return Scaffold(
      appBar: AppBar(
        title:Text( "Verification Code",style: Theme.of(context).textTheme.displayLarge,),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Appcolors.background,
      ),
      body:GetBuilder<VerificationControllerSignUpImp>(
        builder: (controller)=> Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: HandlingDataRequest(statusRequest: controller.statusRequest,
          widget: ListView(
                  children: [
                  
                   const CustumFormLable(label: "أدخل الكود",),
        
                   const SizedBox(height: 10,),
                   CustumFormText(text: "من فضلك أدخل الكول الذي وصل اليك ${controller.email}"),
        
                  const SizedBox(height: 30,),
                    OtpTextField(
                      fieldWidth: 50,
                      borderRadius: BorderRadius.circular(20),
                      numberOfFields: 5,
                      borderColor: Appcolors.primarycolor,
                      showFieldAsBox: true,
                      onCodeChanged: (String Code) {},
                      onSubmit: (String VerificationCode) {
                        controller.goToSuccessSignUp(VerificationCode);
                      },
                    ),
                    const SizedBox(height: 30,),
                   InkWell(onTap: () {
                       controller.Resend();
                   },
                   child: const Center(child:Text("اعادة الارسال",style: TextStyle(fontSize: 20,color: Appcolors.primarycolor),) ,),)
                    
                   
                  ],
                ),
        ),
      ),)
      
    );
  }
}