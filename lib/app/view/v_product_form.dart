import 'package:flutter/material.dart';

class ProductForm extends StatelessWidget {
  const ProductForm({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de produtos'),
      ),
    );
  }
}