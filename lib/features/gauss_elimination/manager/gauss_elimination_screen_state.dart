part of 'gauss_elimination_screen_cubit.dart';

@immutable
abstract class GaussEliminationScreenState {}

class GaussEliminationScreenInitial extends GaussEliminationScreenState {}

class AnswerSuccess extends GaussEliminationScreenState {}

class AnswerFailure extends GaussEliminationScreenState {}

class PartialPivotChange extends GaussEliminationScreenState {}
