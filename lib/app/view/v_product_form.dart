import 'package:flutter/material.dart';
import 'package:teus_controle_lite/app/view/stores/product_form_store.dart';

class VProductForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  
  Widget fieldGtin(ProductFormStore store) {
    return TextFormField(
      initialValue: store.product?.gtin ?? "",
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Código de barras',
      ),
      validator: store.validateGtin,
      onSaved: (newValue) => store.product?.gtin = newValue
    );
  }

  Widget fieldDescription(ProductFormStore store) {
    return TextFormField(
      initialValue: store.product?.description ?? "",
      decoration: InputDecoration(
        labelText: 'Descrição',
      ),
      validator: store.validateDescription,
      onSaved: (newValue) => store.product?.description = newValue,
    );
  }

  Widget fieldPrice(ProductFormStore store) {
    return TextFormField(
      initialValue: store.product?.price.toString() ?? "",
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Preço',
      ),
      onSaved: (newValue) => store.product?.price = double.parse(newValue!)
    );
  }

  Widget fieldBrandName(ProductFormStore store) {
    return TextFormField(
      initialValue: store.product?.brandName ?? "",
      decoration: InputDecoration(
        labelText: 'Marca',
      ),
      onSaved: (newValue) => store.product?.brandName = newValue
    );
  }

  Widget fieldGpcCode(ProductFormStore store) {
    return TextFormField(
      initialValue: store.product?.gpcCode ?? "",
      decoration: InputDecoration(
        labelText: 'Codigo da GPC',
        hintText: 'Codigo da Classificação do Produto'
      ),
      onSaved: (newValue) => store.product?.gpcCode = newValue
    );
  }

  Widget fieldGpcDescription(ProductFormStore store) {
    return TextFormField(
      initialValue: store.product?.gpcDescription ?? "",
      decoration: InputDecoration(
        labelText: 'Descrição da GPC',
        hintText: 'Descrição da Classificação do Produto'
      ),
      onSaved: (newValue) => store.product?.gpcDescription = newValue
    );
  }

  Widget fieldNcmCode(ProductFormStore store) {
    return TextFormField(
      initialValue: store.product?.ncmCode ?? "",
      decoration: InputDecoration(
        labelText: 'Código da NCM',
        hintText: 'Código da Nomenclatura Comum do Mercosul '
      ),
      onSaved: (newValue) => store.product?.ncmCode = newValue
    );
  }

  Widget fieldNcmDescription(ProductFormStore store) {
    return TextFormField(
      initialValue: store.product?.ncmDescription ?? "",
      decoration: InputDecoration(
        labelText: 'Descrição da NCM',
        hintText: 'Descrição da Nomenclatura Comum do Mercosul'
      ),
      onSaved: (newValue) => store.product?.ncmDescription = newValue
    );
  }

  Widget fieldNcmFullDescription(ProductFormStore store) {
    return TextFormField(
      initialValue: store.product?.ncmFullDescription ?? "",
      decoration: InputDecoration(
        labelText: 'Descrição completa da NCM',
        hintText: 'Descrição completa da Nomenclatura Comum do Mercosul'
      ),
      onSaved: (newValue) => store.product?.ncmFullDescription = newValue
    );
  }

  Widget fieldThumbnail(ProductFormStore store) {
    return TextFormField(
      initialValue: store.product?.thumbnail ?? "",
      decoration: InputDecoration(
        labelText: 'Imagem do Produto (URL)',
      ),
      onSaved: (newValue) => store.product?.thumbnail = newValue
    );
  }

  Widget fieldInStock(ProductFormStore store) {
    return TextFormField(
      initialValue: store.product?.inStock.toString() ?? "0",
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Quantidade em Estoque',
      ),
      validator: store.validateStock,
      onSaved: (newValue) => store.product?.inStock = int.parse(newValue!),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _store = ProductFormStore(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Contato'),
        actions: [
          IconButton(
            onPressed: () {
              _form.currentState?.validate();
              _form.currentState?.save();
              if (_store.isValid) {
                _store.save();
                Navigator.of(context).pop();
              }
            },
            icon: Icon(Icons.save)
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [ 
          Form(
            key: _form,
            child: Column(
              children: [
                fieldGtin(_store),
                fieldDescription(_store),
                fieldPrice(_store),
                fieldBrandName(_store),
                fieldGpcCode(_store),
                fieldGpcDescription(_store),
                fieldNcmCode(_store),
                fieldNcmDescription(_store),
                fieldNcmFullDescription(_store),
                fieldThumbnail(_store),
                fieldInStock(_store)
              ],
            ),
          ),
        ]
      )
    );
  }
}

