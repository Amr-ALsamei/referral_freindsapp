
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Model/resultexamDaysmodel.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/services/services.dart';

class DaysDetailsExamController extends GetxController{

//   QuestionsData questionsData=QuestionsData(Get.find());//Get.find() Takes from initialBinding
//  String? urlvideo;
  List<ResultExamDaysModel> data=[];
MyServices myServices=Get.find();
 StatusRequest statusRequest=StatusRequest.None;

 
gotoVideoScreen(String videoname){
  Get.toNamed(RoutesApp.daysresultvideopage,arguments: {
   "Dayname":videoname
  });
}
 


  @override
  void onInit() {
    data=Get.arguments["DaysModel"];
    super.onInit();
  }

}