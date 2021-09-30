import 'package:dio/dio.dart';
import 'package:teus_controle_lite/app/database/dio/dio_config.dart';
import 'package:teus_controle_lite/app/domain/entities/product.dart';
import 'package:teus_controle_lite/app/domain/interfaces/i_product_dao.dart';

class ProductDaoApi implements IProductDAO {
  final Dio dio = DioConfig.builderConfig();

  @override
  Future<List<String>> delete(id) async {
    try {
      var response = await dio.delete(
        "api/products/delete",
        options: Options(headers: {"id": id}),
      );

      return _treatMessages(response.data['messages']);
    } catch (e) {
      throw Exception("Ocorreu um erro: ${e.toString()}");
    }
  }

  @override
  Future<List<Product>> find() async {
    try {
      var response = await dio.post(
        "api/products/getpaged",
        data: {
          "pageNumber": 1,
          "pageSize": 50,
        },
      );

      List<Product> list = [];
      for (var item in response.data['data']['data']) {
        list.add(
          Product(
            gtin: item['gtin'],
            description: item['description'],
            price: item['price'],
            brandName: item['brandName'],
            gpcCode: item['gpcCode'],
            gpcDescription: item['gpcDescription'],
            ncmCode: item['ncmCode'],
            ncmDescription: item['ncmDescription'],
            ncmFullDescription: item['ncmFullDescription'],
            thumbnail: item['thumbnail'],
            inStock: item['inStock'],
            id: item['id'],
            active: item['active'],
            deleted: item['deleted'],
          ),
        );
      }

      return list;
    } catch (e) {
      throw Exception("Ocorreu um erro: ${e.toString()}");
    }
  }

  @override
  Future<Product> findById(id) async {
    try {
      var response = await dio.get(
        "api/products/getbyid",
        options: Options(
          headers: {
            "id": id
          }
        ),
      );

      var item = response.data['data'];
      return Product(
        gtin: item['gtin'],
        description: item['description'],
        price: item['price'],
        brandName: item['brandName'],
        gpcCode: item['gpcCode'],
        gpcDescription: item['gpcDescription'],
        ncmCode: item['ncmCode'],
        ncmDescription: item['ncmDescription'],
        ncmFullDescription: item['ncmFullDescription'],
        thumbnail: item['thumbnail'],
        inStock: item['inStock'],
        id: item['id'],
        active: item['active'],
        deleted: item['deleted'],
      );
    } catch (e) {
      throw Exception("Ocorreu um erro: ${e.toString()}");
    }
  }

  @override
  Future<List<String>> save(Product product) async {
    try {
      var response;
      // se tiver id, atualiza
      if(product.id != null) {
        response = await dio.put(
          "api/products/update",
          data: {
            "gtin": product.gtin,
            "description": product.description,
            "price": product.price,
            "brandName": product.brandName,
            "gpcCode": product.gpcCode,
            "gpcDescription": product.gpcDescription,
            "ncmCode": product.ncmCode,
            "ncmDescription": product.ncmDescription,
            "ncmFullDescription": product.ncmFullDescription,
            "thumbnail": product.thumbnail,
            "inStock": product.inStock,
            "id": product.id,
            "active": product.active
          },
        );
      // se não, insere
      } else {
        response = await dio.post(
          "api/products/insert",
          data: {
            "gtin": product.gtin,
            "description": product.description,
            "price": product.price,
            "brandName": product.brandName,
            "gpcCode": product.gpcCode,
            "gpcDescription": product.gpcDescription,
            "ncmCode": product.ncmCode,
            "ncmDescription": product.ncmDescription,
            "ncmFullDescription": product.ncmFullDescription,
            "thumbnail": product.thumbnail,
            "inStock": product.inStock
          },
        );
      }

      return _treatMessages(response.data['messages']);

    } catch (e) {
      throw Exception("Ocorreu um erro: ${e.toString()}");
    }
  }

  @override
  Future<List<String>> undelete(id) async {
    try {
      var response = await dio.post(
        "api/products/undelete",
        options: Options(
          headers: {
            "id": id
          }
        )
      );

      return _treatMessages(response.data['messages']);

    } catch (e) {
      throw Exception("Ocorreu um erro: ${e.toString()}");
    }    
  }

  List<String> _treatMessages(List<dynamic> values) {
    List<String> messages = [];
    for (var item in values) {
      messages.add(item['message']);
    }
    return messages;
  }
}

