import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:teus_controle_lite/app/domain/entities/product.dart';

part 'product_form_store.g.dart';

class ProductFormStore = _ProductFormStore with _$ProductFormStore;

// flutter packages pub run build_runner watch
abstract class _ProductFormStore with Store {
  Product? product;

  _ProductFormStore(BuildContext context) {
    var parameter = ModalRoute.of(context)!.settings.arguments;
    if (parameter != null) {
      this.product = parameter as Product;
    }
  }
}