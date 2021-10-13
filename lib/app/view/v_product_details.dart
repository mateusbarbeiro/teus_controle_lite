import 'dart:ui';

import 'package:background_app_bar/background_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:teus_controle_lite/app/domain/entities/product.dart';
import 'package:teus_controle_lite/app/view/stores/product_details_store.dart';

class VProductDetails extends StatelessWidget {
  ImageProvider<Object> handleProductImage(Product product) {
    if (product.thumbnail == null ||
        !Uri.tryParse(product.thumbnail ?? "")!.isAbsolute) {
      return AssetImage('lib/app/assets/basketImage.jpg');
    } else {
      return NetworkImage(product.thumbnail ?? '');
    }
  }

  @override
  Widget build(BuildContext context) {
    var _store = ProductDetailsStore(context);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var width = constraints.biggest.width;

        return Hero(
          tag: "card${_store.productId}",
          child: Scaffold(
            body: Observer(
              builder: (context) => FutureBuilder(
                future: _store.product,
                builder: (context, f) {
                  if (!f.hasData) {
                    return Center(
                      child: SpinKitHourGlass(
                        color: Colors.red,
                        size: 50.0,
                      ),
                    );
                  } else {
                    var item = f.data! as Product;
                    return NestedScrollView(
                      headerSliverBuilder: (_, __) => <Widget>[
                        SliverAppBar(
                          key: Key(
                            _store.productId.toString(),
                          ),
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
                                _store.goToForm(item);
                              },
                            )
                          ],
                          flexibleSpace: BackgroundFlexibleSpaceBar(
                            centerTitle: false,
                            titlePadding: const EdgeInsets.only(
                              left: 20.0,
                              bottom: 20.0,
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
                                      image: handleProductImage(item),
                                      fit: BoxFit.fitHeight,
                                    ),
                                    color: Colors.white),
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
                            subtitle: Text('${item.gtin}'),
                          ),
                          ListTile(
                            title: Text('Descrição'),
                            subtitle: Text('${item.description}'),
                          ),
                          ListTile(
                            title: Text('Preço'),
                            subtitle: Text('${item.price}'),
                          ),
                          ListTile(
                            title: Text('Marca'),
                            subtitle: Text('${item.brandName}'),
                          ),
                          ListTile(
                            title: Text('Código da GPC'),
                            subtitle: Text('${item.gpcCode}'),
                          ),
                          ListTile(
                            title: Text('Descrição da GPC'),
                            subtitle: Text('${item.gpcDescription}'),
                          ),
                          ListTile(
                            title: Text('Código da NCM'),
                            subtitle: Text('${item.ncmCode}'),
                          ),
                          ListTile(
                            title: Text('Descrição da NCM'),
                            subtitle: Text('${item.ncmDescription}'),
                          ),
                          ListTile(
                            title: Text('Descrição completa da NCM'),
                            subtitle:
                                Text('${item.ncmFullDescription}'),
                          ),
                          ListTile(
                            title: Text('Quantidade em estoque'),
                            subtitle: Text('${item.inStock}'),
                          ),
                          ListTile(
                            title: Text('Imagem do produto (URL)'),
                            subtitle: Text('${item.thumbnail}'),
                            trailing: Container(
                              width: width / 4,
                              child: IconButton(
                                onPressed: item.thumbnail == null ||
                                        item.thumbnail == ''
                                    ? null
                                    : () async {
                                        await _store.launchApp(
                                          '${item.thumbnail}',
                                        );
                                      },
                                // onPressed: () async {
                                //   await _store.launchApp('${_store.product?.thumbnail}');
                                // },
                                icon: Icon(Icons.web_asset),
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                }
              ),
            ),
          ),
        );
      }
    );
  }
}
