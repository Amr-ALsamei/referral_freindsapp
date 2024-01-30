class LetterVideoModel {
  int? letterId;
  String? letterName;
  String? letterVideo;

  LetterVideoModel({this.letterId, this.letterName, this.letterVideo});

  LetterVideoModel.fromJson(Map<String, dynamic> json) {
    letterId = json['letter_Id'];
    letterName = json['letter_Name'];
    letterVideo = json['letter_Video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['letter_Id'] = letterId;
    data['letter_Name'] = letterName;
    data['letter_Video'] = letterVideo;
    return data;
  }
}
