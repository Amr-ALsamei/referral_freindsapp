
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Datasource/remote/Auth/SignUPData.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/function/handlingdata.dart';

abstract class SignUpController extends GetxController{
  signUp();
  goToLogIn();
}

class SignUpControllerImp extends SignUpController{
 
 GlobalKey<FormState> formstateSignUp=GlobalKey<FormState>();
 GlobalKey<FormState> formstateEdit=GlobalKey<FormState>();


 late TextEditingController userName;
 late TextEditingController email;
 late TextEditingController phonNumber;
 late TextEditingController password;
 bool isShowPassWord=false;
StatusRequest statusRequest=StatusRequest.None;


SignupData signupData=SignupData(Get.find());//Get.find() Takes from initialBinding

  List data=[];

 ShowPassWord(){
  isShowPassWord=isShowPassWord==true?false:true;
    update();
    }
  
  @override
  signUp()async {
   
    if(formstateSignUp.currentState!.validate()){
      statusRequest=StatusRequest.loading;
      update();
    var response=await signupData.SignupPostData(userName.text,password.text,email.text,phonNumber.text);
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
        // data.addAll(response['data']);
        Get.offNamed(RoutesApp.verfyCodeSignUp,arguments:{
          'email':email.text
        } );
      // Get.delete<SignUpControllerImp>();
        }else{
          Get.defaultDialog(title: "Wraning",
          middleText: "Phone number or email Already exist");
          statusRequest=StatusRequest.failure;
        }
    }
    update();
      
    }
    
  }

  @override
  goToLogIn() {
     Get.offNamed(RoutesApp.login);
  }

  @override
  void onInit() {
    userName=TextEditingController();
    email=TextEditingController();
    phonNumber=TextEditingController();
    password=TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    userName.dispose();
    email.dispose();
    phonNumber.dispose();
    password.dispose();
    super.dispose();
  }
  
  

}