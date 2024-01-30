

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:referral_freindsapp/core/class/Crud.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/linkAPI.dart';

class SentenceData {
  Crud crud;
  SentenceData(this.crud);

  PostData()async{
     var response=await crud.postData(AppLinks.sentenceview, { });
    return response.fold((l) => l, (r) => r);
  }

 addData(Map data,File file)async{
     var response=await crud.addRequestWithImageOne(AppLinks.sentenceadd, data,file);
    return response.fold((l) => l, (r) => r);
  }

 editData(Map data,[File? file])async{
  Either<StatusRequest, Map> response;
     if(file==null){
         response=await crud.postData(AppLinks.sentenceedit, data);
     }else{
     response= await crud.addRequestWithImageOne(AppLinks.sentenceedit, data,file);
     }
    return response.fold((l) => l, (r) => r);
  }

 deleteData(String id,String videoname)async{
     var response=await crud.postData(AppLinks.sentenceedelete, {
      "sentenceId":id.toString(),
      "videoname":videoname
     });
    return response.fold((l) => l, (r) => r);
  }

addWatchingData(Map data)async{
     var response=await crud.postData(AppLinks.sentencevideowatch, data);
    return response.fold((l) => l, (r) => r);
  }

addfavoriteData(Map data)async{
     var response=await crud.postData(AppLinks.sentencefavorite, data);
    return response.fold((l) => l, (r) => r);
  }
 
 }