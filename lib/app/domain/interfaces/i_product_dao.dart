import 'package:teus_controle_lite/app/domain/entities/product.dart';

abstract class IProductDAO {
  save(Product product);

  delete(int id);

  Future<List<Product>> find();

  undelete(int? id);

  Future<Product> findById(int id);
}