import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:numpro/core/styles/colors.dart';
import 'package:numpro/features/bisection/view/bisection_screen.dart';
import 'package:numpro/features/cramers_rule/view/cramers_rule_screen.dart';
import 'package:numpro/features/false_position/view/false_position_screen.dart';
import 'package:numpro/features/gauss_elimination/view/gauss_elimination_screen.dart';
import 'package:numpro/features/gauss_jordan/view/gauss_jordan_screen.dart';
import 'package:numpro/features/lu_decomposition/view/lu_decomposition_screen.dart';
import 'package:numpro/features/newton/view/newton_screen.dart';
import 'package:numpro/features/secant/view/secant_screen.dart';
import 'package:numpro/features/simple_fixed_point/view/simple_fixed_point_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Lottie.asset('assets/animations/home_animation.json'),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Select Method',
                    style: TextStyle(
                      color: primaryText,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'playFairDisplay',
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const BisectionScreen(),
                                ),
                              );
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(5.r),
                              decoration: BoxDecoration(
                                color: secondaryBackground,
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(
                                  color: primaryText,
                                  width: 2.w,
                                ),
                              ),
                              child: Text(
                                'Bisection',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: primaryText,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'playFairDisplay',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const FalsePositionScreen(),
                                ),
                              );
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(5.r),
                              decoration: BoxDecoration(
                                color: secondaryBackground,
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(
                                  color: primaryText,
                                  width: 2.w,
                                ),
                              ),
                              child: Text(
                                'False position',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: primaryText,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'playFairDisplay',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const SimpleFixedPointScreen(),
                                ),
                              );
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(5.r),
                              decoration: BoxDecoration(
                                color: secondaryBackground,
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(
                                  color: primaryText,
                                  width: 2.w,
                                ),
                              ),
                              child: Text(
                                'Simple Fixed Point',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: primaryText,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'playFairDisplay',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SecantScreen(),
                                ),
                              );
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(5.r),
                              decoration: BoxDecoration(
                                color: secondaryBackground,
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(
                                  color: primaryText,
                                  width: 2.w,
                                ),
                              ),
                              child: Text(
                                'Secant',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: primaryText,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'playFairDisplay',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const NewtonScreen(),
                                ),
                              );
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(5.r),
                              decoration: BoxDecoration(
                                color: secondaryBackground,
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(
                                  color: primaryText,
                                  width: 2.w,
                                ),
                              ),
                              child: Text(
                                'Newton',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: primaryText,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'playFairDisplay',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const GaussEliminationScreen(),
                                ),
                              );
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(5.r),
                              decoration: BoxDecoration(
                                color: secondaryBackground,
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(
                                  color: primaryText,
                                  width: 2.w,
                                ),
                              ),
                              child: Text(
                                'Gauss Elimination',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: primaryText,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'playFairDisplay',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const LuDecompositionScreen(),
                                ),
                              );
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(5.r),
                              decoration: BoxDecoration(
                                color: secondaryBackground,
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(
                                  color: primaryText,
                                  width: 2.w,
                                ),
                              ),
                              child: Text(
                                'LU Decomposition',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: primaryText,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'playFairDisplay',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const CramersRuleScreen(),
                                ),
                              );
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(5.r),
                              decoration: BoxDecoration(
                                color: secondaryBackground,
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(
                                  color: primaryText,
                                  width: 2.w,
                                ),
                              ),
                              child: Text(
                                'Cramer\'s Rule',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: primaryText,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'playFairDisplay',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const GaussJordanScreen(),
                                ),
                              );
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(5.r),
                              decoration: BoxDecoration(
                                color: secondaryBackground,
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(
                                  color: primaryText,
                                  width: 2.w,
                                ),
                              ),
                              child: Text(
                                'Gauss Jordan',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: primaryText,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'playFairDisplay',
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Expanded(
                          child: SizedBox(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
