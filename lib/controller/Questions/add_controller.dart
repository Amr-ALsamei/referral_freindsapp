
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:referral_freindsapp/Data/Datasource/remote/Words_data.dart';
// import 'package:referral_freindsapp/core/class/statusrequest.dart';
// import 'package:referral_freindsapp/core/constant/routesName.dart';
// import 'package:referral_freindsapp/core/function/handlingdata.dart';

// class WordsAddController extends GetxController{

 
//  StatusRequest statusRequest=StatusRequest.None;
//  WordsData wordsData=WordsData(Get.find());
 
//  late TextEditingController word;
 
//  GlobalKey<FormState> formsate=GlobalKey<FormState>();
 



// addData()async {
//     if(formsate.currentState!.validate()){
      
//       Map data={
      
//       "word":word.text,};
//    statusRequest=StatusRequest.loading;
//    update();
//     var response=await wordsData.addData(data);
//     statusRequest=handlingData(response);
//     print(response);
//     if(StatusRequest.success==statusRequest){
//      if(response['status']=="success") {
//       Get.offAllNamed(RoutesApp.homepage);
    
//         }else{
//           statusRequest=StatusRequest.failure;
//         }
//     }
//     update();
//     }
//   }
//   @override
//   void onInit() {
    
//     word=TextEditingController();
//     // TODO: implement onInit
//     super.onInit();
//   }
// }