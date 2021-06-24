class Product {
  int? id;
  String gtin;
  String description;
  double price;
  String brandName;
  String gpcCode;
  String gpcDescription;
  String ncmCode;
  String ncmDescription;
  String ncmFullDescription;
  String thumbnail;
  int inStock;
  bool? active;
  bool? deleted;
  DateTime? createdDate;

  Product({
    this.id,
    required this.gtin,
    required this.description,
    required this.price,
    required this.brandName,
    required this.gpcCode,
    required this.gpcDescription,
    required this.ncmCode,
    required this.ncmDescription,
    required this.ncmFullDescription,
    required this.thumbnail,
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