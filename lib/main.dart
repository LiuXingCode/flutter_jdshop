import 'package:flutter/material.dart';
import 'package:flutter_jdshop/routers/router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(750, 1334),
        builder: () => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                appBarTheme: const AppBarTheme(
                    color: Colors.white, foregroundColor: Colors.black87),
                tabBarTheme: const TabBarTheme(labelColor: Colors.black87)),
            initialRoute: "/",
            onGenerateRoute: onGenerateRoute));
  }
}
