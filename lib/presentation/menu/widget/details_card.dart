import 'package:dro/domain/menu/product.dart';
import 'package:dro/presentation/cores/cores.dart';
import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  final String details;
  final String icon;
  final String title;

  const DetailsCard({
    Key? key,
    required this.details,
    required this.icon,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(image: AssetImage(icon.png)),
        const XMargin(20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColor.grey,
                fontSize: 12,
              ),
            ),
            Text(
              details,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        )
      ],
    );
  }
}
