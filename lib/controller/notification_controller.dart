
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Datasource/remote/Notification_data.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/function/handlingdata.dart';
import 'package:referral_freindsapp/core/services/services.dart';

class NotificationController extends GetxController{

 NotificationData notificationData=NotificationData(Get.find());//Get.find() Takes from initialBinding
 MyServices myServices=Get.find();
  List data=[];

   StatusRequest statusRequest=StatusRequest.None;

getnotifications()async{
  data.clear();
    if(myServices.sharedPref.getString("usertype")=="children"){
     statusRequest=StatusRequest.loading;
    update();
    var response=await notificationData.getNotificationchildrenData(myServices.sharedPref.getString("Id")!);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
        data.addAll(response['data']);
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
    }else{
      statusRequest=StatusRequest.loading;
    update();
    var response=await notificationData.getNotificationData(myServices.sharedPref.getString("Id")!);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
        data.addAll(response['data']);
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
    }
    
  }
  @override
  void onInit() {
    getnotifications();
    super.onInit();
  }

}