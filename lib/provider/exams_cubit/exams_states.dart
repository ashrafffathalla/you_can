import 'package:equatable/equatable.dart';
abstract class ExamsState extends Equatable {
  const ExamsState();
  @override
  List<Object> get props => [];
}
class GetAllExamsInitial extends ExamsState {}

class GetAllExamsLoading extends ExamsState {}

class GetAllExamsLoaded extends ExamsState {}
class GetAllExamsError extends ExamsState {
  final String error;
  const GetAllExamsError({required this.error});
  @override
  List<Object> get props => [error];
}
class ExamQuestionLoading extends ExamsState {}
class ExamQuestionLoaded extends ExamsState {}
class ExamQuestionError extends ExamsState {
  final String error;
  const ExamQuestionError({required this.error});
  @override
  List<Object> get props => [error];
}
class EnrollmentLoading extends ExamsState {}
class EnrollmentLoaded extends ExamsState {}
class EnrollmentError extends ExamsState {
  final String error;
  const EnrollmentError({required this.error});
  @override
  List<Object> get props => [error];
}