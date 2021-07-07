import 'package:get_it/get_it.dart';
import 'package:teus_controle_lite/app/domain/dto/product_dto.dart';
import 'package:teus_controle_lite/app/domain/entities/product.dart';
import 'package:teus_controle_lite/app/domain/exceptions/business_exception.dart';
import 'package:teus_controle_lite/app/domain/interfaces/i_product_dao.dart';
import 'package:teus_controle_lite/app/domain/interfaces/i_product_service.dart';

class ProductService implements IProductService {
  var _dao = GetIt.I.get<IProductDAO>();

  save(ProductDto product) {
    validateGtin(product.gtin);
    validateDescription(product.description);
    validateStock(product.inStock);
    _dao.save(product);
  }

  remove(int id) {
    _dao.delete(id);
  }

  Future<List<Product>> find() {
    return _dao.find();
  }

  validateDescription(String description) {
    if (description.isEmpty) {
      throw new BusinessException('Descrição é obrigatório.');
    }
  }

  validateGtin(String gtin) {
    if (gtin.isEmpty) {
      throw new BusinessException('Código de barras é obrigatório.');
    }
  }

  validateStock(int inStock) {
    if (inStock <= 0) {
      throw new BusinessException('Quantidade em estoque deve ser maior do que zero.');
    }
  }
}