import 'package:dro/domain/menu/product.dart';
import 'package:dro/presentation/cores/cores.dart';
import 'package:flutter/material.dart';

class DetailsBody extends StatelessWidget {
  final ProductEntity details;

  const DetailsBody({Key? key, required this.details}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          details.title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          details.title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        YMargin(Responsive.screenHeight(2, context)),
        Row(
          children: [
            Container(
              width: Responsive.screenWidth(10, context),
              height: Responsive.screenWidth(10, context),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.grey,
              ),
            ),
            const XMargin(20),
            Column(
              children: [
                Text(
                  "sold by",
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColor.grey,
                  ),
                ),
                Text(
                  details.soldBy,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
