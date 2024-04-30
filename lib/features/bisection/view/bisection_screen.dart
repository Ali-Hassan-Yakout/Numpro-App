import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:numpro/core/styles/colors.dart';
import 'package:numpro/features/bisection/manager/bisection_screen_cubit.dart';

class BisectionScreen extends StatefulWidget {
  const BisectionScreen({super.key});

  @override
  State<BisectionScreen> createState() => _BisectionScreenState();
}

class _BisectionScreenState extends State<BisectionScreen> {
  final cubit = BisectionScreenCubit();

  @override
  void dispose() {
    super.dispose();
    cubit.functionController.dispose();
    cubit.errorController.dispose();
    cubit.lowerValueController.dispose();
    cubit.upperValueController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Bisection',
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
                        'Enter Values',
                        style: TextStyle(
                          color: primaryText,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'playFairDisplay',
                        ),
                      ),
                      SizedBox(height: 10.h),
                      TextFormField(
                        cursorColor: primaryText,
                        controller: cubit.functionController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Invalid Function';
                          }
                          return null;
                        },
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'playFairDisplay',
                        ),
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          label: Text(
                            'Function',
                            style: TextStyle(
                              color: primaryText,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'playFairDisplay',
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.sp)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.sp)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.sp)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.sp)),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      TextFormField(
                        cursorColor: primaryText,
                        controller: cubit.lowerValueController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Invalid Lower Value';
                          }
                          return null;
                        },
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'playFairDisplay',
                        ),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(
                            'Lower Value',
                            style: TextStyle(
                              color: primaryText,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'playFairDisplay',
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.sp)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.sp)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.sp)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.sp)),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      TextFormField(
                        cursorColor: primaryText,
                        controller: cubit.upperValueController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Invalid Upper Value';
                          }
                          return null;
                        },
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'playFairDisplay',
                        ),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(
                            'Upper Value',
                            style: TextStyle(
                              color: primaryText,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'playFairDisplay',
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.sp)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.sp)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.sp)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.sp)),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      TextFormField(
                        cursorColor: primaryText,
                        controller: cubit.errorController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Invalid Error';
                          }
                          return null;
                        },
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'playFairDisplay',
                        ),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text(
                            'Error',
                            style: TextStyle(
                              color: primaryText,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'playFairDisplay',
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.sp)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.sp)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.sp)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.sp)),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      BlocBuilder<BisectionScreenCubit, BisectionScreenState>(
                        buildWhen: (previous, current) =>
                            current is AnswerSuccess,
                        builder: (context, state) {
                          return Visibility(
                            visible: cubit.calculate,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: cubit.table.length,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    List<String> row =
                                        cubit.table[index].split(" ");
                                    return SizedBox(
                                      height: 50.h,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: row.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            width: 80.w,
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.all(10.r),
                                            decoration: BoxDecoration(
                                              color: secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(16.r),
                                              border: Border.all(
                                                color: primaryText,
                                                width: 2.w,
                                              ),
                                            ),
                                            child: Text(
                                              row[index],
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color: primaryText,
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w800,
                                                fontFamily: 'playFairDisplay',
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  'The Required Root = ${cubit.root.toStringAsFixed(3)}',
                                  style: TextStyle(
                                    color: primaryText,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'playFairDisplay',
                                  ),
                                ),
                                SizedBox(height: 10.h)
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: () {
                      cubit.bisection();
                    },
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}