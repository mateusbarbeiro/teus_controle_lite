import 'package:get_it/get_it.dart';
import 'package:teus_controle_lite/app/domain/entities/product.dart';
import 'package:teus_controle_lite/app/domain/exceptions/business_exception.dart';
import 'package:teus_controle_lite/app/domain/interfaces/i_product_dao.dart';
import 'package:teus_controle_lite/app/domain/interfaces/i_product_service.dart';

class ProductService implements IProductService {
  var _dao = GetIt.I.get<IProductDAO>();

  save(Product product) {
    validateGtin(product.gtin);
    validateDescription(product.description);
    validateStock(product.inStock.toString());
    _dao.save(product);
  }

  remove(int id) {
    _dao.delete(id);
  }

  undoRemove(int id) {
    _dao.undelete(id);
  }

  Future<List<Product>> find() {
    return _dao.find();
  }

  Future<Product> findById(int id) {
    return _dao.findById(id);
  }

  validateDescription(String? description) {
    if (description == null || description == '') {
      throw new BusinessException('Descrição é obrigatório.');
    }
  }

  validateGtin(String? gtin) {
    if (gtin == null || gtin == '') {
      throw new BusinessException('Código de barras é obrigatório.');
    }
  }

  validateStock(String? inStock) {
    if (inStock == null || inStock == '') {
      throw new BusinessException('Quantidade em estoque é obrigatória.');
    }
  
    if (int.tryParse(inStock)! < 0) {
      throw new BusinessException('Quantidade em estoque deve ser maior do que zero.');
    }
  }
}