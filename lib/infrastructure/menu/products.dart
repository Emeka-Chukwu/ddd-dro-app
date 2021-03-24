import 'package:dro/domain/menu/product.dart';

class Products extends ProductEntity {
  @override
  // ignore: overridden_fields
  int id;
  @override
  // ignore: overridden_fields
  String title;
  @override
  // ignore: overridden_fields
  String type;
  @override
  // ignore: overridden_fields
  String soldBy;
  @override
  // ignore: overridden_fields
  int quantity;
  @override
  // ignore: overridden_fields
  double price;
  @override
  // ignore: overridden_fields
  int size;
  @override
  // ignore: overridden_fields
  String constituents;
  @override
  // ignore: overridden_fields
  String dispensed;
  @override
  // ignore: overridden_fields
  String imageUrl;
  @override
  // ignore: overridden_fields
  String description;

  Products({
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
  }) : super(
          id: id,
          title: title,
          type: type,
          soldBy: soldBy,
          quantity: quantity,
          price: price,
          size: size,
          constituents: constituents,
          dispensed: dispensed,
          imageUrl: imageUrl,
          description: description,
        );

  factory Products.fromEntity(ProductEntity entity) {
    return Products(
      id: entity.id,
      title: entity.title,
      type: entity.type,
      soldBy: entity.soldBy,
      quantity: entity.quantity,
      price: entity.price,
      size: entity.size,
      constituents: entity.constituents,
      dispensed: entity.dispensed,
      imageUrl: entity.imageUrl,
      description: entity.description,
    );
  }
  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      id: json["id"] as int,
      title: json["title"] as String,
      type: json["type"] as String,
      soldBy: json["soldBy"] as String,
      quantity: json["quantity"] as int,
      price: (json["price"] as int).toDouble(),
      size: json["size"] as int,
      constituents: json["constituents"] as String,
      dispensed: json["dispensed"] as String,
      imageUrl: json["imageUrl"] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "type": type,
        "soldBy": soldBy,
        "quantity": quantity,
        "price": price,
        "size": size,
        "constituents": constituents,
        "dispensed": dispensed,
        "imageUrl": imageUrl,
        ' description': description,
      };

  ProductEntity toProductEntity() => ProductEntity(
        id: id,
        title: title,
        type: type,
        soldBy: soldBy,
        quantity: quantity,
        price: price,
        size: size,
        constituents: constituents,
        dispensed: dispensed,
        imageUrl: imageUrl,
        description: description,
      );
}
