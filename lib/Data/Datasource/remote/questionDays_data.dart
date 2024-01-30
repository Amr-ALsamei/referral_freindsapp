

import 'package:referral_freindsapp/core/class/Crud.dart';
import 'package:referral_freindsapp/linkAPI.dart';

class QuestionDaysData {
  Crud crud;
  QuestionDaysData(this.crud);

  PostData()async{
     var response=await crud.postData(AppLinks.questiondaysview, { });
    return response.fold((l) => l, (r) => r);
  }

 

addAnswerData(String userid,String questionid,int score)async{
     var response=await crud.postData(AppLinks.answerdaysadd, {
      "userid":userid.toString(),
      "questionId":questionid.toString(),
      "score":score.toString(),
     });
    return response.fold((l) => l, (r) => r);
  }

getScoreData(String userid,String start,String end)async{
     var response=await crud.postData(AppLinks.answerdayscore, {
      "userId":userid.toString(),
      "start":start.toString(),
      "end":end.toString()
      
     });
    return response.fold((l) => l, (r) => r);
  }

getResultexamData(String userid)async{
     var response=await crud.postData(AppLinks.daysresultexam, {
      "userId":userid.toString(),
      
     });
    return response.fold((l) => l, (r) => r);
  }

////////////////////////////////////////////
addChildrenAnswerData(String userid,String questionid,int score)async{
     var response=await crud.postData(AppLinks.answerchildrendaysadd, {
      "userid":userid.toString(),
      "questionId":questionid.toString(),
      "score":score.toString(),
     });
    return response.fold((l) => l, (r) => r);
  }

getChildrenScoreData(String userid,String start,String end)async{
     var response=await crud.postData(AppLinks.childrenanswerdayscore, {
      "userId":userid.toString(),
      "start":start.toString(),
      "end":end.toString()
      
     });
    return response.fold((l) => l, (r) => r);
  }

getchildrenResultData(String userid)async{
     var response=await crud.postData(AppLinks.childrendaysresultexam, {
      "userId":userid.toString(),
      
     });
    return response.fold((l) => l, (r) => r);
  }



 }