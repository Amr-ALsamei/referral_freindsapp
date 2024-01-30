
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Model/resultexamSentencemodel.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/services/services.dart';

class SentencesDetailsExamController extends GetxController{

//   QuestionsData questionsData=QuestionsData(Get.find());//Get.find() Takes from initialBinding
//  String? urlvideo;
  List<ResultExamSentenceModel> data=[];
MyServices myServices=Get.find();
 StatusRequest statusRequest=StatusRequest.None;

 
gotoVideoScreen(String videoname){
  Get.toNamed(RoutesApp.sentenceresultvideopage,arguments: {
   "videoname":videoname
  });
}
 


  @override
  void onInit() {
    data=Get.arguments["AnswerModel"];
    super.onInit();
  }

}