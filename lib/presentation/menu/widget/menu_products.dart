import 'package:dro/domain/menu/product.dart';
import 'package:dro/presentation/cores/cores.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity productEntity;

  const ProductCard({Key? key, required this.productEntity}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Responsive.screenWidth(45, context),
      height: Responsive.screenHeight(37, context),
      margin: const EdgeInsets.all(4),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YMargin(Responsive.screenHeight(3, context)),
              Align(
                child: Image(
                  image: AssetImage('generico'.png),
                  height: Responsive.screenHeight(15, context),
                  // width: Responsive.screenWidth(, context),
                  fit: BoxFit.cover,
                ),
              ),
              YMargin(Responsive.screenHeight(3, context)),
              Text(
                productEntity.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const YMargin(2),
              Text(
                productEntity.constituents,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColor.grey,
                ),
              ),
              const YMargin(2),
              Text(
                productEntity.type,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColor.grey,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    width: Responsive.screenWidth(18, context),
                    height: Responsive.screenHeight(4, context),
                    decoration: BoxDecoration(
                      color: AppColor.grey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "N4000",
                      style: TextStyle(color: AppColor.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
