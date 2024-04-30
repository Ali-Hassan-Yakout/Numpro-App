import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';

part 'newton_screen_state.dart';

class NewtonScreenCubit extends Cubit<NewtonScreenState> {
  NewtonScreenCubit() : super(NewtonScreenInitial());
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

  double fDash(double x) {
    final parser = Parser();
    final function = parser.parse(functionController.text);
    final contextModel = ContextModel();
    final variable = Variable('x');
    contextModel.bindVariable(variable, Number(x));
    return function.derive('x').evaluate(EvaluationType.REAL, contextModel);
  }

  void newton() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    table.clear();
    root = 0;
    calculate = true;
    double xi = 0, xiOld = 0, error = 0;
    int i = 1;
    xi = double.parse(initialValueController.text);
    table.add('i xi f(xi) f\'(xi) error');
    do {
      table.add('$i ${xi.toStringAsFixed(3)} ${f(xi).toStringAsFixed(3)} ${fDash(xi).toStringAsFixed(3)} ${error.abs().toStringAsFixed(3)}');
      xiOld = xi;
      xi = xi - f(xi) / fDash(xi);
      error = ((xi - xiOld) / xi) * 100;
      i++;
    } while (error.abs() > double.parse(errorController.text));
    root = xi;
    emit(AnswerSuccess());
  }
}
