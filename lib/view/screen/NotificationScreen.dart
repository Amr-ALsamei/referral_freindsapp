
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:referral_freindsapp/controller/notification_controller.dart';
import 'package:referral_freindsapp/core/class/handlingdataview.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return Scaffold(
      appBar: AppBar(title: Text("الاشعارات"),),
      body: GetBuilder<NotificationController>(
      builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            // padding: EdgeInsets.all(10),
            child: ListView(
            children: [
              ...List.generate(controller.data.length,
               (index) => Card(
                 child: Stack(
                  children: [
                    ListTile(
                      title: Text(controller.data[index]["notifications_title"],style: TextStyle(height: 0,
                      fontSize: 20,fontWeight: FontWeight.bold,color: Appcolors.primarycolor),),
                      subtitle:Text (controller.data[index]["notifications_body"],style: TextStyle(height: 0)), 
                    ),
                    Positioned(
                      left: 5,
                      top: 5,
                      child: Text(Jiffy.parse(controller.data[index]["notifications_date"]).fromNow(),
                           style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Appcolors.primarycolor),
                            ) ,)
                  ],
                               ),
               ))
            ],
          ),),
        );
      }
    ),
    );
  }
}