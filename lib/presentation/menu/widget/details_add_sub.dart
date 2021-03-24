import 'package:dro/application/menu/addsub/productaddsub_bloc.dart';
import 'package:dro/domain/menu/product.dart';
import 'package:dro/presentation/cores/cores.dart';
import 'package:flutter/material.dart';
import 'package:charcode/charcode.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsAddSub extends StatelessWidget {
  final ProductEntity details;

  const DetailsAddSub({Key? key, required this.details}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: BlocBuilder<ProductaddsubBloc, ProductaddsubState>(
          builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // padding: EdgeInsets.symmetric(
              //     horizontal: Responsive.screenWidth(5, context)),
              width: Responsive.screenWidth(30, context),
              height: Responsive.screenHeight(7, context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColor.grey,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (details.quantity > 1) {
                        context
                            .read<ProductaddsubBloc>()
                            .add(AddSubtractEvent(entity: details, add: false));
                      }
                    },
                    child: const Text(
                      "-",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  if (state is AddSubtractLoaded)
                    Text(
                      '${details.quantity}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  if (state is! AddSubtractLoaded)
                    Text(
                      '${details.quantity}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  GestureDetector(
                    onTap: () => context
                        .read<ProductaddsubBloc>()
                        .add(AddSubtractEvent(entity: details)),
                    child: const Text(
                      "+",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            // Text('$sup2'),
            if (state is AddSubtractLoaded)
              Text(
                  "${$sup}  N${(details.price * details.quantity).toInt().toDouble()}"),

            if (state is! AddSubtractLoaded)
              Text(
                  "${$sup}  N${(details.price * details.quantity).toInt().toDouble()}"),
          ],
        );
      }),
    );
  }
}
