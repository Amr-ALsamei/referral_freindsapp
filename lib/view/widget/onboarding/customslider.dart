
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Datasource/Static/static.dart';
import 'package:referral_freindsapp/controller/onboarding_controller.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImpllement> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
            controller: controller.pageController,
           onPageChanged: (value) {
             controller.onPageChange(value);
           },
                itemCount: onboardinglist.length,
                itemBuilder: (context, i) =>Column(
                  children: [
                    
                    const SizedBox(height: 30,),
                       ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                         child: Image.asset(onboardinglist[i].image!,
                            height: 200,
                             width: 200,
                              fit: BoxFit.fill,),
                       ),
                    
                    // SizedBox(height: 20,),
                    Text(onboardinglist[i].title!,
                    style:const TextStyle( fontWeight: FontWeight.bold,fontSize: 30,
                       color: Appcolors.blu,
                        
                        ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Text(onboardinglist[i].body!,textAlign: TextAlign.center,
                      style:const TextStyle(  fontWeight: FontWeight.bold,height: 0,
                         color: Colors.black,
                         fontSize: 16,)
                         )),
                       const SizedBox(height: 50,),
                  ],
                ) ,
                
              );
  }
}