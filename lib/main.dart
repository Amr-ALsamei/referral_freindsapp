
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:referral_freindsapp/Binding/initialBinding.dart';
import 'package:referral_freindsapp/core/Localization/changelocal.dart';
import 'package:referral_freindsapp/core/Localization/transilation.dart';
import 'package:referral_freindsapp/core/services/services.dart';
import 'package:referral_freindsapp/routes.dart';

void main()async { 
  WidgetsFlutterBinding.ensureInitialized();
   
  await InitialServices();
  // print("Hello");   

  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // InitialServices();
    LocalController controller=Get.put(LocalController());
    return GetMaterialApp(
      
      translations: MyTranslation(),
      locale: controller.language,
      debugShowCheckedModeBanner: false,
      title: 'Referral Freinds',
      theme: controller.appThem,
      // home: Languages(),
      // routes: routes,
      getPages: routesPages,
      initialBinding: InitialBindings(),
    );
  }
}