// import 'dart:ui';

// import 'package:background_app_bar/background_app_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:teus_controle_lite/app/view/stores/product_form_store.dart';

// class VProductForm extends StatelessWidget {
//   final _form = GlobalKey<FormState>();

//   Widget fieldGtin(ProductFormStore store) {
//     return TextFormField(
//       initialValue: store.product?.gtin ?? "",
//       keyboardType: TextInputType.number,
//       decoration: InputDecoration(
//         labelText: 'Código de barras',
//       ),
//       validator: store.validateGtin,
//       onSaved: (newValue) => store.product?.gtin = newValue
//     );
//   }

//   Widget fieldDescription(ProductFormStore store) {
//     return TextFormField(
//       initialValue: store.product?.description ?? "",
//       decoration: InputDecoration(
//         labelText: 'Descrição',
//       ),
//       validator: store.validateDescription,
//       onSaved: (newValue) => store.product?.description = newValue,
//     );
//   }

//   Widget fieldPrice(ProductFormStore store) {
//     return TextFormField(
//       initialValue: store.product?.price.toString() ?? "",
//       keyboardType: TextInputType.number,
//       decoration: InputDecoration(
//         labelText: 'Preço',
//       ),
//       onSaved: (newValue) => store.product?.price = double.parse(newValue!)
//     );
//   }

//   Widget fieldBrandName(ProductFormStore store) {
//     return TextFormField(
//       initialValue: store.product?.brandName ?? "",
//       decoration: InputDecoration(
//         labelText: 'Marca',
//       ),
//       onSaved: (newValue) => store.product?.brandName = newValue
//     );
//   }

//   Widget fieldGpcCode(ProductFormStore store) {
//     return TextFormField(
//       initialValue: store.product?.gpcCode ?? "",
//       decoration: InputDecoration(
//         labelText: 'Codigo da GPC',
//         hintText: 'Codigo da Classificação do Produto'
//       ),
//       onSaved: (newValue) => store.product?.gpcCode = newValue
//     );
//   }

//   Widget fieldGpcDescription(ProductFormStore store) {
//     return TextFormField(
//       initialValue: store.product?.gpcDescription ?? "",
//       decoration: InputDecoration(
//         labelText: 'Descrição da GPC',
//         hintText: 'Descrição da Classificação do Produto'
//       ),
//       onSaved: (newValue) => store.product?.gpcDescription = newValue
//     );
//   }

//   Widget fieldNcmCode(ProductFormStore store) {
//     return TextFormField(
//       initialValue: store.product?.ncmCode ?? "",
//       decoration: InputDecoration(
//         labelText: 'Código da NCM',
//         hintText: 'Código da Nomenclatura Comum do Mercosul '
//       ),
//       onSaved: (newValue) => store.product?.ncmCode = newValue
//     );
//   }

//   Widget fieldNcmDescription(ProductFormStore store) {
//     return TextFormField(
//       initialValue: store.product?.ncmDescription ?? "",
//       decoration: InputDecoration(
//         labelText: 'Descrição da NCM',
//         hintText: 'Descrição da Nomenclatura Comum do Mercosul'
//       ),
//       onSaved: (newValue) => store.product?.ncmDescription = newValue
//     );
//   }

