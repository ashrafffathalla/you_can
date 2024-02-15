class OnlineMeeting {
  Data? data;

  OnlineMeeting({this.data});

  OnlineMeeting.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? levelName;
  String? lessonName;
  String? teacherName;
  int? duration;
  String? startAt;
  String? joinUrl;

  Data(
      {this.id,
        this.title,
        this.levelName,
        this.lessonName,
        this.teacherName,
        this.duration,
        this.startAt,
        this.joinUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    levelName = json['level_name'];
    lessonName = json['lesson_name'];
    teacherName = json['teacher_name'];
    duration = json['duration'];
    startAt = json['start_at'];
    joinUrl = json['join_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['level_name'] = this.levelName;
    data['lesson_name'] = this.lessonName;
    data['teacher_name'] = this.teacherName;
    data['duration'] = this.duration;
    data['start_at'] = this.startAt;
    data['join_url'] = this.joinUrl;
    return data;
  }
}