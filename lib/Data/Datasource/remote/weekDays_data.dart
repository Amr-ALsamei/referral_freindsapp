
import 'package:referral_freindsapp/core/class/Crud.dart';
import 'package:referral_freindsapp/linkAPI.dart';

class WeekWordsData {
  Crud crud;
  WeekWordsData(this.crud);

  PostData()async{
     var response=await crud.postData(AppLinks.weekdays, { });
    return response.fold((l) => l, (r) => r);
  }

 addWatchingData(Map data)async{
     var response=await crud.postData(AppLinks.weekwordvideowatch, data);
    return response.fold((l) => l, (r) => r);
  }

 addFavoriteData(Map data)async{
     var response=await crud.postData(AppLinks.weekwordfavorite, data);
    return response.fold((l) => l, (r) => r);
  }
 


 }