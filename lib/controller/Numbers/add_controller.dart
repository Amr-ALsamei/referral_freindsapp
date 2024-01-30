
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Datasource/remote/numbers_data.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/function/handlingdata.dart';
import 'package:referral_freindsapp/core/function/uploadvideo.dart';
import 'package:video_player/video_player.dart';

class NumbersAddController extends GetxController{

 
 StatusRequest statusRequest=StatusRequest.None;
 NumbersData numbersData=NumbersData(Get.find());
 File? file;
 late TextEditingController number;
 VideoPlayerController? controllervideo;
 GlobalKey<FormState> formsate=GlobalKey<FormState>();
 
 chooseVideogallery()async{
  file=await pickFile();
  if(file !=null){
    controllervideo=VideoPlayerController.file(file!)
      ..initialize().then((_) {
       controllervideo!.play();
     update();
    });
  }
  update();
 }

addData()async {
    if(formsate.currentState!.validate()){
      if(file==null)return Get.snackbar("تنبيه","من فضلك أضف فيديو");
      Map data={
      
      "number":number.text,};
   statusRequest=StatusRequest.loading;
   update();
    var response=await numbersData.addData(data,file!);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      Get.offAllNamed(RoutesApp.numberspage);
    
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
    }
  }
  @override
  void onInit() {
    
    number=TextEditingController();
    super.onInit();
  }

@override
  void dispose() {
    number.dispose();
    controllervideo!.dispose();
    super.dispose();
  }
}