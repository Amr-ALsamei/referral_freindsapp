class WordsModel {
  int? wordId;
  String? wordBody;
  String? wordVideo;

  WordsModel({this.wordId, this.wordBody, this.wordVideo});

  WordsModel.fromJson(Map<String, dynamic> json) {
    wordId = json['word_Id'];
    wordBody = json['word_body'];
    wordVideo = json['word_video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['word_Id'] = wordId;
    data['word_body'] = wordBody;
    data['word_video'] = wordVideo;
    return data;
  }
}