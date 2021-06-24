import 'package:sqflite/sqflite.dart';
import 'package:teus_controle_lite/app/domain/dto/product_dto.dart';
import 'package:teus_controle_lite/app/domain/entities/product.dart';
import 'package:teus_controle_lite/app/domain/interfaces/i_products_dao.dart';

import 'connection.dart';

class ProductDao implements IProductsDAO {
  Database? _db;

  @override
  delete(int? id) async {
    _db = await Connection.get();
    var sql = 'DELETE FROM products WHERE id = ?';
    await _db?.rawDelete(sql,[id]);
  }
  
  @override
  Future<List<Product>> find() async {
    _db = await Connection.get();
    List<Map<String,dynamic>>? result = await _db?.query('products');
    
    return List.generate(result!.length, (index) {
      var line = result[index];
      return Product(
        id: line['id'],
        gtin: line['gtin'],
        description: line['description'],
        price: line['price'],
        brandName: line['brand_name'],
        gpcCode: line['gpc_code'],
        gpcDescription: line['gpc_description'],
        ncmCode: line['ncm_code'], 
        ncmDescription: line['ncm_description'],
        ncmFullDescription: line['ncm_full_description'],
        thumbnail: line['thumbnail'],
        inStock: line['in_stock'],
        active: line['active'], 
        deleted: line['deleted'],
        createdDate: line['created_date']
        );
    });
  }
  
  @override
  save(ProductDto product) async {
    _db = await Connection.get();
    var sql;
    if (product.id == null) {
      sql = 'INSERT INTO products (gtin, description, price, brand_name, gpc_code, gpc_description, ncm_code, ncm_description, ncm_full_description, thumbnail, in_stock) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
      _db?.rawInsert(sql, [product.gtin, product.description, product.price, product.brandName, product.gpcCode, product.gpcDescription, product.ncmCode, product.ncmDescription, product.ncmFullDescription, product.thumbnail, product.inStock]);
    } else {
      sql = 'UPDATE products SET gtin = ?, description = ?, price = ?, brand_name = ?, gpc_code = ?, gpc_description = ?, ncm_code = ?, ncm_description = ?, ncm_full_description = ?, thumbnail = ?, in_stock = ? WHERE id = ?';
      _db?.rawUpdate(sql, [product.gtin, product.description, product.price, product.brandName, product.gpcCode, product.gpcDescription, product.ncmCode, product.ncmDescription, product.ncmFullDescription, product.thumbnail, product.inStock, product.id]);
    }
  }

}