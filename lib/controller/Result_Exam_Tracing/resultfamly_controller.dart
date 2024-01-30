
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Datasource/remote/questionFamly_data.dart';
import 'package:referral_freindsapp/Data/Model/resultexamFamlymodel.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/function/handlingdata.dart';
import 'package:referral_freindsapp/core/services/services.dart';

class ResultExamFamlyTracingController extends GetxController{

  QuestionFamlyData questionFamlyData=QuestionFamlyData(Get.find());//Get.find() Takes from initialBinding
 String? urlvideo;
  List<ResultExamFamlyModel> data=[];
MyServices myServices=Get.find();
 StatusRequest statusRequest=StatusRequest.None;
String? childId;
List? responsescore=[];
 int? index;
getResult(String s,String e)async{
    statusRequest=StatusRequest.loading;
    update();
    var response=await questionFamlyData.getChildrenScoreData(childId!,s,e);
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
    var response=await questionFamlyData.getchildrenResultData(childId!);
    statusRequest=handlingData(response);
       print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
        List responsebody=response['data'];
        data.addAll(responsebody.map((e) => ResultExamFamlyModel.fromJson(e)));
        }else{
          statusRequest=StatusRequest.failure;
        }
    }

    update();
  }
  ////////////////////////////////
goToDetails(int s,int e){
    List<ResultExamFamlyModel> d=[];
    for(int i=s;i<e;i++){
      d.add(data[i]);
    }
  Get.offNamed(RoutesApp.famlydetailspage,arguments: {
    "FamlyModel":d
  });


  }
  
  @override
  void onInit()async {
    childId=Get.arguments["ChildId"] ;
    responsescore?.clear();
  await  getResult("0", "7");
  
    getData();
    super.onInit();
  }
}