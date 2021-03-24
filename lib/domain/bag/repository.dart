import 'package:dro/domain/bag/bag.dart';

abstract class BagRepository {
  List<BagEntity> getBagList();
  List<BagEntity> addProductToBag(BagEntity entity);
  List<BagEntity> deleteProductFromBag(BagEntity entity);
  double calculateTheTotalPrice(List<BagEntity> bags);
}
