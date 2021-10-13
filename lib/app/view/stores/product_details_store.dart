import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:teus_controle_lite/app/domain/entities/product.dart';
import 'package:teus_controle_lite/app/domain/interfaces/i_product_service.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../my_app.dart';

part 'product_details_store.g.dart';

class ProductDetailsStore = _ProductDetailsStore with _$ProductDetailsStore;

// flutter packages pub run build_runner watch
abstract class _ProductDetailsStore with Store{
  BuildContext context;
  late dynamic productId;
  @observable
  Future<Product>? product;
  var _service = GetIt.I.get<IProductService>();

  @action
  refreshItem([dynamic value]) {
    product = _service.findById(productId);
  }

  _ProductDetailsStore(this.context) {
    productId = ModalRoute.of(context)?.settings.arguments;
    refreshItem();
  }

  // Future fetchItem() async {
  //   var result = await _service.findById(productId);
  //   refreshItem(result);
  // }

  // @action
  // refreshItem(Product value) async {
  //   product = value;
  // }

  goToForm(Product? product) {
    Navigator.of(context)
      .pushNamed(
        MyApp.PRODUCTSFORM,
        arguments: product
      ).then((value) => refreshItem());
  }

  launchApp(String url) async {
    if (await canLaunch(url))
      await launch(url);
    else
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Alerta!'),
            content: Text('Não foi possível encontrar um APP compatível.'),
          );
        }
      );
  }

  goToBack() => Navigator.of(context).pop();
}