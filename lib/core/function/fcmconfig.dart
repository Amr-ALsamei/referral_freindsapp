
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';


requestPermissionNotification()async{
  // ignore: unused_local_variable
  NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
  alert: true,
  announcement: false,
  badge: true,
  carPlay: false,
  criticalAlert: false,
  provisional: false,
  sound: true,
);
}
fcmConfig(){
  FirebaseMessaging.onMessage.listen((message) { 
    print("************Notification**************");
    print(message.notification!.title);
    print(message.notification!.body);
    // FlutterRingtonePlayer.playNotification();
    SystemSound.play(SystemSoundType.click);
    Get.snackbar(message.notification!.title!, message.notification!.body!);
    refreshNotificationPage(message.data);

  });
}

refreshNotificationPage(data){

  if(Get.currentRoute=="/pendingorder" && data['pagename']=="refreshPending"){
    // PendingOrdersController controller=Get.find();
    // controller.refreshOrder();
  }

}