import 'package:dro/domain/bag/bag.dart';
import 'package:dro/domain/bag/repository.dart';
import 'package:dro/infrastructure/bag/data.dart';
// import 'package:dro/infrastructure/bag/data.dart';

class BagRespositoryImpl extends BagRepository {
  List<BagEntity> bags = bagEntity;
  // = bagEntity;
  @override
  List<BagEntity> getBagList() {
    return bags;
  }

  @override
  List<BagEntity> addProductToBag(BagEntity entity) {
    bags.add(entity);
    return bags;
  }

  @override
  List<BagEntity> deleteProductFromBag(BagEntity entity) {
    var id = -1;
    if (bags.isNotEmpty) {
      id = bags.indexWhere((element) => entity.id == element.id);
    }
    if (id != -1) {
      bags.removeAt(id);
    }
    return bags;
  }

  @override
  double calculateTheTotalPrice(List<BagEntity> bags) {
    double totalCost = 0;
    for (final bag in bags) {
      totalCost = totalCost + (bag.quantity * bag.productEntity.price);
    }

    return totalCost;
  }
}
