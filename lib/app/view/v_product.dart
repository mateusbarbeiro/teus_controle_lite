import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teus_controle_lite/app/domain/dto/product_dto.dart';
import 'package:teus_controle_lite/app/domain/entities/product.dart';
import 'package:teus_controle_lite/app/view/stores/product_store.dart';

class VProduct extends StatelessWidget {
  final _store = ProductStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos'),
        actions: [
          IconButton(
            onPressed: () {
              _store.save(
                ProductDto(
                  gtin: '7896544900264',
                  description: 'FITA MISSNER BEGE MICROPORE 2,5X4,5 BEGE',
                  price: 4.99,
                  brandName: 'MISSNER',
                  gpcCode: '',
                  gpcDescription: '',
                  ncmCode: '30051090',
                  ncmDescription: 'Outros',
                  ncmFullDescription: 'Produtos farmacêuticos - Pastas (“ouates”), gazes, ataduras e artigos análogos (por exemplo, pensos, esparadrapos, sinapismos), impregnados ou recobertos de substâncias farmacêuticas ou acondicionados para venda a retalho para usos medicinais, cirúrgicos, dentários ou veterinários - Pensos adesivos e outros artigos com uma camada adesiva - Outros',
                  thumbnail: 'https://cdn-cosmos.bluesoft.com.br/products/7896544900264',
                  inStock: 5
                )
              );
            },
            icon: Icon(Icons.add)
          )
        ],
      ),
      body: Observer(
        builder: (context) => FutureBuilder(
          future: _store.productList,
          builder: (context, f) {
            if (!f.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              var list = (f.data! as List<Product>);
              return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    var product = list[index];
                    return Center(
                      child: Dismissible(
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              Image.network(product.thumbnail ?? "", height: 250),
                              ListTile(
                                title: Text( "R\$" + product.price!.toStringAsFixed(2), style: TextStyle(fontSize: 25)),
                                subtitle: Text(
                                  product.description,
                                  style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 17),
                                ),
                              ),
                            ]
                          ),
                        ),
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          _store.remove(product.id ?? 0);
                          ScaffoldMessenger.of(context)
                            .showSnackBar(
                              SnackBar(
                                content: Text('${product.gtin} deletado!', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                                backgroundColor: Color.fromRGBO(255, 108, 0, 1),
                                duration: Duration(milliseconds: 500),
                              )
                            );
                        },
                        background: Container(color: Colors.red),
                        direction: DismissDirection.startToEnd,
                      )
                    );
                  }
              );
            } 
          },
        )
      )
    );
  }
}