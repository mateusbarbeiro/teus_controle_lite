import 'package:flutter/cupertino.dart';
import 'package:teus_controle_lite/app/domain/entities/product.dart';

import '../../my_app.dart';

class ProductDetailsStore {
  BuildContext context;
  Product? product;

  ProductDetailsStore(this.context) {
    product = ModalRoute.of(context)?.settings.arguments as Product?;
  }

  goToForm(Product? product) {
    Navigator.of(context)
      .pushNamed(
        MyApp.PRODUCTSFORM,
        arguments: product
      );
      // .then(refreshList);
  }

  goToBack() => Navigator.of(context).pop();
}