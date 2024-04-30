import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:numpro/core/styles/colors.dart';
import 'package:numpro/features/gauss_jordan/manager/gauss_jordan_screen_cubit.dart';

class GaussJordanScreen extends StatefulWidget {
  const GaussJordanScreen({super.key});

  @override
  State<GaussJordanScreen> createState() => _GaussJordanScreenState();
}

class _GaussJordanScreenState extends State<GaussJordanScreen> {
  final cubit = GaussJordanScreenCubit();

  @override
  void dispose() {
    super.dispose();
    cubit.r0c0.dispose();
    cubit.r0c1.dispose();
    cubit.r0c2.dispose();
    cubit.r0c3.dispose();

    cubit.r1c0.dispose();
    cubit.r1c1.dispose();
    cubit.r1c2.dispose();
    cubit.r1c3.dispose();

    cubit.r2c0.dispose();
    cubit.r2c1.dispose();
    cubit.r2c2.dispose();
    cubit.r2c3.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Gauss Jordan',
            style: TextStyle(
              color: primaryText,
              fontSize: 30.sp,
              fontWeight: FontWeight.bold,
              fontFamily: 'playFairDisplay',
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            splashColor: secondaryBackground,
            highlightColor: secondaryBackground,
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: primaryText,
              size: 25.r,
            ),
          ),
        ),
        body: Form(
          key: cubit.formKey,
          child: Padding(
            padding: EdgeInsets.all(10.r),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Text(
                        'Enter Matrix',
                        style: TextStyle(
                          color: primaryText,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'playFairDisplay',
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '[',
                            style: TextStyle(
                              color: primaryText,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'playFairDisplay',
                            ),
                          ),
                          Container(
                            width: 35.w,
                            height: 30.w,
                            margin: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              border: Border.all(color: primaryText),
                            ),
                            child: TextFormField(
                              controller: cubit.r0c0,
                              textAlign: TextAlign.center,
                              cursorColor: primaryText,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '';
                                }
                                cubit.matrix[0][0] = double.parse(value);
                                return null;
                              },
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'playFairDisplay',
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                focusedErrorBorder: const OutlineInputBorder(),
                                errorBorder: const OutlineInputBorder(),
                                enabledBorder: const OutlineInputBorder(),
                                focusedBorder: const OutlineInputBorder(),
                                errorStyle: TextStyle(
                                  fontSize: 0.sp,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 35.w,
                            height: 30.w,
                            margin: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              border: Border.all(color: primaryText),
                            ),
                            child: TextFormField(
                              controller: cubit.r0c1,
                              textAlign: TextAlign.center,
                              cursorColor: primaryText,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '';
                                }
                                cubit.matrix[0][1] = double.parse(value);
                                return null;
                              },
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'playFairDisplay',
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                focusedErrorBorder: const OutlineInputBorder(),
                                errorBorder: const OutlineInputBorder(),
                                enabledBorder: const OutlineInputBorder(),
                                focusedBorder: const OutlineInputBorder(),
                                errorStyle: TextStyle(
                                  fontSize: 0.sp,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 35.w,
                            height: 30.w,
                            margin: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              border: Border.all(color: primaryText),
                            ),
                            child: TextFormField(
                              controller: cubit.r0c2,
                              textAlign: TextAlign.center,
                              cursorColor: primaryText,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '';
                                }
                                cubit.matrix[0][2] = double.parse(value);
                                return null;
                              },
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'playFairDisplay',
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                focusedErrorBorder: const OutlineInputBorder(),
                                errorBorder: const OutlineInputBorder(),
                                enabledBorder: const OutlineInputBorder(),
                                focusedBorder: const OutlineInputBorder(),
                                errorStyle: TextStyle(
                                  fontSize: 0.sp,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '|',
                            style: TextStyle(
                              color: primaryText,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'playFairDisplay',
                            ),
                          ),
                          Container(
                            width: 35.w,
                            height: 30.w,
                            margin: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              border: Border.all(color: primaryText),
                            ),
                            child: TextFormField(
                              controller: cubit.r0c3,
                              textAlign: TextAlign.center,
                              cursorColor: primaryText,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '';
                                }
                                cubit.matrix[0][3] = double.parse(value);
                                return null;
                              },
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'playFairDisplay',
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                focusedErrorBorder: const OutlineInputBorder(),
                                errorBorder: const OutlineInputBorder(),
                                enabledBorder: const OutlineInputBorder(),
                                focusedBorder: const OutlineInputBorder(),
                                errorStyle: TextStyle(
                                  fontSize: 0.sp,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            ']',
                            style: TextStyle(
                              color: primaryText,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'playFairDisplay',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '[',
                            style: TextStyle(
                              color: primaryText,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'playFairDisplay',
                            ),
                          ),
                          Container(
                            width: 35.w,
                            height: 30.w,
                            margin: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              border: Border.all(color: primaryText),
                            ),
                            child: TextFormField(
                              controller: cubit.r1c0,
                              textAlign: TextAlign.center,
                              cursorColor: primaryText,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '';
                                }
                                cubit.matrix[1][0] = double.parse(value);
                                return null;
                              },
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'playFairDisplay',
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                focusedErrorBorder: const OutlineInputBorder(),
                                errorBorder: const OutlineInputBorder(),
                                enabledBorder: const OutlineInputBorder(),
                                focusedBorder: const OutlineInputBorder(),
                                errorStyle: TextStyle(
                                  fontSize: 0.sp,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 35.w,
                            height: 30.w,
                            margin: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              border: Border.all(color: primaryText),
                            ),
                            child: TextFormField(
                              controller: cubit.r1c1,
                              textAlign: TextAlign.center,
                              cursorColor: primaryText,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '';
                                }
                                cubit.matrix[1][1] = double.parse(value);
                                return null;
                              },
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'playFairDisplay',
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                focusedErrorBorder: const OutlineInputBorder(),
                                errorBorder: const OutlineInputBorder(),
                                enabledBorder: const OutlineInputBorder(),
                                focusedBorder: const OutlineInputBorder(),
                                errorStyle: TextStyle(
                                  fontSize: 0.sp,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 35.w,
                            height: 30.w,
                            margin: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              border: Border.all(color: primaryText),
                            ),
                            child: TextFormField(
                              controller: cubit.r1c2,
                              textAlign: TextAlign.center,
                              cursorColor: primaryText,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '';
                                }
                                cubit.matrix[1][2] = double.parse(value);
                                return null;
                              },
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'playFairDisplay',
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                focusedErrorBorder: const OutlineInputBorder(),
                                errorBorder: const OutlineInputBorder(),
                                enabledBorder: const OutlineInputBorder(),
                                focusedBorder: const OutlineInputBorder(),
                                errorStyle: TextStyle(
                                  fontSize: 0.sp,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '|',
                            style: TextStyle(
                              color: primaryText,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'playFairDisplay',
                            ),
                          ),
                          Container(
                            width: 35.w,
                            height: 30.w,
                            margin: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              border: Border.all(color: primaryText),
                            ),
                            child: TextFormField(
                              controller: cubit.r1c3,
                              textAlign: TextAlign.center,
                              cursorColor: primaryText,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '';
                                }
                                cubit.matrix[1][3] = double.parse(value);
                                return null;
                              },
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'playFairDisplay',
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                focusedErrorBorder: const OutlineInputBorder(),
                                errorBorder: const OutlineInputBorder(),
                                enabledBorder: const OutlineInputBorder(),
                                focusedBorder: const OutlineInputBorder(),
                                errorStyle: TextStyle(
                                  fontSize: 0.sp,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            ']',
                            style: TextStyle(
                              color: primaryText,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'playFairDisplay',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '[',
                            style: TextStyle(
                              color: primaryText,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'playFairDisplay',
                            ),
                          ),
                          Container(
                            width: 35.w,
                            height: 30.w,
                            margin: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              border: Border.all(color: primaryText),
                            ),
                            child: TextFormField(
                              controller: cubit.r2c0,
                              textAlign: TextAlign.center,
                              cursorColor: primaryText,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '';
                                }
                                cubit.matrix[2][0] = double.parse(value);
                                return null;
                              },
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'playFairDisplay',
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                focusedErrorBorder: const OutlineInputBorder(),
                                errorBorder: const OutlineInputBorder(),
                                enabledBorder: const OutlineInputBorder(),
                                focusedBorder: const OutlineInputBorder(),
                                errorStyle: TextStyle(
                                  fontSize: 0.sp,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 35.w,
                            height: 30.w,
                            margin: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              border: Border.all(color: primaryText),
                            ),
                            child: TextFormField(
                              controller: cubit.r2c1,
                              textAlign: TextAlign.center,
                              cursorColor: primaryText,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '';
                                }
                                cubit.matrix[2][1] = double.parse(value);
                                return null;
                              },
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'playFairDisplay',
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                focusedErrorBorder: const OutlineInputBorder(),
                                errorBorder: const OutlineInputBorder(),
                                enabledBorder: const OutlineInputBorder(),
                                focusedBorder: const OutlineInputBorder(),
                                errorStyle: TextStyle(
                                  fontSize: 0.sp,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 35.w,
                            height: 30.w,
                            margin: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              border: Border.all(color: primaryText),
                            ),
                            child: TextFormField(
                              controller: cubit.r2c2,
                              textAlign: TextAlign.center,
                              cursorColor: primaryText,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '';
                                }
                                cubit.matrix[2][2] = double.parse(value);
                                return null;
                              },
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'playFairDisplay',
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                focusedErrorBorder: const OutlineInputBorder(),
                                errorBorder: const OutlineInputBorder(),
                                enabledBorder: const OutlineInputBorder(),
                                focusedBorder: const OutlineInputBorder(),
                                errorStyle: TextStyle(
                                  fontSize: 0.sp,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '|',
                            style: TextStyle(
                              color: primaryText,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'playFairDisplay',
                            ),
                          ),
                          Container(
                            width: 35.w,
                            height: 30.w,
                            margin: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              border: Border.all(color: primaryText),
                            ),
                            child: TextFormField(
                              controller: cubit.r2c3,
                              textAlign: TextAlign.center,
                              cursorColor: primaryText,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '';
                                }
                                cubit.matrix[2][3] = double.parse(value);
                                return null;
                              },
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'playFairDisplay',
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                focusedErrorBorder: const OutlineInputBorder(),
                                errorBorder: const OutlineInputBorder(),
                                enabledBorder: const OutlineInputBorder(),
                                focusedBorder: const OutlineInputBorder(),
                                errorStyle: TextStyle(
                                  fontSize: 0.sp,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            ']',
                            style: TextStyle(
                              color: primaryText,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'playFairDisplay',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Partial Pivoting',
                            style: TextStyle(
                              color: primaryText,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'playFairDisplay',
                            ),
                          ),
                          const Spacer(),
                          BlocBuilder<GaussJordanScreenCubit,
                              GaussJordanScreenState>(
                            buildWhen: (previous, current) =>
                                current is PartialPivotChange,
                            builder: (context, state) {
                              return CupertinoSwitch(
                                value: cubit.partialPivot,
                                activeColor: primaryText,
                                onChanged: (value) {
                                  cubit.partialPivot = value;
                                  cubit.onPartialPivotChange();
                                },
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      BlocBuilder<GaussJordanScreenCubit,
                          GaussJordanScreenState>(
                        buildWhen: (previous, current) =>
                            current is AnswerSuccess,
                        builder: (context, state) {
                          return Visibility(
                            visible: cubit.calculate,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  textAlign: TextAlign.justify,
                                  cubit.output,
                                  style: TextStyle(
                                    color: primaryText,
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'playFairDisplay',
                                  ),
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  'X1 = ${cubit.x1.toStringAsFixed(2)} , X2 = ${cubit.x2.toStringAsFixed(2)} , X3 = ${cubit.x3.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    color: primaryText,
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'playFairDisplay',
                                  ),
                                ),
                                SizedBox(height: 20.h),
                              ],
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: () => cubit.gaussJordan(),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r)),
                      backgroundColor: secondaryBackground,
                      side: BorderSide(
                        color: primaryText,
                        width: 2.w,
                      ),
                    ),
                    child: Text(
                      'Calculate',
                      style: TextStyle(
                        color: primaryText,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'playFairDisplay',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
