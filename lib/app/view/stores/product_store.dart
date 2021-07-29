import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:teus_controle_lite/app/domain/entities/product.dart';
import 'package:teus_controle_lite/app/domain/interfaces/i_product_service.dart';
import 'package:teus_controle_lite/app/my_app.dart';

part 'product_store.g.dart';

class ProductStore = _ProductStore with _$ProductStore;

// flutter packages pub run build_runner watch
abstract class _ProductStore with Store {
  var _service = GetIt.I.get<IProductService>();
  
  @observable
  Future<List<Product>>? productList;

  @action
  refreshList([dynamic value]) {
    productList = _service.find();
  }

  _ProductStore() {
    refreshList();
  }

  save(Product product) {
    _service.save(product);

    refreshList();
  }

  goToForm(BuildContext context, [Product? product]) {
    if (product == null) {
      Navigator.of(context)
        .pushNamed(MyApp.PRODUCTSFORM)
        .then(refreshList);
    } else {
      Navigator.of(context)
        .pushNamed(
          MyApp.PRODUCTSFORM,
          arguments: product
        )
        .then(refreshList);
    }
  }

  goToDetails(BuildContext context, Product product) {
    Navigator.of(context)
      .pushNamed(
        MyApp.PRODUCTSDETAILS,
        arguments: product
      );
  }

  remove(int id) {
    _service.remove(id);
    refreshList();
  }

  undoRemove(int id) {
    _service.undoRemove(id);
    refreshList();
  }
}