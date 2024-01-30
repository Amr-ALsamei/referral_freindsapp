

import 'package:referral_freindsapp/core/class/Crud.dart';
import 'package:referral_freindsapp/linkAPI.dart';

class QuestionsData {
  Crud crud;
  QuestionsData(this.crud);

  PostData()async{
     var response=await crud.postData(AppLinks.questionview, { });
    return response.fold((l) => l, (r) => r);
  }

 addData(Map data)async{
     var response=await crud.postData(AppLinks.questionadd, data);
    return response.fold((l) => l, (r) => r);
  }

 editData(Map data)async{
     var response=await crud.postData(AppLinks.questionedit, data);
    return response.fold((l) => l, (r) => r);
  }

 deleteData(String id)async{
     var response=await crud.postData(AppLinks.questiondelete, {
      "Question_Id":id.toString()
     });
    return response.fold((l) => l, (r) => r);
  }

addAnswerData(String userid,String questionid,int score)async{
     var response=await crud.postData(AppLinks.answeradd, {
      "userid":userid.toString(),
      "questionId":questionid.toString(),
      "score":score.toString(),
     });
    return response.fold((l) => l, (r) => r);
  }

getScoreData(String userid,String start,String end)async{
     var response=await crud.postData(AppLinks.answerscore, {
      "userId":userid.toString(),
      "start":start.toString(),
      "end":end.toString()
      
     });
    return response.fold((l) => l, (r) => r);
  }

getResultexamData(String userid)async{
     var response=await crud.postData(AppLinks.resultexam, {
      "userId":userid.toString(),
      
     });
    return response.fold((l) => l, (r) => r);
  }

////////////////////////////////////////////
addChildrenAnswerData(String userid,String questionid,int score)async{
     var response=await crud.postData(AppLinks.answerchildrenadd, {
      "userid":userid.toString(),
      "questionId":questionid.toString(),
      "score":score.toString(),
     });
    return response.fold((l) => l, (r) => r);
  }

getChildrenScoreData(String userid,String start,String end)async{
     var response=await crud.postData(AppLinks.childrenanswerscore, {
      "userId":userid.toString(),
      "start":start.toString(),
      "end":end.toString()
      
     });
    return response.fold((l) => l, (r) => r);
  }

getchildrenResultData(String userid)async{
     var response=await crud.postData(AppLinks.childrenresultexam, {
      "userId":userid.toString(),
      
     });
    return response.fold((l) => l, (r) => r);
  }



 }