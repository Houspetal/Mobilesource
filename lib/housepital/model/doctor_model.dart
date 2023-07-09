import 'package:grade_project/housepital/model/person.dart';

class DoctorModel extends Person {
  String? name;
  String? email;
  String? fees;
  String? department;
  String? image;
  String? time;
  String? location;
  String? phone;
  String? rating;
  String? uid;
  String? type;
  String? username;
  bool? isApproved;

  DoctorModel({
    this.name,
    this.email,
    this.fees,
    this.time,
    this.department,
    this.image = 'assets/person.jpg',
    this.location,
    this.phone,
    this.rating = "3",
    this.uid,
    this.type = "Specialist",
    this.isApproved = false,
    this.username,
  });

  DoctorModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    email = json['email'] as String?;
    fees = json['fees'] as String?;
    department = json['department'] as String?;
    time = json['time'] as String?;
    image = json['image'] as String?;
    location = json['location'] as String?;
    phone = json['phone'] as String?;
    rating = json['rating'].toString() as String?;
    uid = json['uid'] as String?;
    type = json['type'] as String?;
    username = json['username'] as String?;
    isApproved = json['isApproved'] as bool?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['email'] = email;
    json['fees'] = fees;
    json['department'] = department;
    json['image'] = image;
    json['location'] = location;
    json['phone'] = phone;
    json['rating'] = rating;
    json['uid'] = uid;
    json['time'] = time;
    json['type'] = type;
    json['username'] = username;
    json['isApproved'] = isApproved;
    return json;
  }
}
