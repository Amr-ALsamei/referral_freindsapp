
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoSentencesController extends GetxController{
  late String title ,author ;
  late bool isPlaying;
  final String questionvideo="assets/questionVideo";
  // final String url = "https://youtu.be/4tKGwFi76_0?si=eHTjwm36NhladY9w";
   String? videoname;
  VideoPlayerController? controllervideo;

 
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
    videoname=Get.arguments["videoname"];
     controllervideo= VideoPlayerController.asset("$questionvideo/$videoname")
      ..initialize().then((value) {
        // controllervideo!.play();
            update();
      });
     isPlaying =controllervideo!.value.isPlaying;
    super.onInit();
  }

@override
  void dispose() {
   controllervideo!.dispose();
    super.dispose();
  }
}