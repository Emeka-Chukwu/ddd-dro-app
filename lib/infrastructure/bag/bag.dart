import 'package:dro/domain/bag/bag.dart';
import 'package:dro/domain/menu/product.dart';

class Bags extends BagEntity {
  @override
  // ignore: overridden_fields
  int id;
  @override
  // ignore: overridden_fields
  ProductEntity productEntity;
  @override
  // ignore: overridden_fields
  int quantity;

  Bags({required this.id, required this.productEntity, required this.quantity})
      : super(
          id: id,
          productEntity: productEntity,
          quantity: quantity,
        );

  factory Bags.fromEntity(BagEntity entity) => Bags(
        id: entity.id,
        productEntity: entity.productEntity,
        quantity: entity.quantity,
      );

  BagEntity toBagEntity() => BagEntity(
        id: id,
        productEntity: productEntity,
        quantity: quantity,
      );
}
