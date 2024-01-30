class WatchingModel {
  int? watchingId;
  int? watchingLetterId;
  int? watchingChildId;
  int? letterId;
  String? letterName;
  String? letterVideo;
  int? chidlrenParentId;

  WatchingModel(
      {this.watchingId,
      this.watchingLetterId,
      this.watchingChildId,
      this.letterId,
      this.letterName,
      this.letterVideo,
      this.chidlrenParentId});

  WatchingModel.fromJson(Map<String, dynamic> json) {
    watchingId = json['watching_Id'];
    watchingLetterId = json['watching_letterId'];
    watchingChildId = json['watching_childId'];
    letterId = json['letter_Id'];
    letterName = json['letter_Name'];
    letterVideo = json['letter_Video'];
    chidlrenParentId = json['chidlren_parentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['watching_Id'] = watchingId;
    data['watching_letterId'] = watchingLetterId;
    data['watching_childId'] = watchingChildId;
    data['letter_Id'] = letterId;
    data['letter_Name'] = letterName;
    data['letter_Video'] = letterVideo;
    data['chidlren_parentId'] = chidlrenParentId;
    return data;
  }
}