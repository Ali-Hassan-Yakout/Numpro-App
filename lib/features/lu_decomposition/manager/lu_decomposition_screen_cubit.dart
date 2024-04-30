import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numpro/core/utils/app_toast.dart';

part 'lu_decomposition_screen_state.dart';

class LuDecompositionScreenCubit extends Cubit<LuDecompositionScreenState> {
  LuDecompositionScreenCubit() : super(LuDecompositionScreenInitial());
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
  bool partialPivot = false;
  List<List<double>> matrix = [
    [0.0, 0.0, 0.0, 0.0],
    [0.0, 0.0, 0.0, 0.0],
    [0.0, 0.0, 0.0, 0.0],
  ];
  List<double> b = [0, 0, 0];
  String output = '';
  double x1 = 0, x2 = 0, x3 = 0;
  double m21 = 0, m31 = 0, m32 = 0;
  bool calculate = false;
  bool swap12 = false;

  void swap(int r1, int r2) {
    for (int i = 0; i < matrix[0].length; i++) {
      double temp = matrix[r1][i];
      matrix[r1][i] = matrix[r2][i];
      matrix[r2][i] = temp;
    }
    output += 'Swap between R${r1 + 1} & R${r2 + 1}\n';
    display();
    for (int i = 0; i < b.length; i++) {
      double temp = b[r1];
      b[r1] = b[r2];
      b[r2] = temp;
    }
  }

  void display() {
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

  void gaussElimination() {
    display();
    if (partialPivot) {
      if (matrix[0][0].abs() < matrix[1][0].abs() ||
          matrix[0][0].abs() < matrix[2][0].abs()) {
        if (matrix[1][0].abs() > matrix[2][0].abs()) {
          swap(0, 1);
        } else {
          swap(0, 2);
        }
      }
    }
    m21 = matrix[1][0] / matrix[0][0];
    m31 = matrix[2][0] / matrix[0][0];
    for (int col = 0; col < matrix[0].length; col++) {
      matrix[1][col] = matrix[1][col] - m21 * matrix[0][col];
    }
    for (int col = 0; col < matrix[0].length; col++) {
      matrix[2][col] = matrix[2][col] - m31 * matrix[0][col];
    }
    display();
    if (partialPivot) {
      if (matrix[1][1].abs() < matrix[2][1].abs()) {
        swap12 = true;
        swap(1, 2);
      }
    }
    m32 = matrix[2][1] / matrix[1][1];
    for (int col = 0; col < matrix[0].length; col++) {
      matrix[2][col] = matrix[2][col] - m32 * matrix[1][col];
    }
    display();
    x3 = matrix[2][3] / matrix[2][2];
    x2 = (matrix[1][3] - matrix[1][2] * x3) / matrix[1][1];
    x1 =
        (matrix[0][3] - (matrix[0][1] * x2 + matrix[0][2] * x3)) / matrix[0][0];
  }

  void luDecomposition() {
    if (!formKey.currentState!.validate()) {
      displayToast('Invalid Matrix');
      calculate = false;
      return;
    }
    b = [
      matrix[0][3],
      matrix[1][3],
      matrix[2][3],
    ];
    output = '';
    swap12 = false;
    calculate = true;
    gaussElimination();
    double c1 = 0, c2 = 0, c3 = 0;
    List<List<double>> l = [
      [0.0, 0.0, 0.0, 0.0],
      [0.0, 0.0, 0.0, 0.0],
      [0.0, 0.0, 0.0, 0.0],
    ];
    l[0][0] = 1;
    l[1][1] = 1;
    l[2][2] = 1;
    if (swap12) {
      l[1][0] = m31;
      l[2][0] = m21;
    } else {
      l[1][0] = m21;
      l[2][0] = m31;
    }
    l[2][1] = m32;
    l[0][3] = b[0];
    l[1][3] = b[1];
    l[2][3] = b[2];
    output += 'L * C = B\n';
    for (int row = 0; row < l.length; row++) {
      output += '[';
      for (int col = 0; col < 3; col++) {
        output += ' ${l[row][col].toStringAsFixed(2)} ';
      }
      output += ']';
      output += '[C${row + 1}]';
      output += ' = [${l[row][3].toStringAsFixed(2)}]\n';
    }
    c1 = l[0][3] / l[0][0];
    c2 = (l[1][3] - l[1][0] * c1) / l[1][1];
    c3 = (l[2][3] - (l[2][0] * c1 + l[2][1] * c2)) / l[2][2];
    output +=
        '\nC1 =${c1.toStringAsFixed(2)}, C2 =${c2.toStringAsFixed(2)}, C3 =${c3.toStringAsFixed(2)}\n';
    matrix[0][3] = c1;
    matrix[1][3] = c2;
    matrix[2][3] = c3;
    output += 'U * X = C\n';
    for (int row = 0; row < matrix.length; row++) {
      output += '[';
      for (int col = 0; col < 3; col++) {
        output += ' ${matrix[row][col].toStringAsFixed(2)} ';
      }
      output += ']';
      output += '[X${row + 1}]';
      output += ' = [${matrix[row][3].toStringAsFixed(2)}]\n';
    }
    x3 = matrix[2][3] / matrix[2][2];
    x2 = (matrix[1][3] - matrix[1][2] * x3) / matrix[1][1];
    x1 =
        (matrix[0][3] - (matrix[0][1] * x2 + matrix[0][2] * x3)) / matrix[0][0];
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

  void onPartialPivotChange() => emit(PartialPivotChange());
}
