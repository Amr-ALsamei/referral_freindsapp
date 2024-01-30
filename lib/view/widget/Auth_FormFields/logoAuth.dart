
import 'package:flutter/widgets.dart';
import 'package:referral_freindsapp/core/constant/imageAssest.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                         child: Image.asset(AppImageAssets.logo,
                            height: 200,
                             width: 200,
                              fit: BoxFit.fill,),
                       );

    
  }
}