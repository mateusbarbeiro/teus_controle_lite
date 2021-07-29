import 'package:flutter/material.dart';
import 'package:teus_controle_lite/app/view/v_home.dart';
import 'package:teus_controle_lite/app/view/v_product.dart';
import 'package:teus_controle_lite/app/view/v_product_details.dart';
import 'package:teus_controle_lite/app/view/v_product_form.dart';
import 'package:teus_controle_lite/app/view/v_profile.dart';

class MyApp extends StatelessWidget {
  static const HOME = '/';
  static const PRODUCTS = 'products';
  static const PRODUCTSFORM = 'productsform';
  static const PROFILE = 'profile';
  static const PRODUCTSDETAILS = 'productdetails';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teus Controle',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: {
        HOME: (context) => VHome(),
        PRODUCTS: (context) => VProduct(),
        PRODUCTSFORM: (context) => VProductForm(),
        PROFILE: (context) => VProfile(),
        PRODUCTSDETAILS: (context) => VProductDetails()
      },
    );
  }
}