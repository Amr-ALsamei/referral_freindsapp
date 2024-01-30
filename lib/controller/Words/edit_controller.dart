
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Datasource/remote/Words_data.dart';
import 'package:referral_freindsapp/Data/Model/wordsmodel.dart';
import 'package:referral_freindsapp/controller/Words/view_controller.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/function/handlingdata.dart';
import 'package:referral_freindsapp/core/function/uploadvideo.dart';
import 'package:video_player/video_player.dart';
class WordsEditController extends GetxController{

 
 StatusRequest statusRequest=StatusRequest.None;
 WordsData wordsData=WordsData(Get.find());
 
 
 late TextEditingController word;
 late String oldvideo;
 GlobalKey<FormState> formsate=GlobalKey<FormState>();
 String? wordid;
 WordsModel? wordsModel;

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
      
      "word":word.text,
      "wordId":wordid,
      "wordvideo":oldvideo};
      
   statusRequest=StatusRequest.loading;
   update();
    var response=await wordsData.editData(data,file);
    // var response=await carsData.editCarsData(data);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      WordsController c=Get.find();
      c.getData();
      Get.snackbar("تنبيه", "تم التعديل بنجاح");
      Get.offNamed(RoutesApp.wordsspage);
      
      
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
    }
  }
  @override
  void onInit() {
    wordsModel=Get.arguments["WordModel"];
    
    word=TextEditingController();

    //////////////////////////////
    word.text=wordsModel!.wordBody!;
    oldvideo=wordsModel!.wordVideo!;
    wordid=wordsModel!.wordId.toString();
  
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