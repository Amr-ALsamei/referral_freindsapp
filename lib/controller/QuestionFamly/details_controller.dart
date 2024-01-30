
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Model/resultexamFamlymodel.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/services/services.dart';

class FamlyDetailsExamController extends GetxController{

//   QuestionsData questionsData=QuestionsData(Get.find());//Get.find() Takes from initialBinding
//  String? urlvideo;
  List<ResultExamFamlyModel> data=[];
MyServices myServices=Get.find();
 StatusRequest statusRequest=StatusRequest.None;

 
gotoVideoScreen(String videoname){
  Get.toNamed(RoutesApp.famlyresultvideopage,arguments: {
   "name":videoname
  });
}
 


  @override
  void onInit() {
    data=Get.arguments["FamlyModel"];
    super.onInit();
  }

}