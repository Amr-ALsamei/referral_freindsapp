
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Datasource/remote/Letters_data.dart';
import 'package:referral_freindsapp/Data/Model/watchingmodel.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/function/handlingdata.dart';
import 'package:referral_freindsapp/core/services/services.dart';

class TraceChildrenController extends GetxController{

  LettersData lettersData=LettersData(Get.find());//Get.find() Takes from initialBinding
 String? urlvideo;
  List<WatchingModel> data=[];
MyServices myServices=Get.find();
  late StatusRequest statusRequest;
String? childId;
// deleteData(String id)async{
  
//     statusRequest=StatusRequest.loading;
//     update();
//     var response=await lettersData.deleteData(id);
//     statusRequest=handlingData(response);
//        print(response);
//     if(StatusRequest.success==statusRequest){
//      if(response['status']=="success") {
//       data.removeWhere((element) => element.letterId.toString()==id);
       
//         }else{
//           statusRequest=StatusRequest.failure;
//         }
//     }
//     update();
// }

goToVideoScreen(String url,String letterid){
  
  Get.toNamed(RoutesApp.videostracepage,arguments: {
    "urlvideo":url,
    "letterId":letterid
  });
  update();
}
getData()async{
   data.clear();
    statusRequest=StatusRequest.loading;
    update();
    var response=await lettersData.viewWatchingData(myServices.sharedPref.getString("Id")!,childId!);
    statusRequest=handlingData(response);
       print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
        List responsebody=response['data'];
        data.addAll(responsebody.map((e) => WatchingModel.fromJson(e)));
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
  }
  @override
  void onInit() {
    childId=Get.arguments["childId"];
    getData();
    super.onInit();
  }
}