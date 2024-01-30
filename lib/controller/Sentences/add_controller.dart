
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Datasource/remote/Sentence_data.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/function/handlingdata.dart';
import 'package:referral_freindsapp/core/function/uploadvideo.dart';
import 'package:video_player/video_player.dart';

class SentencesAddController extends GetxController{

 
 StatusRequest statusRequest=StatusRequest.None;
 SentenceData sentenceData=SentenceData(Get.find());
 
 late TextEditingController sentence;
//  late TextEditingController url;
 
 
 GlobalKey<FormState> formsate=GlobalKey<FormState>();
 VideoPlayerController? controllervideo;
 File? file;
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
      
      "sentence":sentence.text,};
   statusRequest=StatusRequest.loading;
   update();
    var response=await sentenceData.addData(data,file!);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      Get.offAllNamed(RoutesApp.sentencespage);
      Get.snackbar("تنبيه", "تم الاضافة بنجاح");
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
    }
  }
  @override
  void onInit() {
    
    sentence=TextEditingController();
    // url=TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }

@override
  void dispose() {
    sentence.dispose();
    controllervideo!.dispose();
    super.dispose();
  }
}