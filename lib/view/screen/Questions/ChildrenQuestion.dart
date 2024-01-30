
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/controller/Questions/view_children_controller.dart';
import 'package:referral_freindsapp/core/class/handlingdataview.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';
import 'package:referral_freindsapp/core/constant/imageAssest.dart';
import 'package:referral_freindsapp/view/widget/Questions/customCenterlevel2.dart';

class ChildrenQuestionsScreen extends StatelessWidget {
  const ChildrenQuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    ChildrenQuestionsController controller=Get.put(ChildrenQuestionsController());
    return Scaffold(
      floatingActionButton: GetBuilder<ChildrenQuestionsController>(builder: (controller)=>controller.index != controller.data.length? FloatingActionButton(
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
      child: GetBuilder<ChildrenQuestionsController>(
        builder: (controller)=>HandlingDataView(
          statusRequest: controller.statusRequest, 
          widget: controller.index == controller.level1
          ?CustomCenterLevel2(txt1: "مبروك لقد حصلت في المستوى الاول على درجة قدرها:\n${controller.responsescore}",
           onPressed: (){
                    controller.refreshIndex();
                  }, 
            txt2: "المستوى التالي", 
            onPressed2: (){
                     int i=controller.index!;
                   controller.checkChoose(i,0);
                  }
            ):controller.index == controller.level2
            ?CustomCenterLevel2(txt1: "مبروك لقد حصلت في المستوى الثاني على درجة قدرها:\n${controller.responsescore}",
           onPressed: (){
                   controller.refreshIndex2();
                  //  int i=controller.level1!+2;
                  //  controller.checkChoose(i,0);
                  }, 
            txt2: "المستوى التالي", 
            onPressed2: (){
                     int i=controller.index!;
                   controller.checkChoose(i,0);
                  }
            ):controller.index == controller.data.length
            ?CustomCenterLevel2(txt1: "مبروك لقد حصلت في المستوى الثالث على درجة قدرها:\n${controller.responsescore}",
           onPressed: (){
                   controller.refreshIndex3();
                  }, 
            txt2: "خروج", 
            onPressed2: (){
                     Get.back();
                  }
            ):ListView(
            
        children: [
          Image.asset("${AppImageAssets.rootletters}/${controller.data[controller.index!].questionImage}",height: 250,fit: BoxFit.fill,),
          //  CachedNetworkImage(imageUrl: "${AppLinks.imageletters}/${controller.data[controller.index!].questionImage}",
          //         height: 250,fit: BoxFit.fill,),
          
          // SizedBox(height: 20,),
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
                                             padding: const EdgeInsets.symmetric(horizontal: 40),
                                            decoration: BoxDecoration(
                        color: Appcolors.secondcolor,
                        borderRadius: BorderRadius.circular(20)
                                            ),
                                            child: Text(controller.data[controller.index!].questionOption1!,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
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
                       padding: const EdgeInsets.symmetric(horizontal: 40),
                                           decoration: BoxDecoration(
                        color: Appcolors.secondcolor,
                        borderRadius: BorderRadius.circular(20)
                                           ),
                                           child: Text(controller.data[controller.index!].questionOption2!,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold))),
                     ),
                 
                    ],
                  ),
                  const SizedBox(height: 40,),
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
                         padding: const EdgeInsets.symmetric(horizontal: 40),
                         decoration: BoxDecoration(
                         color: Appcolors.secondcolor,
                         borderRadius: BorderRadius.circular(20)
                                             ),
                                             child: Text(controller.data[controller.index!].questionOption3!,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold))),
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
                       padding: const EdgeInsets.symmetric(horizontal: 40),
                                           decoration: BoxDecoration(
                        color: Appcolors.secondcolor,
                        borderRadius: BorderRadius.circular(20)
                                           ),
                                           child: Text(controller.data[controller.index!].questionOption4!,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold))),
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