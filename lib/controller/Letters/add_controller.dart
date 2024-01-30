
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Datasource/remote/Letters_data.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/function/handlingdata.dart';
import 'package:referral_freindsapp/core/function/uploadvideo.dart';
import 'package:video_player/video_player.dart';

class LettersAddController extends GetxController{

 
 StatusRequest statusRequest=StatusRequest.None;
 LettersData lettersData=LettersData(Get.find());
 File? file;
 late TextEditingController letter;
//  late TextEditingController lettervideo;
 VideoPlayerController? controllervideo;
 GlobalKey<FormState> formsate=GlobalKey<FormState>();
 
 chooseVideogallery()async{
  file=await pickFile();
  controllervideo=VideoPlayerController.file(file!)
      ..initialize().then((_) {
       controllervideo!.play();
     update();
    });
  update();
 }

addData()async {
    if(formsate.currentState!.validate()){
      if(file==null)return Get.snackbar("تنبيه","من فضلك أضف فيديو");
      Map data={
      
      "letter":letter.text,};
   statusRequest=StatusRequest.loading;
   update();
    var response=await lettersData.addData(data,file!);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
       Get.snackbar("تنبيه", "تم الاضافة بنجاح");
      Get.offAllNamed(RoutesApp.letterspage);
    
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
    }
  }
  @override
  void onInit() {
    
    letter=TextEditingController();
    // lettervideo=TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }

@override
  void dispose() {
    letter.dispose();
    controllervideo!.dispose();
    super.dispose();
  }
}