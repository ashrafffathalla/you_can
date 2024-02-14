import 'package:equatable/equatable.dart';
abstract class AllLevelsState extends Equatable {
  const AllLevelsState();
  @override
  List<Object> get props => [];
}
class GetAllLevelsInitial extends AllLevelsState {}

class GetAllLevelsLoading extends AllLevelsState {}

class GetAllLevelsLoaded extends AllLevelsState {}
class GetAllLevelsError extends AllLevelsState {
  final String error;
  const GetAllLevelsError({required this.error});
  @override
  List<Object> get props => [error];
}
///----------Lessons-----------------
///--------------------
///--------------------
class GetAllLessonsLoading extends AllLevelsState {}
class GetAllLessonsLoaded extends AllLevelsState {}
class GetAllLessonsError extends AllLevelsState {
  final String error;
  const GetAllLessonsError({required this.error});
  @override
  List<Object> get props => [error];
}
///----------comments-----------------
///--------------------
///--------------------
class AddCommentLoading extends AllLevelsState {}
class AddCommentLoaded extends AllLevelsState {}
class AddCommentError extends AllLevelsState {
  final String error;
  const AddCommentError({required this.error});
  @override
  List<Object> get props => [error];
}