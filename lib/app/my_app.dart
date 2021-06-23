import 'package:flutter/material.dart';
import 'package:teus_controle_lite/app/view/home.dart';
import 'package:teus_controle_lite/app/view/products.dart';
import 'package:teus_controle_lite/app/view/profile.dart';

class MyApp extends StatelessWidget {
  static const HOME = '/';
  static const PRODUCTS = 'products';
  static const PROFILE = 'profile';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teus Controle',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: {
        HOME: (context) => Home(),
        PRODUCTS: (context) => Products(),
        PROFILE: (context) => Profile()
      },
    );
  }
}