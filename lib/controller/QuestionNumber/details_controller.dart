
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Model/resultexammodel.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/services/services.dart';

class NumbersDetailsExamController extends GetxController{

//   QuestionsData questionsData=QuestionsData(Get.find());//Get.find() Takes from initialBinding
//  String? urlvideo;
  List<ResultExamModel> data=[];
MyServices myServices=Get.find();
 StatusRequest statusRequest=StatusRequest.None;

 

 


  @override
  void onInit() {
    data=Get.arguments["NumbersModel"];
    super.onInit();
  }

}