//   Widget fieldNcmFullDescription(ProductFormStore store) {
//     return TextFormField(
//       initialValue: store.product?.ncmFullDescription ?? "",
//       decoration: InputDecoration(
//         labelText: 'Descrição completa da NCM',
//         hintText: 'Descrição completa da Nomenclatura Comum do Mercosul'
//       ),
//       onSaved: (newValue) => store.product?.ncmFullDescription = newValue
//     );
//   }

//   Widget fieldThumbnail(ProductFormStore store) {
//     return TextFormField(
//       initialValue: store.product?.thumbnail ?? "",
//       decoration: InputDecoration(
//         labelText: 'Imagem do Produto (URL)',
//       ),
//       onSaved: (newValue) => store.product?.thumbnail = newValue
//     );
//   }

//   Widget fieldInStock(ProductFormStore store) {
//     return TextFormField(
//       initialValue: store.product?.inStock.toString() ?? "0",
//       keyboardType: TextInputType.number,
//       decoration: InputDecoration(
//         labelText: 'Quantidade em Estoque',
//       ),
//       validator: store.validateStock,
//       onSaved: (newValue) => store.product?.inStock = int.parse(newValue!),
//     );
//   }

//   ImageProvider<Object> handleProductImage(ProductFormStore store) {
//     if (
//       store.product?.thumbnail == null ||
//       !Uri.tryParse(store.product?.thumbnail ?? "")!.isAbsolute
//     ) {
//       return AssetImage('lib/app/assets/basketImage.jpg');
//     } else {
//       return NetworkImage(store.product?.thumbnail ?? '');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     var _store = ProductFormStore(context);
//     return Hero(
//       tag: "card${_store.product?.id ?? UniqueKey()}",
//       child: Scaffold(
//         body: NestedScrollView(
//           headerSliverBuilder: (_, __) => <Widget>[
//             SliverAppBar(
//               key: Key(_store.product?.id.toString() ?? UniqueKey().toString()),
//               shadowColor: Colors.black,
//               expandedHeight: 250.0,
//               floating: false,
//               pinned: true,
//               snap: false,
//               elevation: 0.0,
//               backgroundColor: Colors.transparent,
//               actions: [
//                 IconButton(
//                   icon: Icon(Icons.save),
//                   onPressed: () {
//                     _form.currentState?.validate();
//                     _form.currentState?.save();
//                     if (_store.isValid) {
//                       try {
//                         _store.save();
//                         Navigator.pop(context);
//                       } catch (e) {
//                         SnackBar(
//                           content: Text(
//                             'Erro $e!',
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 15,
//                               fontWeight: FontWeight.bold
//                             ),
//                           )
//                         );
//                       }
//                     }
//                   },
//                 )
//               ],
//               flexibleSpace: BackgroundFlexibleSpaceBar(
//                 centerTitle: false,
//                 titlePadding: const EdgeInsets.only(
//                   left: 20.0,
//                   bottom: 20.0
//                 ),
//                 background: ClipRect(
//                   child: Container(
//                     child: new BackdropFilter(
//                       filter: new ImageFilter.blur(),
//                       child: new Container(
//                         decoration: new BoxDecoration(
//                           gradient: LinearGradient(
//                             begin: FractionalOffset.topCenter,
//                             end: FractionalOffset.center,
//                             colors: [
//                               Colors.black.withOpacity(0.8),
//                               Colors.black.withOpacity(0.0)
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: handleProductImage(_store),
//                         fit: BoxFit.cover,
//                       )
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//           body: Padding(
//             padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
//             child: SingleChildScrollView (
//               child: Form(
//                 key: _form,
//                 child: Column(
//                   mainAxisSize : MainAxisSize.min,
//                   children: [
//                     fieldGtin(_store),
//                     fieldDescription(_store),
//                     fieldPrice(_store),
//                     fieldBrandName(_store),
//                     fieldGpcCode(_store),
//                     fieldGpcDescription(_store),
//                     fieldNcmCode(_store),
//                     fieldNcmDescription(_store),
//                     fieldNcmFullDescription(_store),
//                     fieldThumbnail(_store),
//                     fieldInStock(_store)
//                   ],
//                 )
//               )
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }