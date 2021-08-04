import 'dart:ui';

import 'package:background_app_bar/background_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teus_controle_lite/app/view/stores/product_details_store.dart';

class VProductDetails extends StatelessWidget {
  
  ImageProvider<Object> handleProductImage(ProductDetailsStore store) {
    if (
      store.product?.thumbnail == null ||
      !Uri.tryParse(store.product?.thumbnail ?? "")!.isAbsolute
    ) {
      return AssetImage('lib/app/assets/basketImage.jpg');
    } else {
      return NetworkImage(store.product?.thumbnail ?? '');
    }
  }

  @override
  Widget build(BuildContext context) {
    var _store = ProductDetailsStore(context);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var width = constraints.biggest.width;

        return Hero(
          tag: "card${_store.product?.id ?? UniqueKey()}",
          child: Scaffold(
            body: Observer(
              builder: (context) => NestedScrollView(
                headerSliverBuilder: (_, __) => <Widget>[
                  SliverAppBar(
                    key: Key(_store.product?.id.toString() ?? UniqueKey().toString()),
                    shadowColor: Colors.black,
                    expandedHeight: 250.0,
                    floating: false,
                    pinned: true,
                    snap: false,
                    elevation: 0.0,
                    backgroundColor: Colors.transparent,
                    actions: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          _store.goToForm(_store.product);
                        }
                      )
                    ],
                    flexibleSpace: BackgroundFlexibleSpaceBar(
                      centerTitle: false,
                      titlePadding: const EdgeInsets.only(
                        left: 20.0,
                        bottom: 20.0
                      ),
                      background: ClipRect(
                        child: Container(
                          child: new BackdropFilter(
                            filter: new ImageFilter.blur(),
                            child: new Container(
                              decoration: new BoxDecoration(
                                gradient: LinearGradient(
                                  begin: FractionalOffset.topCenter,
                                  end: FractionalOffset.center,
                                  colors: [
                                    Colors.black.withOpacity(0.8),
                                    Colors.black.withOpacity(0.0)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: handleProductImage(_store),
                              fit: BoxFit.cover,
                            )
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
                body: ListView(
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                  children: [
                    ListTile(
                      title: Text('Código de barras'),
                      subtitle: Text('${_store.product?.gtin}'),
                    ),
                    ListTile(
                      title: Text('Descrição'),
                      subtitle: Text('${_store.product?.description}'),
                    ),
                    ListTile(
                      title: Text('Preço'),
                      subtitle: Text('${_store.product?.price}'),
                    ),
                    ListTile(
                      title: Text('Marca'),
                      subtitle: Text('${_store.product?.brandName}'),
                    ),
                    ListTile(
                      title: Text('Código da GPC'),
                      subtitle: Text('${_store.product?.gpcCode}'),
                    ),
                    ListTile(
                      title: Text('Descrição da GPC'),
                      subtitle: Text('${_store.product?.gpcDescription}'),
                    ),
                    ListTile(
                      title: Text('Código da NCM'),
                      subtitle: Text('${_store.product?.ncmCode}'),
                    ),
                    ListTile(
                      title: Text('Descrição da NCM'),
                      subtitle: Text('${_store.product?.ncmDescription}'),
                    ),
                    ListTile(
                      title: Text('Descrição completa da NCM'),
                      subtitle: Text('${_store.product?.ncmFullDescription}'),
                    ),
                    ListTile(
                      title: Text('Quantidade em estoque'),
                      subtitle: Text('${_store.product?.inStock}'),
                    ),
                    ListTile(
                      title: Text('Imagem do produto (URL)'),
                      subtitle: Text('${_store.product?.thumbnail}'),
                      trailing: Container(
                        width: width/4,
                        child: IconButton(
                          onPressed: () async {
                            await _store.launchApp('${_store.product?.thumbnail}');
                          },
                          icon: Icon(Icons.web_asset),
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ),
          ),
        );
      }
    );
  }
}