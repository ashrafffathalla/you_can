class ExamQuestionsModel {
  Data? data;

  ExamQuestionsModel({this.data});

  ExamQuestionsModel.fromJson(Map<String, dynamic> json) {
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
  List<String>? answers;
  String? rightAnswer;
  int? isLast;

  Data({this.id, this.title, this.answers, this.rightAnswer, this.isLast});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    answers = json['answers'].cast<String>();
    rightAnswer = json['right_answer'];
    isLast = json['is_last'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['answers'] = this.answers;
    data['right_answer'] = this.rightAnswer;
    data['is_last'] = this.isLast;
    return data;
  }
}