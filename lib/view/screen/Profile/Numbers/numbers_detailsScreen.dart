
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/controller/QuestionNumber/details_controller.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';
import 'package:referral_freindsapp/core/constant/imageAssest.dart';

class NumberDetailsScreen extends StatelessWidget {
  const NumberDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NumbersDetailsExamController controller=Get.put(NumbersDetailsExamController());
    return Scaffold(
      appBar: AppBar(title: const Text("صفحة التفاصيل"),),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            ...List.generate(controller.data.length, (index) => Card(
              color: Appcolors.blu,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    
                  Text("${controller.data[index].questionText}"),
                  Image.asset("${AppImageAssets.rootnumbers}/${controller.data[index].questionImage}",height: 70),
                //  CachedNetworkImage(imageUrl:"${AppLinks.imageletters}/${controller.data[index].questionImage}",
                //   height: 70,),
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
            ))
          ],
        ),
      ),
    );
  }
}