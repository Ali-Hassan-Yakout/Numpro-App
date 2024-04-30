import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:numpro/core/styles/colors.dart';
import 'package:numpro/features/home/view/home_screen.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: primaryBackground,
          appBarTheme: const AppBarTheme(color: primaryBackground),
          textSelectionTheme: const TextSelectionThemeData(
            selectionHandleColor: primaryText,
            cursorColor: primaryText,
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
