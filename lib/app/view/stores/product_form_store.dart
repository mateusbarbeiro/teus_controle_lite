import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:teus_controle_lite/app/domain/dto/product_dto.dart';
import 'package:teus_controle_lite/app/domain/entities/product.dart';
import 'package:teus_controle_lite/app/domain/interfaces/i_product_service.dart';

part 'product_form_store.g.dart';

class ProductFormStore = _ProductFormStore with _$ProductFormStore;

// flutter packages pub run build_runner watch
abstract class _ProductFormStore with Store {
  Product? product;
  bool? _descriptionIsValid;
  bool? _gtinIsValid;
  bool? _inStockIsValid;
  var _service = GetIt.I.get<IProductService>();

  bool get isValid => (_descriptionIsValid ?? false) && (_gtinIsValid ?? false) && (_inStockIsValid ?? false);

  _ProductFormStore(BuildContext context) {
    var parameter = ModalRoute.of(context)!.settings.arguments;
    if (parameter != null) {
      this.product = parameter as Product;
    }
  }

  save() async {
    await _service.save(product!);
  }

  String? validateDescription(String? description) {
    try {
      _service.validateDescription(description);
      _descriptionIsValid = true;
      return null;
    } catch (e) {
      _descriptionIsValid = false;
      return e.toString();
    }
  }

  String? validateGtin(String? gtin) {
    try {
      _service.validateGtin(gtin);
      _gtinIsValid = true;
      return null;
    } catch (e) {
      _gtinIsValid = false;
      return e.toString();
    }
  }

  String? validateStock(String? inStock) {
    try {
      _service.validateStock(inStock);
      _inStockIsValid = true;
      return null;
    } catch (e) {
      _inStockIsValid = false;
      return e.toString();
    }
  }
}