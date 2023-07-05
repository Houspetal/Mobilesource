class UserModel {
  String? username;
  String? email;
  String? phone;
  String? bio;
  String? uId;
  String? image;

  UserModel({
    this.username,
    this.email,
    this.uId,
    this.bio,
    this.phone,
    this.image,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'] as String?;
    email = json['email'] as String?;
    phone = json['phone'] as String?;
    uId = json['uId'] as String?;
    bio = json['bio'] as String?;
    image = json['image'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['username'] = username;
    json['email'] = email;
    json['uId'] = uId;
    json['bio'] = bio;
    json['phone'] = phone;
    json['image'] = image;
    return json;
  }
}
