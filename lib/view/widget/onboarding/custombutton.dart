
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/controller/onboarding_controller.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';

class CustomButton extends GetView<OnBoardingControllerImpllement> {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
             width: 250,
                    margin: const EdgeInsets.only(left: 30,right: 30),
                    child:MaterialButton(
                      textColor: Colors.white,
                      // padding: const EdgeInsets.symmetric(horizontal: 60),
                      onPressed: (){
                        controller.next();
                      },
                      color: Appcolors.primarycolor,
                      child: const Text("البدء", style:TextStyle( fontWeight: FontWeight.bold,fontSize: 25,
                       color: Appcolors.black,
                        
                        ),),
                      ) ,
                  );
  }
}