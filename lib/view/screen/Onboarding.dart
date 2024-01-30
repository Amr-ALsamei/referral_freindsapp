
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/controller/onboarding_controller.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';
import 'package:referral_freindsapp/view/widget/onboarding/custombutton.dart';
import 'package:referral_freindsapp/view/widget/onboarding/customslider.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImpllement());
    
    return  const Scaffold(
      backgroundColor:Appcolors.background ,
      body: SafeArea(
        child: Column( 
          children: [
            Expanded(
              flex: 4,
              child:CustomSliderOnBoarding() ,
            ),
           Expanded(
              flex: 1,
              child: Column(
                children: [
                  // CustomDotController(),
                  // Spacer(flex: 2,),
                  CustomButton(),
                ],
              )
              )
          ],
        ),
      ),
    );
  }
}