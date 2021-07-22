import 'package:teus_controle_lite/app/domain/dto/product_dto.dart';
import 'package:teus_controle_lite/app/domain/entities/product.dart';

abstract class IProductService {
  save(Product product);

  remove(int id);

  Future<List<Product>> find();

  undoRemove(int id);

  validateDescription(String? description);

  validateGtin(String? gtin);

  validateStock(String? inStock);
}