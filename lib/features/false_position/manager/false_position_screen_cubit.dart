import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:numpro/core/utils/app_toast.dart';

part 'false_position_screen_state.dart';

class FalsePositionScreenCubit extends Cubit<FalsePositionScreenState> {
  FalsePositionScreenCubit() : super(FalsePositionScreenInitial());
  final formKey = GlobalKey<FormState>();
  final functionController = TextEditingController();
  final lowerValueController = TextEditingController();
  final upperValueController = TextEditingController();
  final errorController = TextEditingController();
  List<String> table = [];
  double root = 0;
  bool calculate = false;

  double f(double x) {
    final parser = Parser();
    final function = parser.parse(functionController.text);
    final contextModel = ContextModel();
    final variable = Variable('x');
    contextModel.bindVariable(variable, Number(x));
    return function.evaluate(EvaluationType.REAL, contextModel);
  }

  void falsePosition() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    table.clear();
    root = 0;
    calculate = true;
    double xl, xu, xrNew = 0, xrOld = 0, error = 0;
    int i = 1;
    xl = double.parse(lowerValueController.text);
    xu = double.parse(upperValueController.text);
    table.add('i xl f(xl) xu f(xu) xr f(xr) error');
    if (f(xl) * f(xu) > 0) {
      displayToast('The polynomial has no solution');
      emit(AnswerFailure());
      return;
    }
    do {
      xrOld = xrNew;
      xrNew = xu - ((f(xu) * (xl - xu)) / (f(xl) - f(xu)));
      error = ((xrNew - xrOld) / xrNew) * 100;
      if (i == 1) {
        table.add(
            '$i ${xl.toStringAsFixed(3)} ${f(xl).toStringAsFixed(3)} ${xu.toStringAsFixed(3)} ${f(xu).toStringAsFixed(3)} ${xrNew.toStringAsFixed(3)} ${f(xrNew).toStringAsFixed(3)} -----');
      } else {
        table.add(
            '$i ${xl.toStringAsFixed(3)} ${f(xl).toStringAsFixed(3)} ${xu.toStringAsFixed(3)} ${f(xu).toStringAsFixed(3)} ${xrNew.toStringAsFixed(3)} ${f(xrNew).toStringAsFixed(3)} ${error.abs().toStringAsFixed(3)}');
      }
      i++;
      if (f(xl) * f(xrNew) > 0) {
        xl = xrNew;
      } else if (f(xl) * f(xrNew) < 0) {
        xu = xrNew;
      } else {
        root = xrNew;
        emit(AnswerSuccess());
        return;
      }
    } while (error.abs() > double.parse(errorController.text));
    root = xrNew;
    emit(AnswerSuccess());
  }
}
