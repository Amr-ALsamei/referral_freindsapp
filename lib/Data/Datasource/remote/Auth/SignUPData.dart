

import 'package:referral_freindsapp/core/class/Crud.dart';
import 'package:referral_freindsapp/linkAPI.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);

  SignupPostData(String username,String password,String emal,String phone)async{
     var response=await crud.postData(AppLinks.signup, {
      "username":username,
      "password":password,
      "email":emal,
      "phone":phone,
     });
    return response.fold((l) => l, (r) => r);
  }

editData(String username,String userid)async{
     var response=await crud.postData(AppLinks.editusername, {
      "username":username.toString(),
      "userid":userid.toString(),
     
     });
    return response.fold((l) => l, (r) => r);
 }

editchildrenData(String username,String userid)async{
     var response=await crud.postData(AppLinks.editchildrenusername, {
      "username":username.toString(),
      "userid":userid.toString(),
     
     });
    return response.fold((l) => l, (r) => r);
 }
 }