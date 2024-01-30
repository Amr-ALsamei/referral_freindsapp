
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/controller/videoTrace_controller.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';
import 'package:video_player/video_player.dart';

class VideoTraceScreen extends StatelessWidget {
  const VideoTraceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    VideoTraceController controller=Get.put(VideoTraceController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('صفحة تتبع الطفل'),
      ),
      body:GetBuilder<VideoTraceController>(builder: (controller)=> Column(
        children: [
          Container(height: 250, width: 400, color: Colors.pink, child:Center(
          child: controller.controllervideo!.value.isInitialized?
          AspectRatio(aspectRatio: controller.controllervideo!.value.aspectRatio, child: VideoPlayer(controller.controllervideo!),)
              : const CircularProgressIndicator(),
        ),),
        VideoProgressIndicator(controller.controllervideo!, allowScrubbing: true,
        colors: const VideoProgressColors(playedColor: Appcolors.primarycolor),),
       Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            if(controller.controllervideo!.value.position<= const Duration(seconds: 10)){
              controller.controllervideo!.seekTo(const Duration(seconds: 0));
            }
            else{
              var p = controller.controllervideo!.value.position - const Duration(seconds: 10);
              controller.controllervideo!.seekTo(p);
            }

          }, icon: const Icon(Icons.first_page,),iconSize: 35,),
        IconButton(
          onPressed: () {
            controller.refresshValue();
            
              }
          , icon:controller.isPlaying? const Icon(Icons.pause):const Icon(Icons.play_arrow),iconSize: 35,),
        IconButton(
          onPressed: () {
            var newPostion= controller.controllervideo!.value.position + const Duration(seconds: 10);
            controller.controllervideo!.seekTo(newPostion);
          }, icon: const  Icon(Icons.last_page),iconSize: 35,),
      ],
    )
        ],
      ),),
      floatingActionButton: GetBuilder<VideoTraceController>(builder: (controller)=>FloatingActionButton(
        onPressed: (){
          controller.refreshMutevalue();
        },
        child: controller.isMute?const Icon(Icons.volume_off):const Icon(Icons.volume_up),
      ),),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
     
    );
  }
}


