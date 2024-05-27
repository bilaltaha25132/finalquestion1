class Product {
  final String id;
  final String name;
  final String category;
  final double price;
  final String imageUrl;

  Product(
      {required this.id,
      required this.name,
      required this.category,
      required this.price,
      required this.imageUrl});

  factory Product.fromFirestore(Map<String, dynamic> data, String id) {
    return Product(
      id: id,
      name: data['name'],
      category: data['category'],
      price: data['price'],
      imageUrl: data['imageUrl'],
    );
  }
}
