

import 'package:referral_freindsapp/core/class/Crud.dart';
import 'package:referral_freindsapp/linkAPI.dart';

class QuestionNumbersData {
  Crud crud;
  QuestionNumbersData(this.crud);

  PostData()async{
     var response=await crud.postData(AppLinks.questionnumbersview, { });
    return response.fold((l) => l, (r) => r);
  }

 

addAnswerData(String userid,String questionid,int score)async{
     var response=await crud.postData(AppLinks.answernumbersadd, {
      "userid":userid.toString(),
      "questionId":questionid.toString(),
      "score":score.toString(),
     });
    return response.fold((l) => l, (r) => r);
  }

getScoreData(String userid,String start,String end)async{
     var response=await crud.postData(AppLinks.answernumberscore, {
      "userId":userid.toString(),
      "start":start.toString(),
      "end":end.toString()
      
     });
    return response.fold((l) => l, (r) => r);
  }

getResultexamData(String userid)async{
     var response=await crud.postData(AppLinks.numbersresultexam, {
      "userId":userid.toString(),
      
     });
    return response.fold((l) => l, (r) => r);
  }

////////////////////////////////////////////
addChildrenAnswerData(String userid,String questionid,int score)async{
     var response=await crud.postData(AppLinks.answerchildrennumbersadd, {
      "userid":userid.toString(),
      "questionId":questionid.toString(),
      "score":score.toString(),
     });
    return response.fold((l) => l, (r) => r);
  }

getChildrenScoreData(String userid,String start,String end)async{
     var response=await crud.postData(AppLinks.childrenanswernumberscore, {
      "userId":userid.toString(),
      "start":start.toString(),
      "end":end.toString()
      
     });
    return response.fold((l) => l, (r) => r);
  }

getchildrenResultData(String userid)async{
     var response=await crud.postData(AppLinks.childrennumbersresultexam, {
      "userId":userid.toString(),
      
     });
    return response.fold((l) => l, (r) => r);
  }



 }