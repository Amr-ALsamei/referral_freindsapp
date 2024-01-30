
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Datasource/remote/Auth/logInData.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/function/handlingdata.dart';
import 'package:referral_freindsapp/core/services/services.dart';

abstract class LogInController extends GetxController{
  login();
  goToSignUp();
  goToForgetPassword();
}

class LogInControllerImp extends LogInController{

 GlobalKey<FormState> formstate=GlobalKey<FormState>();

 late TextEditingController email;
 late TextEditingController password;

  bool isShowPassword=false;

  StatusRequest statusRequest=StatusRequest.None;
  LogInData logInData=LogInData(Get.find());

  MyServices myServices=Get.find();

  ShowPassword(){
    isShowPassword=isShowPassword==true?false:true;
    update();

  }

  @override
  login()async {
    if(formstate.currentState!.validate()){
      statusRequest=StatusRequest.loading;
      update();
    var response=await logInData.LogInPostData(email.text,password.text);
    // print(response);
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
        // data.addAll(response['data']);
        // print(response['data']['user_aproov'].runtimeType);
       
       if(response['data']['user_aproov']==1){
        myServices.sharedPref.setString("usertype", "user");
         myServices.sharedPref.setString("Id", response['data']['user_id'].toString());
         // ignore: unused_local_variable
         String userid=myServices.sharedPref.getString("Id")!;
         myServices.sharedPref.setString("admin", response['data']['user_type'].toString());
        myServices.sharedPref.setString("username",response['data']['user_name'] );
        myServices.sharedPref.setString("email",response['data']['user_email'] );
        myServices.sharedPref.setString("phone",response['data']['user_phone'] );
         myServices.sharedPref.setString("step","2" );
         myServices.sharedPref.setString("indx", "0");
         FirebaseMessaging.instance.subscribeToTopic("user");
         FirebaseMessaging.instance.subscribeToTopic("user${userid}");
        print(myServices.sharedPref.getString("Id")!);
        Get.offNamed(RoutesApp.homepage);
       }else{
        Get.toNamed(RoutesApp.verfyCodeSignUp,arguments: {
               "email":email.text
        });
       }
      // Get.delete<SignUpControllerImp>();
        }else{
          Get.defaultDialog(title: "Wraning",
          middleText: "الايميل أو كلمة السر غير صحيح");
          statusRequest=StatusRequest.failure;
        }
    }
    update();
      
    
    }
  }
  
  @override
  goToSignUp() {
    Get.offNamed(RoutesApp.signapp);
  }
 loginAsChildren(){
  Get.offNamed(RoutesApp.loginchildren);
 }
  @override
  void onInit() {
    // FirebaseMessaging.instance.getToken().then((value){
    //     print(value);
    //     // ignore: unused_local_variable
    //     String? token=value;
    // });
    email=TextEditingController();
    password=TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
  
  @override
  goToForgetPassword() {
   Get.toNamed(RoutesApp.forgetpassword);
  }

}