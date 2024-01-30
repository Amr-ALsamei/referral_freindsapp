
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Datasource/remote/Auth/addchildren_data.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/function/handlingdata.dart';
import 'package:referral_freindsapp/core/services/services.dart';

abstract class AddchildernController extends GetxController{
  addChildren();
 
}

class AddchildernControllerImp extends AddchildernController{
 
 
 GlobalKey<FormState> formstateadd=GlobalKey<FormState>();


 late TextEditingController userName;
 late TextEditingController email;
 
StatusRequest statusRequest=StatusRequest.None;


SignupChildrenData signupData=SignupChildrenData(Get.find());//Get.find() Takes from initialBinding

  List data=[];

 MyServices myServices=Get.find();
  
  @override
  addChildren()async {
   
    if(formstateadd.currentState!.validate()){
      statusRequest=StatusRequest.loading;
      update();
    var response=await signupData.SignupPostData(
      myServices.sharedPref.getString("Id")!,
      userName.text,email.text);
    statusRequest=handlingData(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
        Get.snackbar("تنبيه", "تم اضافة الطفل بنجاح");
        Get.offNamed(RoutesApp.homepage );
      // Get.delete<SignUpControllerImp>();
        }else{
          Get.defaultDialog(title: "تحذير",
          middleText: "يوجد خطأ");
          statusRequest=StatusRequest.failure;
        }
    }
    update();
      
    }
    
  }

  

  @override
  void onInit() {
    userName=TextEditingController();
    email=TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    userName.dispose();
    email.dispose();
    super.dispose();
  }
  
  

}