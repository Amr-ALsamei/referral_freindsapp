
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Datasource/remote/Words_data.dart';
import 'package:referral_freindsapp/Data/Model/wordsmodel.dart';
import 'package:referral_freindsapp/controller/Words/view_controller.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/function/handlingdata.dart';
class WordsEditController extends GetxController{

 
 StatusRequest statusRequest=StatusRequest.None;
 WordsData wordsData=WordsData(Get.find());
 
 
 late TextEditingController word;
 GlobalKey<FormState> formsate=GlobalKey<FormState>();
 String? wordid;
 WordsModel? wordsModel;

editData()async {
    if(formsate.currentState!.validate()){
      
      Map data={
      
      "word":word.text,
      "wordId":wordid};
      
   statusRequest=StatusRequest.loading;
   update();
    var response=await wordsData.editData(data);
    // var response=await carsData.editCarsData(data);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      Get.offNamed(RoutesApp.homepage);
      WordsController c=Get.find();
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
    wordsModel=Get.arguments["WordModel"];
    
    word=TextEditingController();
    //////////////////////////////
    word.text=wordsModel!.wordBody!;
    wordid=wordsModel!.wordId.toString();
  
    // TODO: implement onInit
    super.onInit();
  }
}