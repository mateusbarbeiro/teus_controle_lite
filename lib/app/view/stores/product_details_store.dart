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
  @observable
  Product? product;
  var _service = GetIt.I.get<IProductService>();

  _ProductDetailsStore(this.context) {
    product = ModalRoute.of(context)?.settings.arguments as Product?;
  }

  @action
  refreshList([dynamic value]) async{
    await _service.findById(product?.id ?? 1).then((value) => product = value);
  }

  goToForm(Product? product) {
    Navigator.of(context)
      .pushNamed(
        MyApp.PRODUCTSFORM,
        arguments: product
      )
      .then(refreshList);
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