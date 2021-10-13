// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductDetailsStore on _ProductDetailsStore, Store {
  final _$productAtom = Atom(name: '_ProductDetailsStore.product');

  @override
  Future<Product>? get product {
    _$productAtom.reportRead();
    return super.product;
  }

  @override
  set product(Future<Product>? value) {
    _$productAtom.reportWrite(value, super.product, () {
      super.product = value;
    });
  }

  final _$_ProductDetailsStoreActionController =
      ActionController(name: '_ProductDetailsStore');

  @override
  dynamic refreshItem([dynamic value]) {
    final _$actionInfo = _$_ProductDetailsStoreActionController.startAction(
        name: '_ProductDetailsStore.refreshItem');
    try {
      return super.refreshItem(value);
    } finally {
      _$_ProductDetailsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
product: ${product}
    ''';
  }
}
