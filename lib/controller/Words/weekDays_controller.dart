
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Datasource/remote/weekDays_data.dart';
import 'package:referral_freindsapp/Data/Model/weekwordmodel.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/function/handlingdata.dart';

class WeekWordsController extends GetxController{

  WeekWordsData weekWordsData=WeekWordsData(Get.find());//Get.find() Takes from initialBinding

  List<WeekWordModel> data=[];

  late StatusRequest statusRequest;


goToVideoScreen(String url,String wordid){
  
  Get.toNamed(RoutesApp.weekwordsvideopage,arguments: {
    "video":url,
    "Id":wordid
  });
  update();
}

getData()async{
   data.clear();
    statusRequest=StatusRequest.loading;
    update();
    var response=await weekWordsData.PostData();
    statusRequest=handlingData(response);
       print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
        List responsebody=response['data'];
        data.addAll(responsebody.map((e) => WeekWordModel.fromJson(e)));
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
  }
  @override
  void onInit() {
    getData();
    super.onInit();
  }
}