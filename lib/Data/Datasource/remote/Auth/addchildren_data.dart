

import 'package:referral_freindsapp/core/class/Crud.dart';
import 'package:referral_freindsapp/linkAPI.dart';

class SignupChildrenData {
  Crud crud;
  SignupChildrenData(this.crud);

  SignupPostData(String parentid,String name,String emal)async{
     var response=await crud.postData(AppLinks.signupchildren, {
      "parentId":parentid,
      "childName":name,
      "email":emal,
     });
    return response.fold((l) => l, (r) => r);
  }

// editData(String username,String userid)async{
//      var response=await crud.postData(AppLinks.editusername, {
//       "username":username.toString(),
//       "userid":userid.toString(),
     
//      });
//     return response.fold((l) => l, (r) => r);
//  }
 }