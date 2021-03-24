import 'package:dro/domain/bag/bag.dart';
import 'package:dro/domain/menu/product.dart';

ProductEntity entity = ProductEntity(
  constituents: "eeee",
  dispensed: 'Dispensed',
  imageUrl: 'generico',
  id: 1,
  price: 37,
  quantity: 4,
  size: 9,
  soldBy: 'Emzor',
  title: 'title',
  type: 'type',
  description: "description here of the drug",
);

ProductEntity entity2 = ProductEntity(
  constituents: "eeee",
  dispensed: 'Dispensed',
  imageUrl: 'generico',
  id: 2,
  price: 37,
  quantity: 4,
  size: 9,
  soldBy: 'Emzor',
  title: 'title',
  type: 'type',
  description: "description here of the drug",
);

BagEntity bagEntity = BagEntity(id: 1, productEntity: entity, quantity: 1);
BagEntity bagEntity1 = BagEntity(id: 2, productEntity: entity, quantity: 2);
