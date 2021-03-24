class ProductEntity {
  int id;
  String title;
  String type;
  String soldBy;
  int quantity;
  double price;
  int size;
  String constituents;
  String dispensed;
  String imageUrl;
  String description;

  ProductEntity({
    required this.id,
    required this.title,
    required this.type,
    required this.soldBy,
    required this.quantity,
    required this.price,
    required this.size,
    required this.constituents,
    required this.dispensed,
    required this.imageUrl,
    required this.description,
  });
}
