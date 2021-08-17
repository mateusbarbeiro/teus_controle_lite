import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:teus_controle_lite/app/domain/dto/product_cosmos_response.dart';

class WebService {
  Future<ProductCosmosResponse> requestGetProduct(String gtin) async {
    var result;
    await http.get(Uri.parse('https://api.cosmos.bluesoft.com.br/gtins/$gtin'),
        headers: {
          'X-Cosmos-Token': 'OURNoMwt8fatVpPQ6iR3VA'
        }).then((value) => result =
        ProductCosmosResponse.fromJson(jsonDecode(value.body)));

    return result;
  }
}