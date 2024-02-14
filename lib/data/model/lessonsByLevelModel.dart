class LessonsByLevelModel {
  int? count;
  List<Data>? data;
  LessonsByLevelModel({this.count, this.data});

  LessonsByLevelModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? description;
  String? duration;
  Level? level;
  Teacher? teacher;
  List<Comments>? comments;
  // List<Voices>? voices;
  int? assignmentsCount;
  List<Assignments>? assignments;
  List<Media>? media;
  bool? isActive;

  Data(
      {this.id,
        this.title,
        this.description,
        this.duration,
        this.level,
        this.teacher,
        this.comments,
        // this.voices,
        this.assignmentsCount,
        this.assignments,
        this.media,
        this.isActive});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    duration = json['duration'];
    level = json['level'] != null ? new Level.fromJson(json['level']) : null;
    teacher =
    json['teacher'] != null ? new Teacher.fromJson(json['teacher']) : null;
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
    // if (json['voices'] != null) {
    //   voices = <Null>[];
    //   json['voices'].forEach((v) {
    //     voices!.add(new Null.fromJson(v));
    //   });
    // }
    assignmentsCount = json['assignments_count'];
    if (json['assignments'] != null) {
      assignments = <Assignments>[];
      json['assignments'].forEach((v) {
        assignments!.add(new Assignments.fromJson(v));
      });
    }
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(new Media.fromJson(v));
      });
    }
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['duration'] = this.duration;
    if (this.level != null) {
      data['level'] = this.level!.toJson();
    }
    if (this.teacher != null) {
      data['teacher'] = this.teacher!.toJson();
    }
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    // if (this.voices != null) {
    //   data['voices'] = this.voices!.map((v) => v.toJson()).toList();
    // }
    data['assignments_count'] = this.assignmentsCount;
    if (this.assignments != null) {
      data['assignments'] = this.assignments!.map((v) => v.toJson()).toList();
    }
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    data['is_active'] = this.isActive;
    return data;
  }
}

class Level {
  int? id;
  String? name;
  String? description;
  bool? isActive;

  Level({this.id, this.name, this.description, this.isActive});

  Level.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['is_active'] = this.isActive;
    return data;
  }
}

class Teacher {
  int? id;
  String? fullName;
  String? birthDate;
  String? phone;
  Null? code;
  String? createdAt;
  String? updatedAt;

  Teacher(
      {this.id,
        this.fullName,
        this.birthDate,
        this.phone,
        this.code,
        this.createdAt,
        this.updatedAt});

  Teacher.fromJson(Map<String, dynamic> json) {
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

class Comments {
  int? id;
  Student? student;
  String? body;
  String? created_at;
  Comments({this.id, this.student, this.body,this.created_at});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    student =
    json['student'] != null ? new Student.fromJson(json['student']) : null;
    body = json['body'];
    created_at = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.student != null) {
      data['student'] = this.student!.toJson();
    }
    data['body'] = this.body;
    data['created_at'] = this.created_at;
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

class Assignments {
  int? id;
  String? question;
  List<Answers>? answers;

  Assignments({this.id, this.question, this.answers});

  Assignments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(new Answers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    if (this.answers != null) {
      data['answers'] = this.answers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Answers {
  int? id;
  String? answer;
  int? correctAnswer;

  Answers({this.id, this.answer, this.correctAnswer});

  Answers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    answer = json['answer'];
    correctAnswer = json['correct_answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['answer'] = this.answer;
    data['correct_answer'] = this.correctAnswer;
    return data;
  }
}

class Media {
  int? id;
  String? name;
  String? description;
  String? path;
  String? type;
  int? order;
  bool? isMain;
  int? size;
  String? createdAt;
  String? updatedAt;

  Media(
      {this.id,
        this.name,
        this.description,
        this.path,
        this.type,
        this.order,
        this.isMain,
        this.size,
        this.createdAt,
        this.updatedAt});

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    path = json['path'];
    type = json['type'];
    order = json['order'];
    isMain = json['is_main'];
    size = json['size'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['path'] = this.path;
    data['type'] = this.type;
    data['order'] = this.order;
    data['is_main'] = this.isMain;
    data['size'] = this.size;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}