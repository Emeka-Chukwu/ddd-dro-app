import 'package:dro/domain/menu/product.dart';
import 'package:dro/domain/menu/repository.dart';
import 'package:dro/infrastructure/menu/data.dart';
import 'package:dro/infrastructure/menu/products.dart';

class MenuRepositoryImpl extends MenuRespository {
  @override
  List<ProductEntity> getAllProducts() {
    final List<ProductEntity> products = [];
    final data = productsData;
    for (final element in data) {
      products.add(Products.fromJson(element).toProductEntity());
    }
    return products;
  }

  @override
  List<ProductEntity> getFilteredProducts(String text) {
    final List<ProductEntity> products = [];
    final data = productsData;
    for (final element in data) {
      final entity = Products.fromJson(element).toProductEntity();
      if (entity.title.contains(text) || entity.soldBy.contains(text)) {
        products.add(entity);
      }
    }

    return products;
  }

  @override
  List<ProductEntity> getSearchedProducts(String searchText) {
    final List<ProductEntity> products = [];
    // final List<ProductEntity> searched = [];

    final data = productsData;
    for (final element in data) {
      final entity = Products.fromJson(element).toProductEntity();
      if (entity.title.toLowerCase().contains(searchText.toLowerCase()) ||
          entity.soldBy.contains(searchText)) {
        products.add(entity);
      }
    }
    return products;
  }

  @override
  List<ProductEntity> getSortedProducts(String text, {bool sort = true}) {
    final List<ProductEntity> products = [];
    final data = productsData;
    for (final element in data) {
      products.add(Products.fromJson(element).toProductEntity());
    }
    // final sorted = sort?
    //     products.sort((prev, next) => prev.title.compareTo(next.title)):
    //       products.sort((prev, next) => next.title.compareTo(prev.title));
    return products;
  }
}
