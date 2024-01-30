import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/controller/childrenResult_controller.dart';
import 'package:referral_freindsapp/core/class/handlingdataview.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';

class ChildrenResultExamScreen extends StatelessWidget {
  const ChildrenResultExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    ChildrenResultController controller=Get.put(ChildrenResultController());
    return Scaffold(
      appBar: AppBar(title: const Text("نتائج الاختبارات"),),
      body: GetBuilder<ChildrenResultController>(builder: (controller)=>HandlingDataView(
        statusRequest: controller.statusRequest, 
        widget: Container(
      padding: const EdgeInsets.all(15),
      child:ListView(
        children: [
          GetBuilder<ChildrenResultController>(builder: (controller)=>Card(
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
                    controller.goToDetails(0, 8);
                  },
                  child: const Text("مشاهدة التفاصيل",style: TextStyle(fontSize: 20),),),
               )

            ],),
          )),

          GetBuilder<ChildrenResultController>(builder: (controller)=>Card(
            color: Appcolors.blu,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const Text("نتيجة المستوى الثاني",style: TextStyle(fontSize: 25),),
               const Divider(thickness:1),
               Text("الدرجة التي حصلت عليها هي:${controller.responsescore![1]}"),
               SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  color: Appcolors.primarycolor,
                  onPressed: (){
                    controller.goToDetails(8, 19);
                  },
                  child: const Text("مشاهدة التفاصيل",style: TextStyle(fontSize: 20),),),
               )

            ],),
          )),
          GetBuilder<ChildrenResultController>(builder: (controller)=>Card(
            color: Appcolors.blu,
            child: Column(
              mainAxisAlignment: MainAxisAlignment. center,
              children: [
               const Text("نتيجة المستوى الثالث",style: TextStyle(fontSize: 25),),
               const Divider(thickness:1),
               Text("الدرجة التي حصلت عليها هي:${controller.responsescore![2]}"),
               SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  color: Appcolors.primarycolor,
                  onPressed: (){
                    controller.goToDetails(19, 28);
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