import 'package:teus_controle_lite/app/domain/dto/product_dto.dart';
import 'package:teus_controle_lite/app/domain/entities/product.dart';

abstract class IProductService {
  save(ProductDto product);

  remove(int id);

  Future<List<Product>> find();
}