import 'package:teus_controle_lite/app/domain/dto/product_dto.dart';
import 'package:teus_controle_lite/app/domain/entities/product.dart';

abstract class IProductsDAO {
  save(ProductDto product);

  delete(int id);

  Future<List<Product>> find();
}