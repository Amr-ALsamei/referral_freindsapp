
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Datasource/remote/numbers_data.dart';
import 'package:referral_freindsapp/Data/Model/numbersmodel.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/function/handlingdata.dart';

class NumbersController extends GetxController{

  NumbersData numbersData=NumbersData(Get.find());//Get.find() Takes from initialBinding
 String? urlvideo;
  List<NumbersModel> data=[];

  late StatusRequest statusRequest;
deleteData(String id,String video)async{
  
    statusRequest=StatusRequest.loading;
    update();
    var response=await numbersData.deleteData(id,video);
    statusRequest=handlingData(response);
       print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      data.removeWhere((element) => element.numberId.toString()==id);
       
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
}

goToVideoScreen(String video,String numberid){
  
  Get.toNamed(RoutesApp.numbersvideospage,arguments: {
    "urlvideo":video,
    "numberId":numberid
  });
  update();
}
getData()async{
   data.clear();
    statusRequest=StatusRequest.loading;
    update();
    var response=await numbersData.PostData();
    statusRequest=handlingData(response);
       print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
        List responsebody=response['data'];
        data.addAll(responsebody.map((e) => NumbersModel.fromJson(e)));
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