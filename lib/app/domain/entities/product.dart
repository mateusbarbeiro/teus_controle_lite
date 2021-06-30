class Product {
  int? id;
  String gtin;
  String description;
  double? price;
  String? brandName;
  String? gpcCode;
  String? gpcDescription;
  String? ncmCode;
  String? ncmDescription;
  String? ncmFullDescription;
  String? thumbnail;
  int inStock;
  bool? active;
  bool? deleted;
  DateTime? createdDate;

  Product({
    this.id,
    required this.gtin, // Global Trade Item Number
    required this.description,
    this.price,
    this.brandName,
    this.gpcCode,
    this.gpcDescription,
    this.ncmCode,
    this.ncmDescription,
    this.ncmFullDescription,
    this.thumbnail,
    required this.inStock,
    active,
    deleted,
    createdDate
  }) {
    this.active = active == 1;
    this.deleted = deleted == 1;
    this.createdDate = DateTime.tryParse(createdDate);
  }
}