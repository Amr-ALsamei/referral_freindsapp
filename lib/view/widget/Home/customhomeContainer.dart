import 'package:flutter/material.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';

class CustomHomeContianer extends StatelessWidget {
  final String imagUrl;
  final String title;
  const CustomHomeContianer({super.key, required this.imagUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(imagUrl,width: 200,height: 200,),
                  
                  Text(title,style: const TextStyle(color: Appcolors.primarycolor,fontSize: 20),),
                ],
              ));
  }
}