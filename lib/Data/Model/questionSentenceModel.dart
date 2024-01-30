class QuestionSentenceModel {
  int? questionId;
  String? questionText;
  String? questionOption1;
  String? questionOption2;
  String? questionOption3;
  String? questionOption4;
  String? questionAnswer;
  String? questionVideo;

  QuestionSentenceModel(
      {this.questionId,
      this.questionText,
      this.questionOption1,
      this.questionOption2,
      this.questionOption3,
      this.questionOption4,
      this.questionAnswer,
      this.questionVideo});

  QuestionSentenceModel.fromJson(Map<String, dynamic> json) {
    questionId = json['Question_Id'];
    questionText = json['Question_text'];
    questionOption1 = json['Question_option1'];
    questionOption2 = json['Question_option2'];
    questionOption3 = json['Question_option3'];
    questionOption4 = json['Question_option4'];
    questionAnswer = json['Question_answer'];
    questionVideo = json['Question_video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Question_Id'] = questionId;
    data['Question_text'] = questionText;
    data['Question_option1'] = questionOption1;
    data['Question_option2'] = questionOption2;
    data['Question_option3'] = questionOption3;
    data['Question_option4'] = questionOption4;
    data['Question_answer'] = questionAnswer;
    data['Question_video'] = questionVideo;
    return data;
  }
}