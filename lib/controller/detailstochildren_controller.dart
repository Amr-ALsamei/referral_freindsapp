
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Model/childrenresultmodel.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/services/services.dart';

class ChildrenDetailsExamController extends GetxController{

//   QuestionsData questionsData=QuestionsData(Get.find());//Get.find() Takes from initialBinding
//  String? urlvideo;
  List<ChildrenResultModel> data=[];
MyServices myServices=Get.find();
 StatusRequest statusRequest=StatusRequest.None;

 int? level1=10;
 int? level2=18;

  
  @override
  void onInit() {
    data=Get.arguments["AnswerModel"];
    super.onInit();
  }
}