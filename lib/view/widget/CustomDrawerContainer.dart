import 'package:flutter/material.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';

class CustomDrawerContainer extends StatelessWidget {
  final String imag;
  final String titl;
  const CustomDrawerContainer({super.key, required this.imag, required this.titl});

  @override
  Widget build(BuildContext context) {
    return Container(
                  margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 3),
                  child: ListTile(
                    leading: Image.asset(imag),
                    title: Text(titl,style: const TextStyle(color: Appcolors.secondcolor,fontSize: 20,fontWeight: FontWeight.bold),),
                    
                  ),
                );
  }
}