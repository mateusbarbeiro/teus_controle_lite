import 'package:teus_controle_lite/app/domain/entities/product.dart';

abstract class IProductService {
  save(Product product);

  remove(dynamic id);

  Future<List<Product>> find();

  undoRemove(dynamic id);

  validateDescription(String? description);

  validateGtin(String? gtin);

  validateStock(String? inStock);

  Future<Product> findById(dynamic id);
}