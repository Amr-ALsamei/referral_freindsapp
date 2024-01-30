class FavoriteModel {
  int? favoriteId;
  int? favoriteChildId;
  int? favoriteLetterId;
  int? letterId;
  String? letterName;
  String? letterVideo;
  int? chidlrenParentId;

  FavoriteModel(
      {this.favoriteId,
      this.favoriteChildId,
      this.favoriteLetterId,
      this.letterId,
      this.letterName,
      this.letterVideo,
      this.chidlrenParentId});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['Favorite_Id'];
    favoriteChildId = json['Favorite_childId'];
    favoriteLetterId = json['favorite_letterId'];
    letterId = json['letter_Id'];
    letterName = json['letter_Name'];
    letterVideo = json['letter_Video'];
    chidlrenParentId = json['chidlren_parentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Favorite_Id'] = favoriteId;
    data['Favorite_childId'] = favoriteChildId;
    data['favorite_letterId'] = favoriteLetterId;
    data['letter_Id'] = letterId;
    data['letter_Name'] = letterName;
    data['letter_Video'] = letterVideo;
    data['chidlren_parentId'] = chidlrenParentId;
    return data;
  }
}