
import 'package:flutter/material.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';

class CustumFormLable extends StatelessWidget {
  final String label;
  const CustumFormLable({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(label,style:const TextStyle(fontSize: 40,color: Appcolors.blu,
                 fontWeight: FontWeight.bold,
                 ) ,
                 textAlign:TextAlign.center ,);
  }
}

class CustumFormLable1 extends StatelessWidget {
  final String label;
  const CustumFormLable1({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(label,style:const TextStyle(fontSize: 30,color:Colors.black,
                 fontWeight: FontWeight.bold,
                 ) ,
                 textAlign:TextAlign.center ,);
  }
}