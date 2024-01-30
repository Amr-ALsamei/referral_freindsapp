
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/controller/QuestionSentences/details_controller.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';

class SentencesDetailsScreen extends StatelessWidget {
  const SentencesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SentencesDetailsExamController controller=Get.put(SentencesDetailsExamController());
    return Scaffold(
      appBar: AppBar(title: const Text("صفحة التفاصيل"),),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            ...List.generate(controller.data.length, (index) {
              return Card(
              color: Appcolors.blu,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    
                  
                      Text("${controller.data[index].questionText}"),
                      MaterialButton(
                        color: Appcolors.primarycolor,
                        onPressed: (){
                        controller.gotoVideoScreen(controller.data[index].questionVideo!);
                      },
                      child: const Text("تشغيل",style: TextStyle(fontSize: 20),),),
                      
                  // Image.asset("${AppImageAssets.rootletters}/${controller.data[index].questionImage}",height: 70),
        
                
              
                
                  ],),
                const Divider(),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    
                  Text("الدرجة التي حصلت عليها:${controller.data[index].score}"),
                  
                 
                  ],),
                  const Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Text("الدرجة الفعلية هي: 10"),],),
                  
                  const Divider(),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Text("الاجابة الصحيحة هي   :[ ${controller.data[index].questionAnswer} ]"),],)
                ],
              ),
            );
            })
          ],
        ),
      ),
    );
  }
}