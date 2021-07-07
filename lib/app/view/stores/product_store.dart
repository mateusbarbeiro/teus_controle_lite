import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:teus_controle_lite/app/domain/dto/product_dto.dart';
import 'package:teus_controle_lite/app/domain/entities/product.dart';
import 'package:teus_controle_lite/app/domain/interfaces/i_product_service.dart';
import 'package:teus_controle_lite/app/my_app.dart';

part 'product_store.g.dart';

class ProductStore = _ProductStore with _$ProductStore;

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

  save(ProductDto product) {
    _service.save(product);

    refreshList();
  }

  goToForm(BuildContext context, [Product? product]) {
    Navigator.of(context)
      .pushNamed(
        MyApp.PRODUCTSFORM,
        arguments: product
      )
      .then(refreshList);
  }

  remove(int id) {
    _service.remove(id);
    refreshList();
  }
}