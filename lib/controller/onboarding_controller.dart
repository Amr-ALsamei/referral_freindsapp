
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Datasource/Static/static.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/services/services.dart';

abstract class OnBoardingController extends GetxController{
  next();
  onPageChange(int index);

}
class OnBoardingControllerImpllement extends OnBoardingController{
  late PageController pageController;

  int currentPage=0;
  
  MyServices myServices=Get.find();

  @override
  next() {
    currentPage++;
    if(currentPage> onboardinglist.length-1) {
       myServices.sharedPref.setString("step","1");
       Get.offAllNamed(RoutesApp.initiallogin);
    }else{
      pageController.animateToPage(currentPage, duration: const Duration(microseconds: 700), 
    curve: Curves.easeInOut);
    }
  }

  @override
  onPageChange(int index) {
    currentPage=index;
    update();
  }

  @override
  void onInit() {
    pageController=PageController();
    super.onInit();
  }

}