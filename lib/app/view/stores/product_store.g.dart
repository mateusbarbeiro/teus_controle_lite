// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductStore on _ProductStore, Store {
  final _$productListAtom = Atom(name: '_ProductStore.productList');

  @override
  Future<List<Product>>? get productList {
    _$productListAtom.reportRead();
    return super.productList;
  }

  @override
  set productList(Future<List<Product>>? value) {
    _$productListAtom.reportWrite(value, super.productList, () {
      super.productList = value;
    });
  }

  final _$_ProductStoreActionController =
      ActionController(name: '_ProductStore');

  @override
  dynamic refreshList([dynamic value]) {
    final _$actionInfo = _$_ProductStoreActionController.startAction(
        name: '_ProductStore.refreshList');
    try {
      return super.refreshList(value);
    } finally {
      _$_ProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
productList: ${productList}
    ''';
  }
}
