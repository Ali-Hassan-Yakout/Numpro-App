import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numpro/core/utils/app_toast.dart';

part 'gauss_elimination_screen_state.dart';

class GaussEliminationScreenCubit extends Cubit<GaussEliminationScreenState> {
  GaussEliminationScreenCubit() : super(GaussEliminationScreenInitial());
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
  String output = '';
  double x1 = 0, x2 = 0, x3 = 0;
  bool calculate = false;

  void swap(int r1, int r2) {
    for (int i = 0; i < matrix[0].length; i++) {
      double temp = matrix[r1][i];
      matrix[r1][i] = matrix[r2][i];
      matrix[r2][i] = temp;
    }
    output += 'Swap between R${r1 + 1} & R${r2 + 1}\n';
    display();
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
    if (!formKey.currentState!.validate()) {
      displayToast('Invalid Matrix');
      return;
    }
    output = '';
    calculate = true;
    double m21 = 0, m31 = 0, m32 = 0;
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
