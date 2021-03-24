import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dro/application/bag/baglist/baglist_bloc.dart';
import 'package:dro/application/menu/addsub/productaddsub_bloc.dart';
import 'package:dro/domain/bag/bag.dart';
import 'package:dro/domain/menu/product.dart';
import 'package:dro/presentation/bags/screens/index.dart';
import 'package:dro/presentation/cores/cores.dart';
import 'package:dro/presentation/menu/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// package:charcode/charcode.dart
import 'package:charcode/charcode.dart';

class ProductDetails extends StatelessWidget {
  final ProductEntity details;

  const ProductDetails({Key? key, required this.details}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.screenWidth(4, context),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YMargin(Responsive.screenHeight(2, context)),
              DetailsHeader(),
              ImageHolder(
                imageUrl: details.imageUrl,
              ),
              YMargin(Responsive.screenHeight(2, context)),
              DetailsBody(details: details),
              YMargin(Responsive.screenHeight(2, context)),
              DetailsAddSub(
                details: details,
              ),
              YMargin(Responsive.screenHeight(4, context)),
              Text(
                "PRODUCT DETAILS",
                style: TextStyle(
                  color: AppColor.grey,
                ),
              ),
              YMargin(Responsive.screenHeight(2, context)),
              DetailsCardHolder(
                details: details,
              ),
              YMargin(Responsive.screenHeight(3, context)),
              Align(
                child: Text(
                  details.description,
                  style: TextStyle(
                    color: AppColor.grey,
                    fontSize: 16,
                  ),
                ),
              ),
              YMargin(Responsive.screenHeight(3, context)),
              // BlocBuilder<ProductaddsubBloc, ProductaddsubState>(
              //   builder: (context, state) {
              //     return
              ButtonAddToBag(
                onTap: () {
                  final Random random = Random();
                  final int randomNumber = random.nextInt(1000000);
                  final BagEntity bag = BagEntity(
                      id: randomNumber,
                      productEntity: details,
                      quantity: details.quantity);
                  context
                      .read<BaglistBloc>()
                      .add(AddToBagListEvent(entity: bag));
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.SUCCES,
                    body: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Successful'),
                        const YMargin(5),
                        Text('${details.title} has been added to your bag'),
                        const YMargin(5),
                        ButtonModal(
                          onTap: () {
                            Navigator.pop(context);
                            changeScreen(context, IndexHomePage());
                          },
                        ),
                        const YMargin(5),
                        ButtonModal(
                          onTap: () => Navigator.pop(context),
                          text: "Done",
                        )
                      ],
                    ),
                    title: 'This is Ignored',
                    desc: 'This is also Ignored',
                    // btnOkOnPress: () {},
                  ).show();
                },
              ),
              // },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
