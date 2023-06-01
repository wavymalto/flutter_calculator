import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'main_navigator.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.purpleAccent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi navegador de pantallas',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MainNavigator(),
    );
  }
}

