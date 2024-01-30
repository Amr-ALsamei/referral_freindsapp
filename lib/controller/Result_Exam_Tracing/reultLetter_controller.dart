
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Datasource/remote/question_data.dart';
import 'package:referral_freindsapp/Data/Model/childrenresultmodel.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/function/handlingdata.dart';
import 'package:referral_freindsapp/core/services/services.dart';

class ChildrenResultLetterController extends GetxController{

  QuestionsData questionsData=QuestionsData(Get.find());//Get.find() Takes from initialBinding
 String? urlvideo;
  List<ChildrenResultModel> data=[];
MyServices myServices=Get.find();
 StatusRequest statusRequest=StatusRequest.None;

List? responsescore=[];
 int? index;
 int? level1=10;
 int? level2=18;
 String? childId;
getResult(String s,String e)async{
  
    statusRequest=StatusRequest.loading;
    update();
    var response=await questionsData.getChildrenScoreData(childId!,s,e);
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
    var response=await questionsData.getchildrenResultData(childId!);
    statusRequest=handlingData(response);
       print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
        List responsebody=response['data'];
        data.addAll(responsebody.map((e) => ChildrenResultModel.fromJson(e)));
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
  }
  ////////////////////////////////
  goToDetails(int s,int e){
    List<ChildrenResultModel> d=[];
    for(int i=s;i<e;i++){
      d.add(data[i]);
    }
  Get.offNamed(RoutesApp.childrendetailspage,arguments: {
    "AnswerModel":d
  });


  }
  
  @override
  void onInit()async {
  childId=Get.arguments["ChildId"] ;
  print("Thi child Id $childId");
  responsescore?.clear();
  await  getResult("0", "9");
  await  getResult("8", "20");
  await getResult("19", "29");
    getData();
    super.onInit();
  }
}