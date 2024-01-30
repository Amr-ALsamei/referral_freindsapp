class ResultExamModel {
  int? answerId;
  int? answerUserId;
  int? answerQusID;
  int? score;
  int? questionId;
  String? questionText;
  String? questionOption1;
  String? questionOption2;
  String? questionOption3;
  String? questionOption4;
  String? questionAnswer;
  String? questionImage;
  int? questionScore;

  ResultExamModel(
      {this.answerId,
      this.answerUserId,
      this.answerQusID,
      this.score,
      this.questionId,
      this.questionText,
      this.questionOption1,
      this.questionOption2,
      this.questionOption3,
      this.questionOption4,
      this.questionAnswer,
      this.questionImage,
      this.questionScore});

  ResultExamModel.fromJson(Map<String, dynamic> json) {
    answerId = json['answer_Id'];
    answerUserId = json['answer_userId'];
    answerQusID = json['answer_qusID'];
    score = json['score'];
    questionId = json['Question_Id'];
    questionText = json['Question_text'];
    questionOption1 = json['Question_option1'];
    questionOption2 = json['Question_option2'];
    questionOption3 = json['Question_option3'];
    questionOption4 = json['Question_option4'];
    questionAnswer = json['Question_answer'];
    questionImage = json['Question_image'];
    questionScore = json['Question_score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['answer_Id'] = answerId;
    data['answer_userId'] = answerUserId;
    data['answer_qusID'] = answerQusID;
    data['score'] = score;
    data['Question_Id'] = questionId;
    data['Question_text'] = questionText;
    data['Question_option1'] = questionOption1;
    data['Question_option2'] = questionOption2;
    data['Question_option3'] = questionOption3;
    data['Question_option4'] = questionOption4;
    data['Question_answer'] = questionAnswer;
    data['Question_image'] = questionImage;
    data['Question_score'] = questionScore;
    return data;
  }
}