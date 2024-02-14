class AddCommentsModel {
  Data? data;

  AddCommentsModel({this.data});

  AddCommentsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  Student? student;
  String? body;

  Data({this.id, this.student, this.body});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    student =
    json['student'] != null ? new Student.fromJson(json['student']) : null;
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.student != null) {
      data['student'] = this.student!.toJson();
    }
    data['body'] = this.body;
    return data;
  }
}

class Student {
  int? id;
  String? fullName;
  String? birthDate;
  String? phone;
  String? code;
  String? createdAt;
  String? updatedAt;

  Student(
      {this.id,
        this.fullName,
        this.birthDate,
        this.phone,
        this.code,
        this.createdAt,
        this.updatedAt});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    birthDate = json['birth_date'];
    phone = json['phone'];
    code = json['code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['birth_date'] = this.birthDate;
    data['phone'] = this.phone;
    data['code'] = this.code;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}