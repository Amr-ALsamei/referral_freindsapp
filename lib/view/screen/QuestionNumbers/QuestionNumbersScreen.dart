
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/controller/QuestionNumber/view_controller.dart';
import 'package:referral_freindsapp/core/class/handlingdataview.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';
import 'package:referral_freindsapp/core/constant/imageAssest.dart';
import 'package:referral_freindsapp/view/widget/Questions/customCenterNum.dart';
class QuestionNumbersScreen extends StatelessWidget {
  const QuestionNumbersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    QuestionNumbersController controller=Get.find();
    return Scaffold(
      floatingActionButton: GetBuilder<QuestionNumbersController>(builder: (controller)=>controller.index != controller.data.length? FloatingActionButton(
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
      child: GetBuilder<QuestionNumbersController>(
        builder: (controller)=>HandlingDataView(
          statusRequest: controller.statusRequest, 
          widget: controller.index == controller.data.length
            ?CustomCenterNumber(txt1: "مبروك لقد حصلت  على درجة قدرها:\n${controller.responsescore}",
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
    Image.asset("${AppImageAssets.rootnumbers}/${controller.data[controller.index!].questionImage}",height: 250,fit: BoxFit.fill,),
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