class SentenCeModel {
  int? sentenceId;
  String? sentenceBody;
  String? sentenceVideo;

  SentenCeModel({this.sentenceId, this.sentenceBody, this.sentenceVideo});

  SentenCeModel.fromJson(Map<String, dynamic> json) {
    sentenceId = json['sentence_Id'];
    sentenceBody = json['sentence_body'];
    sentenceVideo = json['sentence_video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sentence_Id'] = sentenceId;
    data['sentence_body'] = sentenceBody;
    data['sentence_video'] = sentenceVideo;
    return data;
  }
}