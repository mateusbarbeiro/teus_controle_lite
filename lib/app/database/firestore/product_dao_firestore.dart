import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:teus_controle_lite/app/database/sqlite/product_dao.dart';
import 'package:teus_controle_lite/app/domain/entities/product.dart';

class ProductDaoFirestore implements ProductDao {
  final List<String> result = ['Operação executada com sucesso'];
  CollectionReference? productCollection;

  ProductDaoFirestore() {
    productCollection = FirebaseFirestore.instance.collection('product');
  }

  @override
  Future<List<String>> delete(dynamic id) async {
    await productCollection!.doc(id).update({'deleted': true});
    
    return result;
  }

  @override
  Future<List<Product>> find() async {
    var result =
        await productCollection!.where('deleted', isEqualTo: false).get();

    return result.docs
        .map((e) => Product(
            id: e.reference.id.toString(),
            description: e['description'],
            gtin: e['gtin'],
            price: e['price'],
            brandName: e['brandName'],
            gpcCode: e['gpcCode'],
            gpcDescription: e['gpcDescription'],
            ncmCode: e['ncmCode'],
            ncmDescription: e['ncmDescription'],
            ncmFullDescription: e['ncmFullDescription'],
            thumbnail: e['thumbnail'],
            inStock: e['inStock'],
            active: e['active'],
            deleted: e['deleted']))
        .toList();
  }

  @override
  Future<Product> findById(id) async {
    var result = await productCollection!
        .where('deleted', isEqualTo: false)
        .where(FieldPath.documentId, isEqualTo: id)
        .get();

    return result.docs
        .map((e) => Product(
            id: e.reference.id.toString(),
            description: e['description'],
            gtin: e['gtin'],
            price: e['price'],
            brandName: e['brandName'],
            gpcCode: e['gpcCode'],
            gpcDescription: e['gpcDescription'],
            ncmCode: e['ncmCode'],
            ncmDescription: e['ncmDescription'],
            ncmFullDescription: e['ncmFullDescription'],
            thumbnail: e['thumbnail'],
            inStock: e['inStock'],
            active: e['active'],
            deleted: e['deleted']))
        .first;
  }

  @override
  Future<List<String>> save(Product product) async {
    await productCollection!.doc(product.id).set({
      'description': product.description,
      'gtin': product.gtin,
      'price': product.price,
      'brandName': product.brandName,
      'gpcCode': product.gpcCode,
      'gpcDescription': product.gpcDescription,
      'ncmCode': product.ncmCode,
      'ncmDescription': product.ncmDescription,
      'ncmFullDescription': product.ncmFullDescription,
      'thumbnail': product.thumbnail,
      'inStock': product.inStock,
      'active': product.active,
      'deleted': product.deleted
    });

    return result;
  }

  @override
  Future<List<String>> undelete(dynamic id) async {
    await productCollection!.doc(id).update({'deleted': false});
    return result;
  }
}
