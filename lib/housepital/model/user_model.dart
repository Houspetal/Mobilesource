import 'package:grade_project/housepital/model/person.dart';

class UserModel extends Person {
  String? username;
  String? email;
  String? phone;
  String? bio;
  String? uid;
  String? image;
  bool? isApproved;

  UserModel({
    this.username,
    this.email,
    this.uid,
    this.bio,
    this.phone,
    this.image,
    this.isApproved = true,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'] as String?;
    email = json['email'] as String?;
    phone = json['phone'] as String?;
    uid = json['uid'] as String?;
    bio = json['bio'] as String?;
    image = json['image'] as String?;
    isApproved = json['isApproved'] as bool?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['username'] = username;
    json['email'] = email;
    json['uid'] = uid;
    json['bio'] = bio;
    json['phone'] = phone;
    json['image'] = image;
    json['isApproved'] = isApproved;
    return json;
  }
}
