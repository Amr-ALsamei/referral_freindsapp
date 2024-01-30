

import 'package:referral_freindsapp/core/class/Crud.dart';
import 'package:referral_freindsapp/linkAPI.dart';

class QuestionSentenceData {
  Crud crud;
  QuestionSentenceData(this.crud);

  PostData()async{
     var response=await crud.postData(AppLinks.questionsentenceview, { });
    return response.fold((l) => l, (r) => r);
  }

 

addAnswerData(String userid,String questionid,int score)async{
     var response=await crud.postData(AppLinks.answersentenceadd, {
      "userid":userid.toString(),
      "questionId":questionid.toString(),
      "score":score.toString(),
     });
    return response.fold((l) => l, (r) => r);
  }

getScoreData(String userid,String start,String end)async{
     var response=await crud.postData(AppLinks.answersentencescore, {
      "userId":userid.toString(),
      "start":start.toString(),
      "end":end.toString()
      
     });
    return response.fold((l) => l, (r) => r);
  }

getResultexamData(String userid)async{
     var response=await crud.postData(AppLinks.sentenceresultexam, {
      "userId":userid.toString(),
      
     });
    return response.fold((l) => l, (r) => r);
  }

////////////////////////////////////////////
addChildrenAnswerData(String userid,String questionid,int score)async{
     var response=await crud.postData(AppLinks.answerchildrensentenceadd, {
      "userid":userid.toString(),
      "questionId":questionid.toString(),
      "score":score.toString(),
     });
    return response.fold((l) => l, (r) => r);
  }

getChildrenScoreData(String userid,String start,String end)async{
     var response=await crud.postData(AppLinks.childrenanswersentencescore, {
      "userId":userid.toString(),
      "start":start.toString(),
      "end":end.toString()
      
     });
    return response.fold((l) => l, (r) => r);
  }

getchildrenResultData(String userid)async{
     var response=await crud.postData(AppLinks.childrensentenceresultexam, {
      "userId":userid.toString(),
      
     });
    return response.fold((l) => l, (r) => r);
  }



 }