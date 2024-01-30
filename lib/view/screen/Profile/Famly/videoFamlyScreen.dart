
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/controller/QuestionFamly/video_controller.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';
import 'package:video_player/video_player.dart';
class VideoFamlyScreen extends StatelessWidget {
  const VideoFamlyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    VideoFamlyController controller=Get.put(VideoFamlyController());
    return Scaffold(
      appBar: AppBar(title: const Text("الفيديو")),
      body:  GetBuilder<VideoFamlyController>(builder: (controller)=> Column(
        children: [
          const SizedBox(height: 10,),
          Container(height: 250, width: double.infinity, color: Colors.pink, child:Center(
          child: controller.controllervideo!.value.isInitialized?
          AspectRatio(aspectRatio: controller.controllervideo!.value.aspectRatio, child: VideoPlayer(controller.controllervideo!),)
              : const CircularProgressIndicator(),
        ),),
        VideoProgressIndicator(controller.controllervideo!, allowScrubbing: true,
        colors: const VideoProgressColors(playedColor: Appcolors.primarycolor)),
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
          , icon:controller.isPlaying?const Icon(Icons.pause):const Icon(Icons.play_arrow),iconSize: 35,
              ),
        IconButton(
          onPressed: () {
            
            var newPostion= controller.controllervideo!.value.position + const Duration(seconds: 10);
            controller.controllervideo!.seekTo(newPostion);
          }, icon: const  Icon(Icons.last_page),iconSize: 35,),
      ],
    )
        ]
        )
        ),
    );
  }
}