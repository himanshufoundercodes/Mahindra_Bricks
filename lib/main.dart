import 'package:flutter/material.dart';
import 'Constant/Sizes.dart';
import 'Splashscreen.dart';
import 'labourmanagement.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tiranga',
      theme: ThemeData(),
      builder: (context, child) {
        Sizes.init(context);
        return child!;
      },
     home: MahindraSplashScreen(),

    );
  }
}



