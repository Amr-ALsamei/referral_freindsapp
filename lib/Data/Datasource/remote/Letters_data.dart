

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:referral_freindsapp/core/class/Crud.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/linkAPI.dart';

class LettersData {
  Crud crud;
  LettersData(this.crud);

  PostData()async{
     var response=await crud.postData(AppLinks.lettersview, { });
    return response.fold((l) => l, (r) => r);
  }

 addData(Map data,File file)async{
     var response=await crud.addRequestWithImageOne(AppLinks.letteradd, data,file);
    return response.fold((l) => l, (r) => r);
  }

 editData(Map data,[File? file])async{
   Either<StatusRequest, Map> response;
     if(file==null){
         response=await crud.postData(AppLinks.letteredit, data);
     }else{
     response= await crud.addRequestWithImageOne(AppLinks.letteredit, data,file);
     }
    return response.fold((l) => l, (r) => r);
     
  }

 deleteData(String id,String videoname)async{
     var response=await crud.postData(AppLinks.lettersdelete, {
      "letterId":id.toString(),
      "videoname":videoname
     });
    return response.fold((l) => l, (r) => r);
  }

addWatchingData(Map data)async{
     var response=await crud.postData(AppLinks.lettervideowatch, data);
    return response.fold((l) => l, (r) => r);
  }

viewWatchingData(String userid,String childid)async{
     var response=await crud.postData(AppLinks.viewvideowatch, {
      "userId":userid.toString(),
      "childId":childid.toString()
     });
    return response.fold((l) => l, (r) => r);
  }

addFavoriteData(Map data)async{
     var response=await crud.postData(AppLinks.letterfavorite, data);
    return response.fold((l) => l, (r) => r);
  }

viewFavoriteData(String userid)async{
     var response=await crud.postData(AppLinks.viewvideofavorite, {
      "userId":userid.toString()
     });
    return response.fold((l) => l, (r) => r);
  }
 }