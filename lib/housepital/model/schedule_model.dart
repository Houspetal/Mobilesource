class ScheduleModel {
  String? patientName;
  String? uid;
  String? userId;
  String? mobile;
  String? description;
  String? doctorName;
  String? date;
  String? time;

  ScheduleModel({
    this.patientName,
    this.mobile,
    this.uid,
    this.description,
    this.doctorName,
    this.userId,
    this.date,
    this.time,
  });

  ScheduleModel.fromJson(Map<String, dynamic> json) {
    patientName = json['patient_name'] as String?;
    mobile = json['mobile'] as String?;
    uid = json['uid'] as String?;
    userId = json['userId'] as String?;
    description = json['description'] as String?;
    doctorName = json['doctor_name'] as String?;
    date = json['date'] as String?;
    time = json['time'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['patient_name'] = patientName;
    json['mobile'] = mobile;
    json['uid'] = uid;
    json['userId'] = userId;
    json['description'] = description;
    json['doctor_name'] = doctorName;
    json['date'] = date;
    json['time'] = time;
    return json;
  }
}
