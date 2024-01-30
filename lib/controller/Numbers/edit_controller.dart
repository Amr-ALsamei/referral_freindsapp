
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Datasource/remote/numbers_data.dart';
import 'package:referral_freindsapp/Data/Model/numbersmodel.dart';
import 'package:referral_freindsapp/controller/Numbers/view_controller.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/function/handlingdata.dart';
import 'package:referral_freindsapp/core/function/uploadvideo.dart';
import 'package:video_player/video_player.dart';
class NumbersEditController extends GetxController{

 
 StatusRequest statusRequest=StatusRequest.None;
 NumbersData numbersData=NumbersData(Get.find());
 
 
 late TextEditingController number;
 late String oldvideo;
 VideoPlayerController? controllervideo;
 GlobalKey<FormState> formsate=GlobalKey<FormState>();
 String? numberid;
 NumbersModel? numbersModel;
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
      
      "number":number.text,
      "numberId":numberid,
      "numbervideo":oldvideo};
      
   statusRequest=StatusRequest.loading;
   update();
    var response=await numbersData.editData(data,file);
    // var response=await carsData.editCarsData(data);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      Get.toNamed(RoutesApp.numberspage);
      NumbersController c=Get.find();
      c.getData();
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
    }
  }
  @override
  void onInit() {
    numbersModel=Get.arguments["NumberModel"];
    
    number=TextEditingController();
    //////////////////////////////
    oldvideo=numbersModel!.numberVideo!;
    number.text=numbersModel!.numberName!;
    numberid=numbersModel!.numberId.toString();
  
    // TODO: implement onInit
    super.onInit();
  }

 @override
  void dispose() {
    number.dispose();
    controllervideo!.dispose();
    super.dispose();
  }
}