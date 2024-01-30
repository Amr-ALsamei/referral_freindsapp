
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Datasource/remote/Words_data.dart';
import 'package:referral_freindsapp/Data/Model/wordsmodel.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/function/handlingdata.dart';

class WordsController extends GetxController{

  WordsData wordsData=WordsData(Get.find());//Get.find() Takes from initialBinding

  List<WordsModel> data=[];

  late StatusRequest statusRequest;
deleteData(String id,String video)async{
  
    statusRequest=StatusRequest.loading;
    update();
    var response=await wordsData.deleteData(id,video);
    statusRequest=handlingData(response);
       print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      data.removeWhere((element) => element.wordId.toString()==id);
       
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
}

goToVideoScreen(String url,String wordid){
  
  Get.toNamed(RoutesApp.wordsvideopage,arguments: {
    "urlvideo":url,
    "wordId":wordid
  });
  update();
}

getData()async{
   data.clear();
    statusRequest=StatusRequest.loading;
    update();
    var response=await wordsData.PostData();
    statusRequest=handlingData(response);
       print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
        List responsebody=response['data'];
        data.addAll(responsebody.map((e) => WordsModel.fromJson(e)));
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