
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Datasource/remote/Words_data.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/function/handlingdata.dart';
import 'package:referral_freindsapp/core/function/uploadvideo.dart';
import 'package:video_player/video_player.dart';

class WordsAddController extends GetxController{

 
 StatusRequest statusRequest=StatusRequest.None;
 WordsData wordsData=WordsData(Get.find());
 
 late TextEditingController word;
 
 
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
      
      "word":word.text,};
   statusRequest=StatusRequest.loading;
   update();
    var response=await wordsData.addData(data,file!);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      Get.snackbar("تنبيه", "تم الاضافة بنجاح");
      Get.offAllNamed(RoutesApp.wordsspage);
    
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
    }
  }
  @override
  void onInit() {
    
    word=TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }

@override
  void dispose() {
    word.dispose();
    controllervideo!.dispose();
    super.dispose();
  }
}