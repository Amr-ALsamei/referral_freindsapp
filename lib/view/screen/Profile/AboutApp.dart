
import 'package:flutter/material.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';
import 'package:referral_freindsapp/core/constant/imageAssest.dart';

class AboutApplicationScreen extends StatelessWidget {
  const AboutApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.secondcolor,
        title: Text("عن التطبيق")),
      body: ListView(children: [
                Container(
                  margin: EdgeInsets.only(left: 100,right: 100,top: 10,bottom: 10),
                  width: 200,
                  child: ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                           child: Image.asset(AppImageAssets.logo,
                              height: 200,
                               width: 200,
                                fit: BoxFit.fill,),
                         ),
                ),
              Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Text(" مرحبا بك في تطبيق تعلم لغة الاشارة! انظم الينا في رحلة تعلم لغة الاشارة وتواصل بكفاءة مع مجتمع الصم ابدأ الان واكسب مهارات جديدة تفتح لك عالما جديدا من التواصل"
                     ,textAlign: TextAlign.center,
                      style:const TextStyle(  fontWeight: FontWeight.bold,height: 0,
                         color: Colors.black,
                         fontSize: 16,)
                         )),
      ],),
    );
  }
}