class UserModel {
  String? name;
  String? email;
  String? bio;
  String? image;
  String? token;

  UserModel({
    this.name,
    this.email,
    this.bio,
    this.image,
    this.token
  });

  UserModel.fromjson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    bio = json["bio"];
    image = json["image"];
     token = json["token"];
  }

  Map<String,dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "bio": bio,
      "image": image,
      "token":token,
    };
  }
}
