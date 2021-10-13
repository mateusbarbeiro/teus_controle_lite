class ProductCosmosResponse {
  String? description;
  Brand? brand;
  Gpc? gpc;
  int? gtin;
  String? thumbnail;
  double? width;
  double? height;
  double? length;
  double? netWeight;
  double? grossWeight;
  String? createdAt;
  String? updatedAt;
  String? price;
  double? avgPrice;
  double? maxPrice;
  double? minPrice;
  List<Gtins>? gtins;
  String? origin;
  String? barcodeImage;
  Ncm? ncm;

  ProductCosmosResponse(
      {this.description,
      this.gtin,
      this.brand,
      this.thumbnail,
      this.width,
      this.height,
      this.gpc,
      this.length,
      this.netWeight,
      this.grossWeight,
      this.createdAt,
      this.updatedAt,
      this.price,
      this.avgPrice,
      this.maxPrice,
      this.minPrice,
      this.gtins,
      this.origin,
      this.barcodeImage,
      this.ncm});

  ProductCosmosResponse.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    gtin = json['gtin'];
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    thumbnail = json['thumbnail'];
    width = json['width'];
    height = json['height'];
    length = json['length'];
    netWeight = json['net_weight'] == null ? 0.0 : json['net_weight'] + 0.0;
    grossWeight = json['gross_weight'] == null ? 0.0 : json['gross_weight'] + 0.0;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    price = json['price'] ?? '';
    avgPrice = json['avg_price'] == null ? 0.0 : json['avg_price'] + 0.0;
    maxPrice = json['max_price'] == null ? 0.0 : json['max_price'] + 0.0;
    minPrice = json['min_price'] == null ? 0.0 : json['min_price'] + 0.0;
    gpc = json['gpc'] != null ? new Gpc.fromJson(json['gpc']) : null;
    if (json['gtins'] != null) {
      gtins = [];
      json['gtins'].forEach((v) {
        gtins?.add(Gtins.fromJson(v));
      });
    }
    origin = json['origin'];
    barcodeImage = json['barcode_image'];
    ncm = json['ncm'] != null ? Ncm.fromJson(json['ncm']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['description'] = this.description;
    if (this.gpc != null) {
      data['gpc'] = this.gpc?.toJson();
    }
    data['gtin'] = this.gtin;
    data['thumbnail'] = this.thumbnail;
    data['width'] = this.width;
    data['height'] = this.height;
    data['length'] = this.length;
    data['net_weight'] = this.netWeight;
    data['gross_weight'] = this.grossWeight;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['price'] = this.price;
    data['avg_price'] = this.avgPrice;
    data['max_price'] = this.maxPrice;
    data['min_price'] = this.minPrice;
    if (this.gtins != null) {
      data['gtins'] = this.gtins?.map((v) => v.toJson()).toList();
    }
    data['origin'] = this.origin;
    data['barcode_image'] = this.barcodeImage;
    if (this.ncm != null) {
      data['ncm'] = this.ncm?.toJson();
    }
    return data;
  }
}

class Gtins {
  int? gtin;
  CommercialUnit? commercialUnit;

  Gtins({this.gtin, this.commercialUnit});

  Gtins.fromJson(Map<String, dynamic> json) {
    gtin = json['gtin'];
    commercialUnit = json['commercial_unit'] != null
        ? CommercialUnit.fromJson(json['commercial_unit'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['gtin'] = this.gtin;
    if (this.commercialUnit != null) {
      data['commercial_unit'] = this.commercialUnit?.toJson();
    }
    return data;
  }
}

class CommercialUnit {
  String? typePackaging;
  double? quantityPackaging;

  CommercialUnit(
      {this.typePackaging, this.quantityPackaging});

  CommercialUnit.fromJson(Map<String, dynamic> json) {
    typePackaging = json['type_packaging'];
    quantityPackaging = json['quantity_packaging'] == null ? 0.0 : json['quantity_packaging'] + 0.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type_packaging'] = this.typePackaging;
    data['quantity_packaging'] = this.quantityPackaging;
    return data;
  }
}

class Ncm {
  String? code;
  String? description;
  String? fullDescription;

  Ncm({this.code, this.description, this.fullDescription});

  Ncm.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    description = json['description'];
    fullDescription = json['full_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = this.code;
    data['description'] = this.description;
    data['full_description'] = this.fullDescription;
    return data;
  }
}

class Brand {
  String? name;
  String? picture;

  Brand({this.name, this.picture});

  Brand.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['picture'] = this.picture;
    return data;
  }
}

class Gpc {
  String? code;
  String? description;

  Gpc({this.code, this.description});

  Gpc.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['description'] = this.description;
    return data;
  }
}