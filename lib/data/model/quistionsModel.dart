import 'package:dio/dio.dart';

class QuestionModel{
  final String text;
  final List<Options> options;
  bool ?isLocked;
  Options? selectOption;
   QuestionModel({
    required this.text,
    required this.options,
     this.isLocked,
     this.selectOption,
});


}
class Options{
  final String text;
  final bool isCorrect;
  const Options({
    required this.text,
    required this.isCorrect,
});
}
final questions =[
  QuestionModel(text: 'What is the .....', options: [
    const Options(isCorrect: false,text: 'A - Water'),
    const Options(isCorrect: false,text: 'B - Water'),
    const Options(isCorrect: false,text: 'C - Water'),
    const Options(isCorrect: false,text: 'D - Water'),
  ], ),
  ///----------------------
  QuestionModel(text: 'We Need .....', options: [
    const Options(isCorrect: false,text: 'A - Water'),
    const Options(isCorrect: false,text: 'B - Water'),
    const Options(isCorrect: false,text: 'C - Water'),
    const Options(isCorrect: false,text: 'D - Water'),
  ], ),
  ///--------------------
  QuestionModel(text: 'We Need .....', options: [
    const Options(isCorrect: false,text: 'A - Water'),
    const Options(isCorrect: false,text: 'B - Water'),
    const Options(isCorrect: false,text: 'C - Water'),
    const Options(isCorrect: false,text: 'D - Water'),
  ], ),
  ///--------------------
  QuestionModel(text: 'We Need .....', options: [
    const Options(isCorrect: false,text: 'A - Water'),
    const Options(isCorrect: false,text: 'B - Water'),
    const Options(isCorrect: false,text: 'C - Water'),
    const Options(isCorrect: false,text: 'D - Water'),
  ], ),
  ///--------------------
];