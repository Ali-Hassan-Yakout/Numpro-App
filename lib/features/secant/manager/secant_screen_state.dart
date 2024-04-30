part of 'secant_screen_cubit.dart';

@immutable
abstract class SecantScreenState {}

class SecantScreenInitial extends SecantScreenState {}

class AnswerSuccess extends SecantScreenState {}

class AnswerFailure extends SecantScreenState {}
