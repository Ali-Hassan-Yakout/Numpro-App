part of 'gauss_jordan_screen_cubit.dart';

@immutable
abstract class GaussJordanScreenState {}

class GaussJordanScreenInitial extends GaussJordanScreenState {}

class AnswerSuccess extends GaussJordanScreenState {}

class AnswerFailure extends GaussJordanScreenState {}

class PartialPivotChange extends GaussJordanScreenState {}
