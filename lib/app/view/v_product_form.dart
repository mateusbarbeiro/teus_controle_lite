import 'package:flutter/material.dart';
import 'package:teus_controle_lite/app/domain/services/web_service.dart';
import 'package:teus_controle_lite/app/view/stores/product_form_store.dart';

class VProductForm extends StatefulWidget {
  @override
  State<VProductForm> createState() => _VProductFormState();
}

class _VProductFormState extends State<VProductForm> {
  var _form = GlobalKey<FormState>();

  var description;
  var price;
  var brandName;
  var gpcCode;
  var gpcDescription;
  var ncmCode;
  var ncmDescription;
  var ncmFullDescription;
  var thumbnail;

  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _brandNameController = TextEditingController();
  final _gpcCodeController = TextEditingController();
  final _gpcDescriptionController = TextEditingController();
  final _ncmCodeController = TextEditingController();
  final _ncmDescriptionController = TextEditingController();
  final _ncmFullDescriptionController = TextEditingController();
  final _thumbnailController = TextEditingController();

  String _treatPriceString(String? value) {
    // formato esteprado "R$ 2,99",
    if (value == null || value == '')
      return '0';
    else {
      value = value.replaceAll(',', '.');
      value = value.replaceAll('R\$ ', '');
      var list = value.split('a');
      return list[0];
    }
  }

  Widget fieldGtin(ProductFormStore store) {
    return TextFormField(
      initialValue: store.product?.gtin ?? "",
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Código de barras',
      ),
      validator: store.validateGtin,
      onSaved: (newValue) => store.product?.gtin = newValue,
      onChanged: (value) async {
        if (value.length == 8 || (value.length >= 12 && value.length <= 14)) {
          await WebService().requestGetProduct(value).then((value) {
            setState(() {
              _descriptionController.text = value.description ?? '';
              description = value.description ?? '';

              _priceController.text =
                  value.price == null ? '' : _treatPriceString(value.price);
              price = value.price == null
                  ? 0
                  : double.parse(_treatPriceString(value.price));

              _brandNameController.text = value.brand?.name ?? '';
              brandName = value.brand?.name ?? '';

              _gpcCodeController.text = value.gpc?.code ?? '';
              gpcCode = value.gpc?.code ?? '';

              _gpcDescriptionController.text = value.gpc?.description ?? '';
              gpcDescription = value.gpc?.description ?? '';

              _ncmCodeController.text = value.ncm?.code ?? '';
              ncmCode = value.ncm?.code ?? '';

              _ncmDescriptionController.text = value.ncm?.description ?? '';
              ncmDescription = value.ncm?.description ?? '';

              _ncmFullDescriptionController.text =
                  value.ncm?.fullDescription ?? '';
              ncmFullDescription = value.ncm?.fullDescription ?? '';

              _thumbnailController.text = value.thumbnail ?? '';
              thumbnail = value.thumbnail ?? '';
            });
          });
        }
      },
    );
  }

  Widget fieldDescription(ProductFormStore store) {
    _descriptionController.text = store.product?.description ?? '';
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Descrição',
      ),
      validator: store.validateDescription,
      onSaved: (newValue) => store.product?.description = newValue,
      controller: _descriptionController,
    );
  }

  Widget fieldPrice(ProductFormStore store) {
    _priceController.text = store.product?.price == null ? '' : store.product!.price.toString();
    return TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'Preço',
        ),
        onSaved: (newValue) => store.product?.price = double.parse(newValue!),
        controller: _priceController);
  }

  Widget fieldBrandName(ProductFormStore store) {
    _brandNameController.text = store.product?.brandName ?? '';
    return TextFormField(
        decoration: InputDecoration(
          labelText: 'Marca',
        ),
        onSaved: (newValue) => store.product?.brandName = newValue,
        controller: _brandNameController);
  }

  Widget fieldGpcCode(ProductFormStore store) {
    _gpcCodeController.text = store.product?.gpcCode ?? '';
    return TextFormField(
        decoration: InputDecoration(
            labelText: 'Codigo da GPC',
            hintText: 'Codigo da Classificação do Produto'),
        onSaved: (newValue) => store.product?.gpcCode = newValue,
        controller: _gpcCodeController);
  }

  Widget fieldGpcDescription(ProductFormStore store) {
    _gpcDescriptionController.text = store.product?.gpcDescription ?? '';
    return TextFormField(
        decoration: InputDecoration(
            labelText: 'Descrição da GPC',
            hintText: 'Descrição da Classificação do Produto'),
        onSaved: (newValue) => store.product?.gpcDescription = newValue,
        controller: _gpcDescriptionController);
  }

  Widget fieldNcmCode(ProductFormStore store) {
    _ncmCodeController.text = store.product?.ncmCode ?? '';
    return TextFormField(
        decoration: InputDecoration(
            labelText: 'Código da NCM',
            hintText: 'Código da Nomenclatura Comum do Mercosul '),
        onSaved: (newValue) => store.product?.ncmCode = newValue,
        controller: _ncmCodeController);
  }

  Widget fieldNcmDescription(ProductFormStore store) {
    _ncmDescriptionController.text = store.product?.ncmDescription ?? '';
    return TextFormField(
        decoration: InputDecoration(
            labelText: 'Descrição da NCM',
            hintText: 'Descrição da Nomenclatura Comum do Mercosul'),
        onSaved: (newValue) => store.product?.ncmDescription = newValue,
        controller: _ncmDescriptionController);
  }

  Widget fieldNcmFullDescription(ProductFormStore store) {
    _ncmFullDescriptionController.text =
        store.product?.ncmFullDescription ?? '';
    return TextFormField(
        decoration: InputDecoration(
            labelText: 'Descrição completa da NCM',
            hintText: 'Descrição completa da Nomenclatura Comum do Mercosul'),
        onSaved: (newValue) => store.product?.ncmFullDescription = newValue,
        controller: _ncmFullDescriptionController);
  }

  Widget fieldThumbnail(ProductFormStore store) {
    _thumbnailController.text = store.product?.thumbnail ?? '';
    return TextFormField(
        decoration: InputDecoration(
          labelText: 'Imagem do Produto (URL)',
        ),
        onSaved: (newValue) => store.product?.thumbnail = newValue,
        controller: _thumbnailController);
  }

  Widget fieldInStock(ProductFormStore store) {
    return TextFormField(
      initialValue: store.product?.inStock == null
          ? '0'
          : store.product?.inStock.toString(),
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
    _store.product?.description  = _store.product?.description ?? description ;
    _store.product?.price = _store.product?.price == null ? price : _store.product?.price;
    _store.product?.brandName = _store.product?.brandName ?? brandName;
    _store.product?.gpcCode = _store.product?.gpcCode ?? gpcCode;
    _store.product?.gpcDescription = _store.product?.gpcDescription ?? gpcDescription;
    _store.product?.ncmCode = _store.product?.ncmCode ?? ncmCode;
    _store.product?.ncmDescription = _store.product?.ncmDescription ?? ncmDescription;
    _store.product?.ncmFullDescription = _store.product?.ncmFullDescription ?? ncmFullDescription;
    _store.product?.thumbnail  = _store.product?.thumbnail ?? thumbnail;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Cadastro de Contato'
          ),
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
                icon: Icon(Icons.save))
          ],
        ),
        body: ListView(padding: EdgeInsets.all(10), children: [
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
        ]));
  }
}
