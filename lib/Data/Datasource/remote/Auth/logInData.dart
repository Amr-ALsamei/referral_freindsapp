

import 'package:referral_freindsapp/core/class/Crud.dart';
import 'package:referral_freindsapp/linkAPI.dart';

class LogInData {
  Crud crud;
  LogInData(this.crud);

  LogInPostData(String emal,String password)async{
     var response=await crud.postData(AppLinks.login, {
      "email":emal,
      "password":password,
     });
    return response.fold((l) => l, (r) => r);
  }
 }