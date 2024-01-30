import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/controller/Result_Exam_Tracing/resultfamly_controller.dart';
import 'package:referral_freindsapp/core/class/handlingdataview.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';

class ResultExamFamlyTracing extends StatelessWidget {
  const ResultExamFamlyTracing({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    ResultExamFamlyTracingController controller=Get.put(ResultExamFamlyTracingController());
    return Scaffold(
      appBar: AppBar(title: const Text("نتائج الاختبارات"),),
      body: GetBuilder<ResultExamFamlyTracingController>(builder: (controller)=>HandlingDataView(
        statusRequest: controller.statusRequest, 
        widget: Container(
      padding: const EdgeInsets.all(15),
      child:ListView(
        children: [
          GetBuilder<ResultExamFamlyTracingController>(builder: (controller)=>Card(
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
                    controller.goToDetails(0, controller.data.length);
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