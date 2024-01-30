

import 'package:referral_freindsapp/core/class/Crud.dart';
import 'package:referral_freindsapp/linkAPI.dart';

class LogInChildrenData {
  Crud crud;
  LogInChildrenData(this.crud);

  LogInPostData(String emal)async{
     var response=await crud.postData(AppLinks.loginAsChildren, {
      "email":emal,
     });
    return response.fold((l) => l, (r) => r);
  }
 }