class DoctorModel {
  String? name;
  String? email;
  String? fees;
  String? department;
  String? image;
  String? time;
  String? location;
  String? mobile;
  String? rating;
  String? uid;
  String? type;
  String? username;

  DoctorModel({
    this.name,
    this.email,
    this.fees,
    this.time,
    this.department,
    this.image,
    this.location,
    this.mobile,
    this.rating,
    this.uid,
    this.type,
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
    mobile = json['mobile'] as String?;
    rating = json['rating'].toString() as String?;
    uid = json['uid'] as String?;
    type = json['type'] as String?;
    username = json['username'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['email'] = email;
    json['fees'] = fees;
    json['department'] = department;
    json['image'] = image;
    json['location'] = location;
    json['mobile'] = mobile;
    json['rating'] = rating;
    json['uid'] = uid;
    json['time'] = time;
    json['type'] = type;
    json['username'] = username;
    return json;
  }
}
