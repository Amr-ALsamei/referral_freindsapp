
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Datasource/remote/question_data.dart';
import 'package:referral_freindsapp/Data/Model/questionmodel.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/function/handlingdata.dart';
import 'package:referral_freindsapp/core/services/services.dart';

class QuestionsController extends GetxController{

QuestionsData questionsData=QuestionsData(Get.find());//Get.find() Takes from initialBinding
 MyServices myServices=Get.find();
  List<QuestionModel> data=[];
 
  String? responsescore;
 int? index;
 int? level1=8;
 int? level2=19;
  late StatusRequest statusRequest;
deleteData(String id)async{
  
    statusRequest=StatusRequest.loading;
    update();
    var response=await questionsData.deleteData(id);
    statusRequest=handlingData(response);
       print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      data.removeWhere((element) => element.questionId.toString()==id);
       
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
}
getData()async{
   data.clear();
    statusRequest=StatusRequest.loading;
    update();
    var response=await questionsData.PostData();
    statusRequest=handlingData(response);
       print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
        List responsebody=response['data'];
        data.addAll(responsebody.map((e) => QuestionModel.fromJson(e)));
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

refreshIndex2(){
  index=8;
  update();
}

refreshIndex3(){
  index=19;
  update();
}

checkChoose(int i,int score){
    if(i< data.length){
      if(i==level1){
        level1=level1!- 1;
      
      }else if(i==level2){
        level2=level2!-1;
      }else{
        index=i+1 ;
      addAnswer(data[i].questionId.toString(),score);
      }
    }

    if(index==level1){
     int le=level1!;
     le=le+2;
      Future.delayed(const Duration(seconds: 1),(){
          getScore("0",le.toString());
      });
    }
    if(index==level2){
      int le2=level2!;
      le2=le2+1;
      Future.delayed(const Duration(seconds: 1),(){
         getScore((level1!+1).toString(),le2.toString());
      });
    }

    if(index== data.length){
      Future.delayed(const Duration(seconds: 1),(){
       getScore((level2!+1).toString(),(data.length+1).toString());
      });
    }
  
  // print(score);
  // print(index);
   update();
}

addAnswer(String id,int s)async {
   statusRequest=StatusRequest.loading;
  //  update();
  print( myServices.sharedPref.getString("Id")!);
    var response=await questionsData.addAnswerData(
      myServices.sharedPref.getString("Id")!,id,s);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      // Get.offAllNamed(RoutesApp.homepage);
    
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
    
  }

getScore(String s,String e)async{
  
    statusRequest=StatusRequest.loading;
    // update();
    var response=await questionsData.getScoreData(myServices.sharedPref.getString("Id")!,s,e);
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

///////////////////////////////////////////
getResult(String s,String e)async{
  
    statusRequest=StatusRequest.loading;
    // update();
    var response=await questionsData.getScoreData(myServices.sharedPref.getString("Id")!,s,e);
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
  void onInit() {
    index=0;
    getData();
    super.onInit();
  }
}