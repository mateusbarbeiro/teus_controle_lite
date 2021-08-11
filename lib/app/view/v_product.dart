import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teus_controle_lite/app/domain/entities/product.dart';
import 'package:teus_controle_lite/app/view/stores/product_store.dart';

class VProduct extends StatelessWidget {
  final _store = ProductStore();

  Widget iconEditButton(VoidCallback onPressed) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(Icons.edit),
      color: Colors.orange
    );
  }

  IconButton onAdd(BuildContext context) {
    return IconButton(
      onPressed: () {
        _store.goToForm(context);
      },
      icon: Icon(Icons.add)
    );  
  }

  ImageProvider<Object> handleProductImage(Product product) {
    if (
      product.thumbnail == null ||
      !Uri.tryParse(product.thumbnail ?? "")!.isAbsolute
    ) {
      return AssetImage('lib/app/assets/basketImage.jpg');
    } else {
      return NetworkImage(product.thumbnail ?? '');
    }
  }

  Hero listCard(BuildContext context, Product product) {
    return Hero(
      tag: "card${product.id}",
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 485.0 / 384.0,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: handleProductImage(product),
                        fit: BoxFit.cover,
                      )
                    ),
                  ),
                ),
                ListTile(
                  title: Text( "R\$" + product.price!.toStringAsFixed(2), style: TextStyle(fontSize: 25)),
                  subtitle: Text(
                    product.description ?? "",
                    style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 17),
                  ),
                ),
              ]
            ),
            Positioned(
              left: 0.0,
              top: 0.0,
              bottom: 0.0,
              right: 0.0,
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () async {
                    await Future.delayed(Duration(milliseconds: 700));
                    _store.goToDetails(context, product);
                  },
                ),
              ),
            )
          ]
        ),
      )
    );
  }

  SnackBar deleteSnackBar(BuildContext context, dynamic id, String gtin) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return SnackBar(
      content: Text(
        '$gtin deletado!',
        style: TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.bold
        ),
      ),
      action: SnackBarAction(
        label: 'Desfazer',
        onPressed: () {
          _store.undoRemove(id!);
        },
        textColor: Colors.black87,
      ),
      backgroundColor: Color.fromRGBO(255, 108, 0, 1),
      duration: Duration(milliseconds: 900),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      width: queryData.size.width - 10,
      behavior: SnackBarBehavior.floating,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos')
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
                      child: listCard(context, product),
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        _store.remove(product.id ?? 0);
                        ScaffoldMessenger.of(context)
                          .showSnackBar(
                            deleteSnackBar(
                              context,
                              product.id,
                              product.gtin ?? ""
                            )
                          );
                      },
                      background: Container(
                        color: Colors.red[400],
                        child: Align( 
                          alignment: Alignment(-0.9, 0), 
                          child: Icon(Icons.delete, color: Colors.white, size: 50,),
                        ),
                      ),
                      direction: DismissDirection.startToEnd,
                    )
                  );
                }
              );
            } 
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _store.goToForm(context),
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      )
    );
  }
}