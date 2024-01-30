

import 'package:referral_freindsapp/core/class/Crud.dart';
import 'package:referral_freindsapp/linkAPI.dart';

class TraceMainData {
  Crud crud;
  TraceMainData(this.crud);

  getchildrenData(String userid)async{
     var response=await crud.postData(AppLinks.childreninfo, {
       "userId":userid.toString()
     });
    return response.fold((l) => l, (r) => r);
  }
 
 deletechildrenData(String childid)async{
     var response=await crud.postData(AppLinks.deletechildreninfo, {
       "childId":childid.toString()
     });
    return response.fold((l) => l, (r) => r);
  }
 
 
 }