import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/controller/traceMain_controller.dart';
import 'package:referral_freindsapp/core/class/handlingdataview.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';
import 'package:referral_freindsapp/core/constant/imageAssest.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/services/services.dart';

class TraceChildrenMain extends StatelessWidget {
  const TraceChildrenMain({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices=Get.find();
    // ignore: unused_local_variable
    TraceMainController controller=Get.put(TraceMainController());
    return Scaffold(
      appBar: AppBar(title: Text("صفحة التتبع"),),
      body: GetBuilder<TraceMainController>(builder: (controller)=>HandlingDataView(
        statusRequest: controller.statusRequest, 
        widget: ListView(
        children: [
          ...List.generate(controller.data.length, (index) => Container(
            padding: EdgeInsets.all(5),
            child:  Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // RoutesApp.tracechildrenpage
                      Column(children: [
                        Text("الطفل: ${controller.data[index]["chidlren_Name"]}"),
                         MaterialButton(
                              color: Appcolors.primarycolor,
                              onPressed: (){
                              controller.gotowatchedContains(controller.data[index]["chidlren_Id"].toString());
                            },
                            child: const Text("تصفح المحتوى المشاهد",style: TextStyle(fontSize: 20),),
                            ),
                          MaterialButton(
                              color: Appcolors.primarycolor,
                              onPressed: (){
                                myServices.sharedPref.setString("childid", controller.data[index]["chidlren_Id"].toString());
                                Get.toNamed(RoutesApp.resultexamtracingpage);
                              // controller.gotowatchedContains(controller.data[index]["chidlren_Id"].toString());
                            },
                            child: const Text("عرض نتائج الاختبارات",style: TextStyle(fontSize: 20),),
                            ),
                        /////////////////////////////////////////////////////////////////
                      ],),
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(AppImageAssets.trackchaild),
                           MaterialButton(onPressed: (){
                              Get.defaultDialog(
                            title: "تنبيه",middleText: "هل تريد بالفعل حذف هذا الطفل",
                            onCancel: (){
                           
                             },
                              onConfirm: (){
                              controller.deletechild(controller.data[index]["chidlren_Id"].toString());
                              Get.back();
                        }
                        );
                  
                             },
                              child: Icon(Icons.delete,color: Appcolors.primarycolor,),),
             
                        ],
                      ),
                      
                    ],
                  ),
                ),
              
          ))
        ],
      ))),
    );
  }
}