
import 'package:get/get.dart';
import 'package:referral_freindsapp/linkAPI.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoTraceController extends GetxController{
   late String title ,author ;
  late bool isPlaying, isMute;
  // final String url = "https://youtu.be/4tKGwFi76_0?si=eHTjwm36NhladY9w";
   String? videoname;
  late YoutubePlayer youtubePlayer;
   VideoPlayerController? controllervideo;
  late String id;
  String? letterid;
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
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controllervideo!.dispose();
  }
}