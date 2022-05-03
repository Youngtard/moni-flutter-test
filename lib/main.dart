import 'package:flutter/material.dart';
import 'package:moni_flutter_test/modules/homepage/screens/homepage.dart';
import 'package:moni_flutter_test/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moni',
      theme: AppTheme.light(),
      home: const HomePage(),
    );
  }
}
