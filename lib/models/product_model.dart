class Product {
  String? idProduct;
  String? name;
  String price;
  String? imageUrl;
  int quality;
  String color;

  Product({
    this.idProduct,
    this.name,
    required this.price,
    this.imageUrl,
    required this.quality,
    required this.color,
  });
}
