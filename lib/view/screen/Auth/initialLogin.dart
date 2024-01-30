
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/controller/Auth/loginController.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';
import 'package:referral_freindsapp/core/constant/routesName.dart';
import 'package:referral_freindsapp/core/function/AlertExitApp.dart';
import 'package:referral_freindsapp/view/widget/Auth_FormFields/customformLabel.dart';
import 'package:referral_freindsapp/view/widget/Auth_FormFields/logoAuth.dart';


class InitialLoginApp extends StatelessWidget {
  const InitialLoginApp({super.key});

  @override
  Widget build(BuildContext context) {
   Get.lazyPut(()=>LogInControllerImp());
    return Scaffold(
      
      body: WillPopScope(
          onWillPop: AlertExitApp,
          child:  Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
                    children: [
                   Container(
                    margin: EdgeInsets.symmetric(horizontal: 70),
                      child:  LogoAuth()),
                     const CustumFormLable(label: "أصدقاء الاشارة",),
                  
                     const SizedBox(height: 50,),
                    
                  Container(
                    width: 250,
                    // margin: const EdgeInsets.only(left: 20,right: 20),
                    child:MaterialButton(
                      textColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      onPressed: (){
                        Get.toNamed(RoutesApp.login);
                      },
                      color: Appcolors.primarycolor,
                      child: const Text("تسجيل الدخول", style:TextStyle( fontWeight: FontWeight.bold,fontSize: 25,
                       color: Appcolors.black,
                        
                        ),),
                      ) ,
                  ),
                const SizedBox(height: 20,),
                Container(
                    width: 250,
                    // margin: const EdgeInsets.only(left: 20,right: 20),
                    child:MaterialButton(
                      textColor: Colors.white,
                      // padding: const EdgeInsets.symmetric(horizontal: 20),
                      onPressed: (){
                        Get.toNamed(RoutesApp.signapp);
                      },
                      color: Appcolors.primarycolor,
                      child: const Text("انشاء حساب", style:TextStyle( fontWeight: FontWeight.bold,fontSize: 25,
                       color: Appcolors.black,
                        
                        ),),
                      ) ,
                  )
                

                      
                    ],
                  ),
                
          ),
              
        ),
      
    );
  }
}