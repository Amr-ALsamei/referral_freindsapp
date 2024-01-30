
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Datasource/remote/tarceMain_data.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/function/handlingdata.dart';
import 'package:referral_freindsapp/core/services/services.dart';

class TraceMainController extends GetxController{

 TraceMainData traceMainData=TraceMainData(Get.find());//Get.find() Takes from initialBinding
 MyServices myServices=Get.find();
  List data=[];

   StatusRequest statusRequest=StatusRequest.None;

getchildrenInfo()async{
     data.clear();
     statusRequest=StatusRequest.loading;
    update();
    var response=await traceMainData.getchildrenData(myServices.sharedPref.getString("Id")!);
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

gotowatchedContains(String childId){
  Get.toNamed(RoutesApp.tracechildrenpage,arguments: {
    "childId":childId
  });
}


deletechild(String childid)async{
  statusRequest=StatusRequest.loading;
    update();
    var response=await traceMainData.deletechildrenData(childid);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
        data.removeWhere((element) => element["chidlren_Id"].toString()==childid);
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();


}
  @override
  void onInit() {
    getchildrenInfo();
    super.onInit();
  }

}