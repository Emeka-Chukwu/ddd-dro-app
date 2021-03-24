import 'package:dro/domain/menu/product.dart';

class BagEntity {
  int id;
  ProductEntity productEntity;
  int quantity;

  BagEntity({
    required this.id,
    required this.productEntity,
    required this.quantity,
  });
}
