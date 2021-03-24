import 'package:dro/domain/menu/product.dart';
import 'package:dro/presentation/cores/cores.dart';
import 'package:dro/presentation/menu/widget/details_card.dart';
import 'package:flutter/material.dart';

class DetailsCardHolder extends StatelessWidget {
  final ProductEntity details;

  const DetailsCardHolder({Key? key, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailsCard(
              details: details.size.toString(),
              icon: "cap",
              title: "PACK SIZE",
            ),
            const YMargin(7),
            DetailsCard(
              details: details.constituents,
              icon: "cap",
              title: "CONSTITUENTTS",
            ),
            const YMargin(7),
            DetailsCard(
              details: details.dispensed,
              icon: "cap",
              title: "DISPENSED IN",
            ),
          ],
        ),
        const XMargin(20),
        const DetailsCard(
          details: "1",
          icon: "cap",
          title: "PRODUCT ID",
        ),
      ],
    );
  }
}
