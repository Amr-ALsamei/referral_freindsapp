import 'package:get/get.dart';

ValidInput(String val,int min,int max,String typ){
  if(typ=="username"){
    if(val.isEmpty){
      return "نص غير صحيح";
    }
  }

  

  if(typ=="email"){
    if(!GetUtils.isEmail(val)){
      return "ايميل غير صحيح";
    }
  }
  
  if(typ=="Url"){
    if(!GetUtils.isURL(val)){
      return "رابط غير صحيح";
    }
  
  }

  // if(typ=="letter"){
  //   if(!GetUtils.isAlphabetOnly(val)){
  //     return "حرف غير صحيح";
  //   }
  // }
 
 if(typ=="letter"){
    if(val.isEmpty){
      return "حرف غير صحيح";
    }
  }
   
  if(typ=="phone"){
    if(!GetUtils.isPhoneNumber(val)){
      return "جوال غير صحيح";
    }
  }
   
   if(val.isEmpty){
    return "can't be Empty";
   }
  if(val.length<min){
    return "value can't be less than $min";
  }

  if(val.length>max){
    return "value can't be larger than $max";
  }
}