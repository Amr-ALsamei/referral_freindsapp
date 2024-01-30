
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Datasource/remote/famlyWords_data.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/function/handlingdata.dart';
import 'package:referral_freindsapp/core/services/services.dart';
import 'package:video_player/video_player.dart';

class FamlyWordsVideoController extends GetxController{
   late String title ,author ;
  late bool isPlaying, isMute;
  final String famlydayvideo="assets/FamlyVideo";
  String? v;
  // final String url = "https://youtu.be/4tKGwFi76_0?si=eHTjwm36NhladY9w";
   String? videoname;
  VideoPlayerController? controllervideo;
  late String id;
  String? wordid;
  MyServices myServices=Get.find();
  FamlyWordsData famlyWordsData=FamlyWordsData(Get.find());
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
 /////////////////////
  checkFavorite()async{
   if(myServices.sharedPref.getString("usertype")=="children"){
     Map data={
      
      "childId":myServices.sharedPref.getString("Id"),
      "wordId":wordid};
   
    var response=await famlyWordsData.addFavoriteData(data);
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
 /////////////////////////////
 checkWatching()async{
   if(myServices.sharedPref.getString("usertype")=="children"){
     Map data={
      
      "childId":myServices.sharedPref.getString("Id"),
      "wordid":wordid};
   
    var response=await famlyWordsData.addWatchingData(data);
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
    videoname=Get.arguments["video"];
    wordid=Get.arguments["Id"];
    
    isMute = false;

    isMute = false;
    controllervideo= VideoPlayerController.asset("$famlydayvideo/$videoname")
      ..initialize().then((value) {
        // controllervideo!.play();
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