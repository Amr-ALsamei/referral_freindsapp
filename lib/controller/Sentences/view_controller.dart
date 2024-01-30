
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Datasource/remote/Sentence_data.dart';
import 'package:referral_freindsapp/Data/Model/sentecemodel.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/function/handlingdata.dart';

class SentencesController extends GetxController{

  SentenceData sentenceData=SentenceData(Get.find());//Get.find() Takes from initialBinding

  List<SentenCeModel> data=[];

  late StatusRequest statusRequest;
deleteData(String id,String video)async{
  
    statusRequest=StatusRequest.loading;
    update();
    var response=await sentenceData.deleteData(id,video);
    statusRequest=handlingData(response);
       print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      data.removeWhere((element) => element.sentenceId.toString()==id);
       
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
}

goToVideoScreen(String url,String sentenceid){
  
  Get.toNamed(RoutesApp.sentencevideopage,arguments: {
    "urlvideo":url,
    "sentenceId":sentenceid
  });
  update();
}
getData()async{
   data.clear();
    statusRequest=StatusRequest.loading;
    update();
    var response=await sentenceData.PostData();
    statusRequest=handlingData(response);
       print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
        List responsebody=response['data'];
        data.addAll(responsebody.map((e) => SentenCeModel.fromJson(e)));
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