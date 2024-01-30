
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Datasource/remote/questionNumber_data.dart';
import 'package:referral_freindsapp/Data/Model/questionNumbermodel.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/function/handlingdata.dart';
import 'package:referral_freindsapp/core/services/services.dart';

class QuestionNumbersController extends GetxController{

QuestionNumbersData questionNumbersData=QuestionNumbersData(Get.find());//Get.find() Takes from initialBinding
 MyServices myServices=Get.find();
  List<QuestionNumbersModel> data=[];
 
  String? responsescore;
 int? index;
  late StatusRequest statusRequest;

checkChoose(int i,int score){
   if(i< data.length){
        index=i+1 ;
      addAnswer(data[i].questionId.toString(),score);
      
    }

   
    if(index== data.length){
      Future.delayed(const Duration(seconds: 1),(){
        getScore("0",(data.length+1).toString());
      });
      
    }
  
   update();
}

getData()async{
   data.clear();
    statusRequest=StatusRequest.loading;
    update();
    var response=await questionNumbersData.PostData();
    statusRequest=handlingData(response);
       print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
        List responsebody=response['data'];
        data.addAll(responsebody.map((e) => QuestionNumbersModel.fromJson(e)));
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
  }

refreshIndex(){
  index=0;
  update();
}






addAnswer(String id,int s)async {
   statusRequest=StatusRequest.loading;
  //  update();
  print( myServices.sharedPref.getString("Id")!);
  if(myServices.sharedPref.getString("usertype")=="children"){
     var response=await questionNumbersData.addChildrenAnswerData(
      myServices.sharedPref.getString("Id")!,id,s);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
    
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
  }else{
    var response=await questionNumbersData.addAnswerData(
      myServices.sharedPref.getString("Id")!,id,s);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
    
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
  }
    
    update();
    
  }

getScore(String s,String e)async{
  
    statusRequest=StatusRequest.loading;
    // update();
    if(myServices.sharedPref.getString("usertype")=="children"){
         
    var response=await questionNumbersData.getChildrenScoreData(myServices.sharedPref.getString("Id")!,s,e);
     statusRequest=handlingData(response);
       print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
         responsescore=response['data'];
        print(responsescore);
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    }else{
      var response=await questionNumbersData.getScoreData(myServices.sharedPref.getString("Id")!,s,e);
     statusRequest=handlingData(response);
       print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
         responsescore=response['data'];
        print(responsescore);
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    }
    
    update();
  }

///////////////////////////////////////////
getResult(String s,String e)async{
  
    statusRequest=StatusRequest.loading;
    // update();
    var response=await questionNumbersData.getScoreData(myServices.sharedPref.getString("Id")!,s,e);
    statusRequest=handlingData(response);
       print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
         responsescore=response['data'];
        print(responsescore);
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
  }
////////////////////////////////////////////

  @override
  void onInit()async {
    index=0;
  await getData();
 
     
    super.onInit();
  }

}