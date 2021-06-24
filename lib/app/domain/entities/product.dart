class Product {
  int id;
  String gtin;
  String description;
  double price;
  String brand_name;
  String gpc_code;
  String gpc_description;
  String ncm_code;
  String ncm_description;
  String ncm_full_description;
  String thumbnail;
  int in_stock;
  bool active;
  bool deleted;
  DateTime created_date;

  Product({
    required this.id,
    required this.gtin,
    required this.description,
    required this.price,
    required this.brand_name,
    required this.gpc_code,
    required this.gpc_description,
    required this.ncm_code,
    required this.ncm_description,
    required this.ncm_full_description,
    required this.thumbnail,
    required this.in_stock,
    required this.active,
    required this.deleted,
    required this.created_date
  });
}