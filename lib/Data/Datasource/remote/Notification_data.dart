

import 'package:referral_freindsapp/core/class/Crud.dart';
import 'package:referral_freindsapp/linkAPI.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);

  getNotificationData(String userid)async{
     var response=await crud.postData(AppLinks.notification, {
       "userId":userid.toString()
     });
    return response.fold((l) => l, (r) => r);
  }
 
 getNotificationchildrenData(String userid)async{
     var response=await crud.postData(AppLinks.notificationchildren, {
       "userId":userid.toString()
     });
    return response.fold((l) => l, (r) => r);
  }
 }