import 'package:flutter/material.dart';
import 'package:teus_controle_lite/app/view/v_product.dart';
import 'package:teus_controle_lite/app/view/v_product_details.dart';
import 'package:teus_controle_lite/app/view/v_product_form.dart';

class MyApp extends StatelessWidget {
  static const PRODUCTS = '/';
  static const PRODUCTSFORM = 'productsform';
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
        PRODUCTS: (context) => VProduct(),
        PRODUCTSFORM: (context) => VProductForm(),
        PRODUCTSDETAILS: (context) => VProductDetails()
      },
    );
  }
}