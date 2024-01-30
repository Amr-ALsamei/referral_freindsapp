
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Datasource/remote/Auth/SignUPData.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/function/handlingdata.dart';
import 'package:referral_freindsapp/core/services/services.dart';

abstract class EditUserNameController extends GetxController{
  editName();
 
}

class EditUserNameControllerImp extends EditUserNameController{
 
 
 GlobalKey<FormState> formstateEdit=GlobalKey<FormState>();


 late TextEditingController userName;
 
StatusRequest statusRequest=StatusRequest.None;


SignupData signupData=SignupData(Get.find());//Get.find() Takes from initialBinding

  List data=[];

 MyServices myServices=Get.find();
  
  @override
editName()async {
    var response;
    if(formstateEdit.currentState!.validate()){
      statusRequest=StatusRequest.loading;
      update();

   if(myServices.sharedPref.getString("usertype")=="children"){
       response=await signupData.editchildrenData(userName.text,myServices.sharedPref.getString("Id")!);
   }else{
      response=await signupData.editData(userName.text,myServices.sharedPref.getString("Id")!);
   }
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
        // data.addAll(response['data']);
        Get.offNamed(RoutesApp.login );
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
  void onInit() {
    userName=TextEditingController();
    userName.text=myServices.sharedPref.getString("username")!;
    super.onInit();
  }

  @override
  void dispose() {
    userName.dispose();
    
    super.dispose();
  }
  
  

}