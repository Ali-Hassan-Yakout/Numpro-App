import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';

part 'secant_screen_state.dart';

class SecantScreenCubit extends Cubit<SecantScreenState> {
  SecantScreenCubit() : super(SecantScreenInitial());
  final formKey = GlobalKey<FormState>();
  final functionController = TextEditingController();
  final initialValueController = TextEditingController();
  final initialMinusOneValueController = TextEditingController();
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

  void secant() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    table.clear();
    root = 0;
    calculate = true;
    double xi = 0,xiOld = 0, xiMinus1 = 0, error = 0;
    int i = 1;
    xi = double.parse(initialValueController.text);
    xiMinus1 = double.parse(initialMinusOneValueController.text);
    table.add('i xi-1 f(xi-1) xi f(xi) error');
    do {
      if(i == 1){
        table.add('$i ${xiMinus1.toStringAsFixed(3)} ${f(xiMinus1).toStringAsFixed(3)} ${xi.toStringAsFixed(3)} ${f(xi).toStringAsFixed(3)} -----');
      }else{
        table.add('$i ${xiMinus1.toStringAsFixed(3)} ${f(xiMinus1).toStringAsFixed(3)} ${xi.toStringAsFixed(3)} ${f(xi).toStringAsFixed(3)} ${error.abs().toStringAsFixed(3)}');
      }
      error = ((xi - xiMinus1) / xi) * 100;
      xiOld = xi;
      xi = xi - ((f(xi) * (xiMinus1 - xi)) / (f(xiMinus1) - f(xi)));
      xiMinus1 = xiOld;
      i++;
    } while (error.abs() > double.parse(errorController.text));
    root = xi;
    emit(AnswerSuccess());
  }
}
