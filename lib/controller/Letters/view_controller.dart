
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Datasource/remote/Letters_data.dart';
import 'package:referral_freindsapp/Data/Model/lettersvideomodel.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/function/handlingdata.dart';

class LettersController extends GetxController{

  LettersData lettersData=LettersData(Get.find());//Get.find() Takes from initialBinding
 String? urlvideo;
  List<LetterVideoModel> data=[];

  late StatusRequest statusRequest;
deleteData(String id,String video)async{
  
    statusRequest=StatusRequest.loading;
    update();
    var response=await lettersData.deleteData(id,video);
    statusRequest=handlingData(response);
       print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      data.removeWhere((element) => element.letterId.toString()==id);
       
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
}

goToVideoScreen(String url,String letterid){
  
  Get.toNamed(RoutesApp.videospage,arguments: {
    "urlvideo":url,
    "letterId":letterid
  });
  update();
}
getData()async{
   data.clear();
    statusRequest=StatusRequest.loading;
    update();
    var response=await lettersData.PostData();
    statusRequest=handlingData(response);
       print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
        List responsebody=response['data'];
        data.addAll(responsebody.map((e) => LetterVideoModel.fromJson(e)));
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