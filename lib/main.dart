import 'package:flutter/material.dart';

import 'ui/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Pressure App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
