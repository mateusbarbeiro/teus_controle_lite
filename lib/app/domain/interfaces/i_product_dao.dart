import 'package:teus_controle_lite/app/domain/entities/product.dart';

abstract class IProductDAO {
  save(Product product);

  delete(dynamic id);

  Future<List<Product>> find();

  undelete(dynamic id);

  Future<Product> findById(dynamic id);
}