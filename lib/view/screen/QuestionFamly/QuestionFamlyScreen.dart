
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/controller/QuestionFamly/view_controller.dart';
import 'package:referral_freindsapp/core/class/handlingdataview.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';
import 'package:referral_freindsapp/view/widget/Questions/customCenterFamly.dart';
import 'package:video_player/video_player.dart';

class QuestionFamlyScreen extends StatelessWidget {
  const QuestionFamlyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    QuestionFamlyController controller=Get.find();
    return Scaffold(
      floatingActionButton: GetBuilder<QuestionFamlyController>(builder: (controller)=>controller.index != controller.data.length? FloatingActionButton(
       backgroundColor:  Appcolors.secondcolor,
        onPressed: (){
          int i=controller.index!;
           controller.checkChoose(i,0);
        },
        child: const Icon(Icons.double_arrow_outlined,size: 40,),
        ):const Center()
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartDocked,
      body: Container(
      padding: const EdgeInsets.all(10),
      child: GetBuilder<QuestionFamlyController>(
        builder: (controller)=>HandlingDataView(
          statusRequest: controller.statusRequest, 
          widget: controller.index == controller.data.length
            ?CustomCenterFamly(txt1: "مبروك لقد حصلت  على درجة قدرها:\n${controller.responsescore}",
           onPressed: (){
                   controller.refreshIndex();
                  }, 
            txt2: "خروج", 
            onPressed2: (){

                    //  Get.offAllNamed(RoutesApp.questionhomepage);
                     Get.back();
                  }
            ):ListView(
            
        children: [
  /////////////////////////////////////////////////////////////////////
    GetBuilder<QuestionFamlyController>(builder: (controller)=> Column(
        children: [
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
        )),
  //////////////////////////////////////////////////////////////////////////////
           Column(
            mainAxisSize: MainAxisSize.min,
              children: [
                
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[100]
                  ),
                  child: Text(controller.data[controller.index!].questionText!,textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Appcolors.primarycolor)),
                ),
                //////////////////////
            Column(
             
              children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: (){
                          int i=controller.index!;
                          String q=controller.data[controller.index!].questionOption1!;
                          if(q==controller.data[controller.index!].questionAnswer!){
                            int score=10;
                            controller.checkChoose(i,score );
                          }else{
                            controller.checkChoose(i,0);
                          }
                        },
                        child: Container(
                          width: 120,
                                             padding: const EdgeInsets.symmetric(horizontal: 10),
                                            decoration: BoxDecoration(
                        color: Appcolors.secondcolor,
                        borderRadius: BorderRadius.circular(20)
                                            ),
                                            child: Center(child: Text(controller.data[controller.index!].questionOption1!,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))),
                      ),
                     InkWell(
                      onTap: (){
                        int i=controller.index!;
                          String q=controller.data[controller.index!].questionOption2!;
                          if(q==controller.data[controller.index!].questionAnswer!){
                            int score=10;
                            controller.checkChoose(i,score );
                          }else{
                            controller.checkChoose(i,0);
                          }
                      },
                       child: Container(
                        width: 120,
                       padding: const EdgeInsets.symmetric(horizontal: 10),
                                           decoration: BoxDecoration(
                        color: Appcolors.secondcolor,
                        borderRadius: BorderRadius.circular(20)
                                           ),
                                           child: Center(child: Text(controller.data[controller.index!].questionOption2!,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)))),
                     ),
                 
                    ],
                  ),
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                       InkWell(
                        onTap: (){
                          int i=controller.index!;
                          String q=controller.data[controller.index!].questionOption3!;
                          if(q==controller.data[controller.index!].questionAnswer!){
                            int score=10;
                            controller.checkChoose(i,score );
                          }else{
                            controller.checkChoose(i,0);
                          }
                          },
                         child: Container(
                          width: 120,
                         padding: const EdgeInsets.symmetric(horizontal: 10),
                         decoration: BoxDecoration(
                         color: Appcolors.secondcolor,
                         borderRadius: BorderRadius.circular(20)
                                             ),
                                             child: Center(child: Text(controller.data[controller.index!].questionOption3!,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)))),
                       ),
                     InkWell(
                      onTap: (){
                        int i=controller.index!;
                          String q=controller.data[controller.index!].questionOption4!;
                          if(q==controller.data[controller.index!].questionAnswer!){
                            int score=10;
                            controller.checkChoose(i,score );
                          }else{
                            controller.checkChoose(i,0);
                          }
                          
                             
                      },
                       child: Container(
                        width: 120,
                       padding: const EdgeInsets.symmetric(horizontal: 10),
                                           decoration: BoxDecoration(
                        color: Appcolors.secondcolor,
                        borderRadius: BorderRadius.circular(20)
                                           ),
                                           child: Center(child: Text(controller.data[controller.index!].questionOption4!,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)))),
                     ),
                    
                    ],
                  )
              ],
              )
              ],
            ),
          
          
          
        ],
      ),))
    ),
    );
  }
}