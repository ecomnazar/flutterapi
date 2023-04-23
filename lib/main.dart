import 'package:flutter/material.dart';
import 'package:testproject/Pages/BottomNavigation.dart';
import 'package:testproject/Pages/Home.dart';
import 'package:testproject/Pages/LoginPage.dart';
import 'package:testproject/Widgets/ProductPageWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => BottomNavigation(),
        '/LoginPage': (context) => LoginPage(),
      },
    );
  }
}