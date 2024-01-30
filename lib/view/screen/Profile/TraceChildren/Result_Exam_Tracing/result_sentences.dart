import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/controller/Result_Exam_Tracing/resultsentences_controller.dart';
import 'package:referral_freindsapp/core/class/handlingdataview.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';

class ResultExamSentenceTracing extends StatelessWidget {
  const ResultExamSentenceTracing({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    ResultExamSentencesTracingController controller=Get.put(ResultExamSentencesTracingController());
    return Scaffold(
      appBar: AppBar(title: const Text("نتائج الاختبارات"),),
      body: GetBuilder<ResultExamSentencesTracingController>(builder: (controller)=>HandlingDataView(
        statusRequest: controller.statusRequest, 
        widget: Container(
      padding: const EdgeInsets.all(15),
      child:ListView(
        children: [
          GetBuilder<ResultExamSentencesTracingController>(builder: (controller)=>Card(
            color: Appcolors.blu,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const Text("نتيجة المستوى الاول",style: TextStyle(fontSize: 25),),
               const Divider(thickness:1),
               Text("الدرجة التي حصلت عليها هي:${controller.responsescore![0]}"),
               SizedBox( 
                width: double.infinity,
                child: MaterialButton(
                  color: Appcolors.primarycolor,
                  onPressed: (){
                    controller.goToDetails(0, 5);
                  },
                  child: const Text("مشاهدة التفاصيل",style: TextStyle(fontSize: 20),),),
               )

            ],),
          )),

          

        ],
      ) ,
    ))),
    );
  }
}