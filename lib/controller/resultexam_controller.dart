
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Datasource/remote/question_data.dart';
import 'package:referral_freindsapp/Data/Model/resultexammodel.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/function/handlingdata.dart';
import 'package:referral_freindsapp/core/services/services.dart';

class ResultExamController extends GetxController{

  QuestionsData questionsData=QuestionsData(Get.find());//Get.find() Takes from initialBinding
 String? urlvideo;
  List<ResultExamModel> data=[];
MyServices myServices=Get.find();
 StatusRequest statusRequest=StatusRequest.None;

List? responsescore=[];
 int? index;
 int? level1=10;
 int? level2=18;
getResult(String s,String e)async{
  
    statusRequest=StatusRequest.loading;
    update();
    var response=await questionsData.getScoreData(myServices.sharedPref.getString("Id")!,s,e);
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
    update();
  }

getData()async{
   data.clear();
    statusRequest=StatusRequest.loading;
    update();
    var response=await questionsData.getResultexamData(myServices.sharedPref.getString("Id")!);
    statusRequest=handlingData(response);
       print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
        List responsebody=response['data'];
        data.addAll(responsebody.map((e) => ResultExamModel.fromJson(e)));
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
  }
  ////////////////////////////////
  goToDetails(int s,int e){
    List<ResultExamModel> d=[];
    for(int i=s;i<e;i++){
      d.add(data[i]);
    }
  Get.offNamed(RoutesApp.detailspage,arguments: {
    "AnswerModel":d
  });


  }
  
  @override
  void onInit()async {
    responsescore?.clear();
  await  getResult("0", "9");
  await  getResult("8", "20");
  await getResult("19", "29");
    getData();
    super.onInit();
  }
}