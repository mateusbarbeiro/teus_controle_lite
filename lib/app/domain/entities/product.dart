class Product {
  dynamic id;
  String? gtin = "";
  String? description = "";
  double? price;
  String? brandName = "";
  String? gpcCode = "";
  String? gpcDescription = "";
  String? ncmCode = "";
  String? ncmDescription = "";
  String? ncmFullDescription = "";
  String? thumbnail = "";
  int? inStock;
  bool? active = true;
  bool? deleted = false;

  Product({
    this.id,
    this.gtin, // Global Trade Item Number
    this.description,
    this.price,
    this.brandName,
    this.gpcCode,
    this.gpcDescription,
    this.ncmCode,
    this.ncmDescription,
    this.ncmFullDescription,
    this.thumbnail,
    this.inStock,
    active,
    deleted,
    // createdDate = DateTime.now().toString()
  }) {
    this.active = active == 1;
    this.deleted = deleted == 1;
  }
}