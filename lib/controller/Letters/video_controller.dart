
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Datasource/remote/Letters_data.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/function/handlingdata.dart';
import 'package:referral_freindsapp/core/services/services.dart';
import 'package:referral_freindsapp/linkAPI.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController{
   late String title ,author ;
  late bool isPlaying, isMute;
  // final String url = "https://youtu.be/4tKGwFi76_0?si=eHTjwm36NhladY9w";
   String? videoname;
  // late YoutubePlayer youtubePlayer;
  VideoPlayerController? controllervideo;
  late String id;
  String? letterid;
  MyServices myServices=Get.find();
  LettersData lettersData=LettersData(Get.find());
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
      "letterId":letterid};
   
    var response=await lettersData.addFavoriteData(data);
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
      "letterId":letterid};
   
    var response=await lettersData.addWatchingData(data);
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
    letterid=Get.arguments["letterId"];
    isMute = false;
    controllervideo= VideoPlayerController.network("${AppLinks.videostatic}/$videoname")
      ..initialize().then((value) {
            update();
      });
     isPlaying =controllervideo!.value.isPlaying;
 
  
    // id = YoutubePlayer.convertUrlToId(url!)!;
    // controllervideo= YoutubePlayerController(initialVideoId: id,
    // flags: YoutubePlayerFlags(autoPlay: true),);
    // youtubePlayer= YoutubePlayer(controller: controllervideo,);
    
   
    // title = controllervideo.metadata.title;
    // author= controllervideo.metadata.author;

    checkWatching();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controllervideo!.dispose();
    super.dispose();
    
  }
}