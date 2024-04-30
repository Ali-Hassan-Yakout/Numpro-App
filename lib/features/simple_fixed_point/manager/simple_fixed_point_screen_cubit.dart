import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';

part 'simple_fixed_point_screen_state.dart';

class SimpleFixedPointScreenCubit extends Cubit<SimpleFixedPointScreenState> {
  SimpleFixedPointScreenCubit() : super(SimpleFixedPointScreenInitial());
  final formKey = GlobalKey<FormState>();
  final functionController = TextEditingController();
  final initialValueController = TextEditingController();
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

  void simpleFixedPoint() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    table.clear();
    root = 0;
    calculate = true;
    double xiPlus1 = 0, xi = 0, error = 0;
    int i = 1;
    xiPlus1 = double.parse(initialValueController.text);
    table.add('i xi xi+1 error');
    do {
      xi = xiPlus1;
      xiPlus1 = f(xi);
      if (i == 1) {
        table.add(
            '$i ${xi.toStringAsFixed(3)} ${xiPlus1.toStringAsFixed(3)} -----');
      } else {
        table.add(
            '$i ${xi.toStringAsFixed(3)} ${xiPlus1.toStringAsFixed(3)} ${error.abs().toStringAsFixed(3)}');
      }
      error = ((xiPlus1 - xi) / xiPlus1) * 100;
      i++;
    } while (error.abs() > double.parse(errorController.text));
    root = xi;
    emit(AnswerSuccess());
  }
}
