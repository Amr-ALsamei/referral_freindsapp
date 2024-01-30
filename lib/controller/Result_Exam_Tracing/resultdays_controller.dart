
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Datasource/remote/questionDays_data.dart';
import 'package:referral_freindsapp/Data/Model/resultexamDaysmodel.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/function/handlingdata.dart';
import 'package:referral_freindsapp/core/services/services.dart';

class ResultExamDaysTracingController extends GetxController{

  QuestionDaysData questionDaysData=QuestionDaysData(Get.find());//Get.find() Takes from initialBinding
 String? urlvideo;
  List<ResultExamDaysModel> data=[];
MyServices myServices=Get.find();
String? childId;
 StatusRequest statusRequest=StatusRequest.None;

List? responsescore=[];
 int? index;
getResult(String s,String e)async{
    statusRequest=StatusRequest.loading;
    update();
    var response=await questionDaysData.getChildrenScoreData(childId!,s,e);
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
    var response=await questionDaysData.getchildrenResultData(childId!);
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
    childId=Get.arguments["ChildId"] ;
    responsescore?.clear();
  await  getResult("0", "8");
  
    getData();
    super.onInit();
  }
}