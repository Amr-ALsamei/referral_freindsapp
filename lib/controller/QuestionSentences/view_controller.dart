
import 'package:get/get.dart';
import 'package:referral_freindsapp/Data/Datasource/remote/questionSentence_data.dart';
import 'package:referral_freindsapp/Data/Model/questionSentenceModel.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/core/function/handlingdata.dart';
import 'package:referral_freindsapp/core/services/services.dart';
import 'package:video_player/video_player.dart';

class QuestionSentenceController extends GetxController{

QuestionSentenceData questionSentenceData=QuestionSentenceData(Get.find());//Get.find() Takes from initialBinding
 MyServices myServices=Get.find();
  List<QuestionSentenceModel> data=[];
 
  String? responsescore;
 int? index;
  late StatusRequest statusRequest;
////////////////////////////////////////////
late String title ,author ;
  late bool isPlaying;
  final String questionvideo="assets/questionVideo";
  // final String url = "https://youtu.be/4tKGwFi76_0?si=eHTjwm36NhladY9w";
   String? videoname;
  VideoPlayerController? controllervideo;
  /////////////////////////////////////////////

getData()async{
   data.clear();
    statusRequest=StatusRequest.loading;
    update();
    var response=await questionSentenceData.PostData();
    statusRequest=handlingData(response);
       print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
        List responsebody=response['data'];
        data.addAll(responsebody.map((e) => QuestionSentenceModel.fromJson(e)));
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
  }

refreshIndex(){
  index=0;
  playVideo(index!);
  update();
}

videoInit(int i){

}


checkChoose(int i,int score){
    if(i< data.length){
        index=i+1 ;
      addAnswer(data[i].questionId.toString(),score);
      playVideo(index!);
      
    }

   
    if(index== data.length){
     Future.delayed(const Duration(seconds: 1),(){
       getScore("0",(data.length+1).toString());
     });
     
    }
  
  // print(score);
  // print(index);
   update();
}

addAnswer(String id,int s)async {
   statusRequest=StatusRequest.loading;
  //  update();
  print( myServices.sharedPref.getString("Id")!);
  if(myServices.sharedPref.getString("usertype")=="children"){
     var response=await questionSentenceData.addChildrenAnswerData(
      myServices.sharedPref.getString("Id")!,id,s);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
    
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
  }else{
    var response=await questionSentenceData.addAnswerData(
      myServices.sharedPref.getString("Id")!,id,s);
    statusRequest=handlingData(response);
    print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
    
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
  }
    
    update();
    
  }

getScore(String s,String e)async{
  
    statusRequest=StatusRequest.loading;
    // update();
    if(myServices.sharedPref.getString("usertype")=="children"){
         
    var response=await questionSentenceData.getChildrenScoreData(myServices.sharedPref.getString("Id")!,s,e);
     statusRequest=handlingData(response);
       print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
         responsescore=response['data'];
        print(responsescore);
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    }else{
      var response=await questionSentenceData.getScoreData(myServices.sharedPref.getString("Id")!,s,e);
     statusRequest=handlingData(response);
       print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
         responsescore=response['data'];
        print(responsescore);
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    }
    
    update();
  }

///////////////////////////////////////////
getResult(String s,String e)async{
  
    statusRequest=StatusRequest.loading;
    // update();
    var response=await questionSentenceData.getScoreData(myServices.sharedPref.getString("Id")!,s,e);
    statusRequest=handlingData(response);
       print(response);
    if(StatusRequest.success==statusRequest){
     if(response['status']=="success") {
         responsescore=response['data'];
        print(responsescore);
        }else{
          statusRequest=StatusRequest.failure;
        }
    }
    update();
  }
////////////////////////////////////////////
playVideo(int vindex){
  
  if(index! < data.length){
   
    String? vname=data[vindex].questionVideo;
  
    controllervideo= VideoPlayerController.asset("$questionvideo/$vname")
      ..initialize().then((value) {
        // controllervideo!.play();
            update();
      });
     isPlaying =controllervideo!.value.isPlaying;
  }

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
  void onInit()async {
    index=0;
  await getData();
  playVideo(0);
     
    super.onInit();
  }

@override
  void dispose() {
     controllervideo!.dispose();
    super.dispose();
  }
}