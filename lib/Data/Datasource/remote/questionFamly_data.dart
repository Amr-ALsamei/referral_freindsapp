

import 'package:referral_freindsapp/core/class/Crud.dart';
import 'package:referral_freindsapp/linkAPI.dart';

class QuestionFamlyData {
  Crud crud;
  QuestionFamlyData(this.crud);

  PostData()async{
     var response=await crud.postData(AppLinks.questionfamlyview, { });
    return response.fold((l) => l, (r) => r);
  }

 

addAnswerData(String userid,String questionid,int score)async{
     var response=await crud.postData(AppLinks.answerfamlyadd, {
      "userid":userid.toString(),
      "questionId":questionid.toString(),
      "score":score.toString(),
     });
    return response.fold((l) => l, (r) => r);
  }

getScoreData(String userid,String start,String end)async{
     var response=await crud.postData(AppLinks.answerfamlyscore, {
      "userId":userid.toString(),
      "start":start.toString(),
      "end":end.toString()
      
     });
    return response.fold((l) => l, (r) => r);
  }

getResultexamData(String userid)async{
     var response=await crud.postData(AppLinks.famlyresultexam, {
      "userId":userid.toString(),
      
     });
    return response.fold((l) => l, (r) => r);
  }

////////////////////////////////////////////
addChildrenAnswerData(String userid,String questionid,int score)async{
     var response=await crud.postData(AppLinks.answerchildrenfamlyadd, {
      "userid":userid.toString(),
      "questionId":questionid.toString(),
      "score":score.toString(),
     });
    return response.fold((l) => l, (r) => r);
  }

getChildrenScoreData(String userid,String start,String end)async{
     var response=await crud.postData(AppLinks.childrenanswerfamlycore, {
      "userId":userid.toString(),
      "start":start.toString(),
      "end":end.toString()
      
     });
    return response.fold((l) => l, (r) => r);
  }

getchildrenResultData(String userid)async{
     var response=await crud.postData(AppLinks.childrenfamlyresultexam, {
      "userId":userid.toString(),
      
     });
    return response.fold((l) => l, (r) => r);
  }



 }