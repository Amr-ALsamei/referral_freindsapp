
import 'package:referral_freindsapp/core/class/Crud.dart';
import 'package:referral_freindsapp/linkAPI.dart';

class FamlyWordsData {
  Crud crud;
  FamlyWordsData(this.crud);

  PostData()async{
     var response=await crud.postData(AppLinks.famlywords, { });
    return response.fold((l) => l, (r) => r);
  }

 addWatchingData(Map data)async{
     var response=await crud.postData(AppLinks.famlywordvideowatch, data);
    return response.fold((l) => l, (r) => r);
  }

addFavoriteData(Map data)async{
     var response=await crud.postData(AppLinks.famlywordfavorite, data);
    return response.fold((l) => l, (r) => r);
  }


 }