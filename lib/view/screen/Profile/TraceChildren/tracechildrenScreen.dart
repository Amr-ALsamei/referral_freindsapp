import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/controller/tracechildren_controller.dart';
import 'package:referral_freindsapp/core/class/handlingdataview.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';

class TraceChildrenScreen extends StatelessWidget {
  const TraceChildrenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    TraceChildrenController controller=Get.put(TraceChildrenController());
    return Scaffold(
      appBar: AppBar(title: const Text("المحتوى الذي شاهده طفلك"),),
      body: Container(
      padding: const EdgeInsets.all(10),
      child: GetBuilder<TraceChildrenController>(
        builder: (controller)=>HandlingDataView(
          statusRequest: controller.statusRequest, 
          widget: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:2,
              childAspectRatio: 1.6 ),
              
        children: [
          ...List.generate(controller.data.length, (index) => Card(
            color: Appcolors.secondcolor,
            child:  Column(
                children: [
                  Text(" [${controller.data[index].letterName!} ]",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,height: 0),
                         overflow: TextOverflow.ellipsis,softWrap: false,),
                   SizedBox(
                    width: double.infinity,
                    child: MaterialButton(
                        textColor: Colors.white,
                        // padding: EdgeInsets.symmetric(horizontal: 60),
                        onPressed: (){
              
                          controller.goToVideoScreen(controller.data[index].letterVideo!,
                          controller.data[index].letterId.toString());
                           },
                        color: Appcolors.primarycolor,
                        child: const Text("انقر للمشاهدة", style:TextStyle( fontWeight: FontWeight.bold,fontSize: 20,
                         color: Appcolors.black,
                            
                          ),),
                        ),
                  ) 
                  
                ],
              ),
            
          ),)
          
          
          
        ],
      ),))
    ),
    );
  }
}