
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Datasource/remote/Auth/loginchildData.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/function/handlingdata.dart';
import 'package:referral_freindsapp/core/services/services.dart';

abstract class LogInchildrenController extends GetxController{
  login();
 
}

class LogInchildrenControllerImp extends LogInchildrenController{

 GlobalKey<FormState> formstate=GlobalKey<FormState>();

 late TextEditingController email;
 
  

  StatusRequest statusRequest=StatusRequest.None;
  LogInChildrenData logInData=LogInChildrenData(Get.find());

  MyServices myServices=Get.find();

  

  @override
  login()async {
    if(formstate.currentState!.validate()){
      statusRequest=StatusRequest.loading;
      update();
    var response=await logInData.LogInPostData(email.text);
    // print(response);
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
        myServices.sharedPref.setString("admin", "0");
        myServices.sharedPref.setString("indx", "0");
         myServices.sharedPref.setString("usertype", "children");
         myServices.sharedPref.setString("Id", response['data']['chidlren_Id'].toString());
         // ignore: unused_local_variable
         String userid=myServices.sharedPref.getString("Id")!;
        myServices.sharedPref.setString("username",response['data']['chidlren_Name'] );
        myServices.sharedPref.setString("email",response['data']['email'] );
        
         myServices.sharedPref.setString("step","2" );
         FirebaseMessaging.instance.subscribeToTopic("user");
         FirebaseMessaging.instance.subscribeToTopic("user${userid}");
        Get.offNamed(RoutesApp.homepage);
       
      // Get.delete<SignUpControllerImp>();
        }else{
          Get.defaultDialog(title: "Wraning",
          middleText: " email not correct");
          statusRequest=StatusRequest.failure;
        }
    }
    update();
      
    
    }
  }
  
 

  @override
  void onInit() {
    // FirebaseMessaging.instance.getToken().then((value){
    //     print(value);
    //     // ignore: unused_local_variable
    //     String? token=value;
    // });
    email=TextEditingController();
   
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
  
 

}