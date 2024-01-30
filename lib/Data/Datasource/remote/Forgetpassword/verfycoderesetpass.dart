

import 'package:referral_freindsapp/core/class/Crud.dart';
import 'package:referral_freindsapp/linkAPI.dart';

class VeryfyCodeResetPassWord {
  Crud crud;
  VeryfyCodeResetPassWord(this.crud);

  VerfyCodeResetPassWordPostData(String emal,String verfycode)async{
     var response=await crud.postData(AppLinks.verfiycodeforgetpass, {
      "verfiycode":verfycode,
      "email":emal,
     
     });
    return response.fold((l) => l, (r) => r);
  }
 }