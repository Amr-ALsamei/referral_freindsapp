
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Datasource/remote/questionDays_data.dart';
import 'package:referral_freindsapp/Data/Model/resultexamDaysmodel.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/function/handlingdata.dart';
import 'package:referral_freindsapp/core/services/services.dart';

class ResultExamDaysController extends GetxController{

  QuestionDaysData questionDaysData=QuestionDaysData(Get.find());//Get.find() Takes from initialBinding
 String? urlvideo;
  List<ResultExamDaysModel> data=[];
MyServices myServices=Get.find();
 StatusRequest statusRequest=StatusRequest.None;

List? responsescore=[];
 int? index;
getResult(String s,String e)async{
  if(myServices.sharedPref.getString("usertype")=="children"){
    statusRequest=StatusRequest.loading;
    update();
    var response=await questionDaysData.getChildrenScoreData(myServices.sharedPref.getString("Id")!,s,e);
    statusRequest=handlingData(response);
       print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
         responsescore?.add(response['data']);
        print(responsescore);
        }else{
          // statusRequest=StatusRequest.success;
        }
    }

  }else{
    statusRequest=StatusRequest.loading;
    update();
    var response=await questionDaysData.getScoreData(myServices.sharedPref.getString("Id")!,s,e);
    statusRequest=handlingData(response);
       print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
         responsescore?.add(response['data']);
        print(responsescore);
        }else{
          // statusRequest=StatusRequest.success;
        }
    }
  }
    
    update();
  }

getData()async{
   data.clear();
    if(myServices.sharedPref.getString("usertype")=="children"){
      statusRequest=StatusRequest.loading;
    update();
    var response=await questionDaysData.getchildrenResultData(myServices.sharedPref.getString("Id")!);
    statusRequest=handlingData(response);
       print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
        List responsebody=response['data'];
        data.addAll(responsebody.map((e) => ResultExamDaysModel.fromJson(e)));
        }else{
          statusRequest=StatusRequest.failure;
        }
    }

    }else{
      statusRequest=StatusRequest.loading;
    update();
    var response=await questionDaysData.getResultexamData(myServices.sharedPref.getString("Id")!);
    statusRequest=handlingData(response);
       print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
        List responsebody=response['data'];
        data.addAll(responsebody.map((e) => ResultExamDaysModel.fromJson(e)));
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    }
    update();
  }
  ////////////////////////////////
goToDetails(int s,int e){
    List<ResultExamDaysModel> d=[];
    for(int i=s;i<e;i++){
      d.add(data[i]);
    }
  Get.offNamed(RoutesApp.daysdetailspage,arguments: {
    "DaysModel":d
  });


  }
  
  @override
  void onInit()async {
    responsescore?.clear();
  await  getResult("0", "8");
  
    getData();
    super.onInit();
  }
}