import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:numpro/core/styles/colors.dart';

void displayToast(String msg){
  Fluttertoast.cancel();
  Fluttertoast.showToast(
    msg: msg,
    backgroundColor: secondaryBackground,
    fontSize: 20.sp,
    gravity: ToastGravity.BOTTOM,
    textColor: primaryText,
    toastLength: Toast.LENGTH_LONG,
  );
}