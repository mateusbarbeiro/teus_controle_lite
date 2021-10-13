import 'package:teus_controle_lite/app/domain/entities/product.dart';

abstract class IProductDAO {
  Future<List<String>> save(Product product);

  Future<List<String>> delete(dynamic id);

  Future<List<Product>> find();

  Future<List<String>> undelete(dynamic id);

  Future<Product> findById(dynamic id);
}