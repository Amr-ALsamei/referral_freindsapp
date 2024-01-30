
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Datasource/remote/numbers_data.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/function/handlingdata.dart';
import 'package:referral_freindsapp/core/services/services.dart';
import 'package:referral_freindsapp/linkAPI.dart';
import 'package:video_player/video_player.dart';

class NumbersVideoController extends GetxController{
   late String title ,author ;
  late bool isPlaying, isMute;
  // final String url = "https://youtu.be/4tKGwFi76_0?si=eHTjwm36NhladY9w";
   String? videoname;
   VideoPlayerController? controllervideo;
  late String id;
  String? numberid;
  MyServices myServices=Get.find();
  NumbersData numbersData=NumbersData(Get.find());
  StatusRequest statusRequest=StatusRequest.success;
/////////////////////////////////////////////////
 refreshMutevalue(){
  
   controllervideo!.setVolume(isMute?1:0);
     isMute= !isMute;
     update();
        
 }
 refresshValue(){
   if(controllervideo!.value.isPlaying)
            {
          controllervideo!.pause();
          }
      else{
      controllervideo!.play();
         }
            
      isPlaying= !isPlaying;
            update();
 }
 /////////////////////
 checkFavorite()async{
   if(myServices.sharedPref.getString("usertype")=="children"){
     Map data={
      
      "childId":myServices.sharedPref.getString("Id"),
      "numberId":numberid};
   
    var response=await numbersData.addFavoriteData(data);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      Get.snackbar("تنبيه", "تم الاضافة الى المفضلة بنجاح");
    
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();

   }
 }
 
 checkWatching()async{
   if(myServices.sharedPref.getString("usertype")=="children"){
     Map data={
      
      "childId":myServices.sharedPref.getString("Id"),
      "numberId":numberid};
   
    var response=await numbersData.addWatchingData(data);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
      // Get.offAllNamed(RoutesApp.letterspage);
    
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();

   }
 }
 /////////////////////////////////
 @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    videoname=Get.arguments["urlvideo"];
    numberid=Get.arguments["numberId"];
    isMute = false;
    controllervideo= VideoPlayerController.network("${AppLinks.videostatic}/$videoname")
      ..initialize().then((value) {
            update();
      });
     isPlaying =controllervideo!.value.isPlaying;

    checkWatching();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controllervideo!.dispose();
    super.dispose();
    
  }
}