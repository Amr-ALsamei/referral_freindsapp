
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Datasource/remote/Sentence_data.dart';
import 'package:referral_freindsapp/Data/Model/sentecemodel.dart';
import 'package:referral_freindsapp/controller/Sentences/view_controller.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/function/handlingdata.dart';
import 'package:referral_freindsapp/core/function/uploadvideo.dart';
import 'package:video_player/video_player.dart';
class SentenceEditController extends GetxController{

 
 StatusRequest statusRequest=StatusRequest.None;
 SentenceData sentenceData=SentenceData(Get.find());
 
 
 late TextEditingController sentence;
 late String oldvideo;
 GlobalKey<FormState> formsate=GlobalKey<FormState>();
 String? sentenceid;
 SentenCeModel? sentenCeModel;

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
editData()async {
    if(formsate.currentState!.validate()){
      
      Map data={
      
      "sentence":sentence.text,
      "sentenceId":sentenceid,
      "sentencevideo":oldvideo};
      
   statusRequest=StatusRequest.loading;
   update();
    var response=await sentenceData.editData(data,file);
    // var response=await carsData.editCarsData(data);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      SentencesController c=Get.find();
      c.getData();
      Get.snackbar("تنبيه", "تم التعديل بنجاح");
      Get.offNamed(RoutesApp.sentencespage);
      
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
    }
  }
  @override
  void onInit() {
    sentenCeModel=Get.arguments["SentenceModel"];
    
    sentence=TextEditingController();
    
    //////////////////////////////
    sentence.text=sentenCeModel!.sentenceBody!;
    sentenceid=sentenCeModel!.sentenceId.toString();
   oldvideo=sentenCeModel!.sentenceVideo!;
  
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