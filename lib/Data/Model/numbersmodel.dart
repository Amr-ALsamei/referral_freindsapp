class NumbersModel {
  int? numberId;
  String? numberName;
  String? numberVideo;

  NumbersModel({this.numberId, this.numberName, this.numberVideo});

  NumbersModel.fromJson(Map<String, dynamic> json) {
    numberId = json['Number_Id'];
    numberName = json['Number_name'];
    numberVideo = json['Number_video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Number_Id'] = numberId;
    data['Number_name'] = numberName;
    data['Number_video'] = numberVideo;
    return data;
  }
}