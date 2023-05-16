class VideoModel {
  String? media;
  String? title;
  String? thumpnail;
  String? description;


  VideoModel(
      {required this.media, required this.title, required this.thumpnail,this.description});

  VideoModel.fromJson(Map<String, dynamic> json) {
    media = json["media"];
    title = json["title"];
    thumpnail = json["thumpnail"];
    description = json["description"];

  }

  Map<String, dynamic> toJson() {
    return {
      "media":this.media,
      "title":this.title,
      "thumpnail":this.thumpnail,
      "description":this.description,
    };
  }
}
