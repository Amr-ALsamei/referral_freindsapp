

import 'package:referral_freindsapp/core/class/Crud.dart';
import 'package:referral_freindsapp/linkAPI.dart';

class ManageUsersData {
  Crud crud;
  ManageUsersData(this.crud);

  getusersData()async{
     var response=await crud.postData(AppLinks.usersinfo, {
       
     });
    return response.fold((l) => l, (r) => r);
  }

delteusersData(String userid)async{
     var response=await crud.postData(AppLinks.delteusersinfo, {
     "userId":userid.toString()
       
     });
    return response.fold((l) => l, (r) => r);
  }
 
 
 }