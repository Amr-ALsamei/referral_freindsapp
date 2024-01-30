
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Datasource/remote/Letters_data.dart';
import 'package:referral_freindsapp/Data/Model/lettersvideomodel.dart';
import 'package:referral_freindsapp/controller/Letters/view_controller.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/function/handlingdata.dart';
import 'package:referral_freindsapp/core/function/uploadvideo.dart';
import 'package:video_player/video_player.dart';
class LettersEditController extends GetxController{

 
 StatusRequest statusRequest=StatusRequest.None;
 LettersData lettersData=LettersData(Get.find());
 
 
 late TextEditingController letter;
 late String oldvideo;
 VideoPlayerController? controllervideo;
 GlobalKey<FormState> formsate=GlobalKey<FormState>();
 String? letterid;
 LetterVideoModel? lettersModel;
File? file;

chooseVideogallery()async{
  file=await pickFile();
  controllervideo=VideoPlayerController.file(file!)
      ..initialize().then((_) {
       controllervideo!.play();
     update();
    });
  update();
 }
editData()async {
    if(formsate.currentState!.validate()){
      
      Map data={
      
      "letter":letter.text,
      "letterId":letterid,
      "lettervideo":oldvideo};
      
   statusRequest=StatusRequest.loading;
   update();
    var response=await lettersData.editData(data,file);
    // var response=await carsData.editCarsData(data);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      LettersController c=Get.find();
      c.getData();
       Get.snackbar("تنبيه", "تم التعديل بنجاح");
      Get.toNamed(RoutesApp.letterspage);
      
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
    }
  }
  @override
  void onInit() {
    lettersModel=Get.arguments["LetterModel"];
    
    letter=TextEditingController();
    //////////////////////////////
    oldvideo=lettersModel!.letterVideo!;
    letter.text=lettersModel!.letterName!;
    letterid=lettersModel!.letterId.toString();
  
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