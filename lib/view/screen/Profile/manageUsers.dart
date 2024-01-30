import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/controller/manageUsers_controller.dart';
import 'package:referral_freindsapp/core/class/handlingdataview.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';

class ManageUsersScreen extends StatelessWidget {
  const ManageUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    ManageUsersController controller=Get.put(ManageUsersController());
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Appcolors.secondcolor,
        title: Text("صفحة ادارة المستخدمين"),),
      body: GetBuilder<ManageUsersController>(builder: (controller)=>HandlingDataView(
        statusRequest: controller.statusRequest, 
        widget: ListView(
        children: [
          ...List.generate(controller.data.length, (index) => Container(
            padding: EdgeInsets.all(5),
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // RoutesApp.tracechildrenpage
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    
                    Text("المستخدم: ${controller.data[index]["user_name"]}",overflow:TextOverflow.ellipsis,softWrap: false,style: TextStyle(height: 0),),
                    // Text("جوال: ${controller.data[index]["user_phone"]}",overflow:TextOverflow.ellipsis,softWrap: false,style: TextStyle(height: 0),),
                    // Text("${controller.data[index]["user_email"]}",overflow:TextOverflow.ellipsis,softWrap: false,style: TextStyle(height: 0),),
                    
                  ],),
                  Column(
                    children: [
                      const Icon(Icons.account_circle,size: 50,color: Appcolors.secondcolor,),
                      MaterialButton(
                          // color: Appcolors.secondcolor,
                          onPressed: (){
                             Get.defaultDialog(
                             title: "تنبيه",middleText: "هل تريد بالفعل حذف هذا المستخدم",
                            onCancel: (){
                           
                        },
                        onConfirm: (){
                           controller.deleteUser(controller.data[index]["user_id"].toString());
                           Get.back();
                        }
                        );
                          
                        },
                        child: Icon(Icons.delete,color: Appcolors.secondcolor,)),
                    ],
                  ),
                  // Image.asset(AppImageAssets.trackchaild),
                  
                ],
              ),
            ),
          ))
        ],
      ))),
    );
  }
}