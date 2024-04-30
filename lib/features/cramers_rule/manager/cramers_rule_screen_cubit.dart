import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numpro/core/utils/app_toast.dart';

part 'cramers_rule_screen_state.dart';

class CramersRuleScreenCubit extends Cubit<CramersRuleScreenState> {
  CramersRuleScreenCubit() : super(CramersRuleScreenInitial());
  final formKey = GlobalKey<FormState>();
  final r0c0 = TextEditingController();
  final r0c1 = TextEditingController();
  final r0c2 = TextEditingController();
  final r0c3 = TextEditingController();

  final r1c0 = TextEditingController();
  final r1c1 = TextEditingController();
  final r1c2 = TextEditingController();
  final r1c3 = TextEditingController();

  final r2c0 = TextEditingController();
  final r2c1 = TextEditingController();
  final r2c2 = TextEditingController();
  final r2c3 = TextEditingController();
  List<List<double>> matrix = [
    [0.0, 0.0, 0.0, 0.0],
    [0.0, 0.0, 0.0, 0.0],
    [0.0, 0.0, 0.0, 0.0],
  ];
  List<List<double>> temp = [
    [0.0, 0.0, 0.0],
    [0.0, 0.0, 0.0],
    [0.0, 0.0, 0.0],
  ];
  String output = '';
  double x1 = 0, x2 = 0, x3 = 0;
  bool calculate = false;

  void copyMatrix() {
    for (int row = 0; row < temp.length; row++) {
      for (int col = 0; col < temp[0].length; col++) {
        temp[row][col] = matrix[row][col];
      }
    }
  }

  void swap(int col) {
    copyMatrix();
    for (int row = 0; row < temp.length; row++) {
      temp[row][col] = matrix[row][3];
    }
    output += 'Swap between C${col + 1} & B\n';
    display(temp);
  }

  void display(List<List<double>> matrix) {
    for (int row = 0; row < matrix.length; row++) {
      output += '[';
      for (int col = 0; col < matrix[0].length; col++) {
        if (col == 3) {
          output += '|';
        }
        output += ' ${matrix[row][col].toStringAsFixed(2)} ';
      }
      output += ']\n';
    }
    output += '\n';
  }

  void cramersRule() {
    if (!formKey.currentState!.validate()) {
      displayToast('Invalid Matrix');
      return;
    }
    output = '';
    calculate = true;
    double d = 0, r0 = 0, r1 = 0, r2 = 0;
    List<double> determine = [];
    display(matrix);
    copyMatrix();
    r0 = temp[0][0] * ((temp[1][1] * temp[2][2]) - (temp[1][2] * temp[2][1]));
    r1 = temp[0][1] * ((temp[1][0] * temp[2][2]) - (temp[1][2] * temp[2][0]));
    r2 = temp[0][2] * ((temp[1][0] * temp[2][1]) - (temp[1][1] * temp[2][0]));
    d = r0 + (-r1) + r2;
    display(temp);
    output += 'D = $d\n\n';
    for (int i = 0; i < 3; i++) {
      swap(i);
      r0 = temp[0][0] * ((temp[1][1] * temp[2][2]) - (temp[1][2] * temp[2][1]));
      r1 = temp[0][1] * ((temp[1][0] * temp[2][2]) - (temp[1][2] * temp[2][0]));
      r2 = temp[0][2] * ((temp[1][0] * temp[2][1]) - (temp[1][1] * temp[2][0]));
      determine.add(r0 + (-r1) + r2);
      output += 'D${i + 1} = ${determine[i]}\n\n';
    }
    x1 = determine[0] / d;
    x2 = determine[1] / d;
    x3 = determine[2] / d;
    r0c0.clear();
    r0c1.clear();
    r0c2.clear();
    r0c3.clear();

    r1c0.clear();
    r1c1.clear();
    r1c2.clear();
    r1c3.clear();

    r2c0.clear();
    r2c1.clear();
    r2c2.clear();
    r2c3.clear();
    emit(AnswerSuccess());
  }
}
