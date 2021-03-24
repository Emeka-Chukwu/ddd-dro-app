import 'package:dro/domain/menu/product.dart';

abstract class MenuRespository {
  List<ProductEntity> getAllProducts();
  List<ProductEntity> getSearchedProducts(String searchText);
  List<ProductEntity> getSortedProducts(String text, {bool sort});
  List<ProductEntity> getFilteredProducts(
    String text,
  );
}
