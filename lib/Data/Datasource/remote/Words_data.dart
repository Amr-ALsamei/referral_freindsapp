

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:referral_freindsapp/core/class/Crud.dart';
import 'package:referral_freindsapp/core/class/statusrequest.dart';
import 'package:referral_freindsapp/linkAPI.dart';

class WordsData {
  Crud crud;
  WordsData(this.crud);

  PostData()async{
     var response=await crud.postData(AppLinks.wordview, { });
    return response.fold((l) => l, (r) => r);
  }

 addData(Map data,File file)async{
     var response=await crud.addRequestWithImageOne(AppLinks.wordadd, data,file);
    return response.fold((l) => l, (r) => r);
  }

 editData(Map data,[File? file])async{
  Either<StatusRequest, Map> response;
     if(file==null){
         response=await crud.postData(AppLinks.wordedit, data);
     }else{
     response= await crud.addRequestWithImageOne(AppLinks.wordedit, data,file);
     }
    return response.fold((l) => l, (r) => r);
  }

 deleteData(String id,String video)async{
     var response=await crud.postData(AppLinks.worddelete, {
      "wordId":id.toString(),
      "videoname":video.toString()
     });
    return response.fold((l) => l, (r) => r);
  }

 addWatchingData(Map data)async{
     var response=await crud.postData(AppLinks.wordvideowatch, data);
    return response.fold((l) => l, (r) => r);
  }

addFavoriteData(Map data)async{
     var response=await crud.postData(AppLinks.wordfavorite, data);
    return response.fold((l) => l, (r) => r);
  }
 }