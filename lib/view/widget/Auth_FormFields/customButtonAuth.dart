
import 'package:flutter/material.dart';
import 'package:referral_freindsapp/core/constant/colors.dart';

class CustumButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustumButtonAuth({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 20,right: 20),
                    child:MaterialButton(
                      textColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      onPressed: onPressed,
                      color: Appcolors.primarycolor,
                      child: Text(text, style:const TextStyle( fontWeight: FontWeight.bold,fontSize: 25,
                       color: Appcolors.black,
                        
                        ),),
                      ) ,
                  );
     
  }
}