part of 'lu_decomposition_screen_cubit.dart';

@immutable
abstract class LuDecompositionScreenState {}

class LuDecompositionScreenInitial extends LuDecompositionScreenState {}

class AnswerSuccess extends LuDecompositionScreenState {}

class AnswerFailure extends LuDecompositionScreenState {}

class PartialPivotChange extends LuDecompositionScreenState {}
