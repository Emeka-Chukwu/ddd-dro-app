import 'package:dro/application/bag/baglist/baglist_bloc.dart';
import 'package:dro/application/menu/home/menu_home_bloc.dart';
import 'package:dro/presentation/bags/widget/bottom_sheet.dart';
import 'package:dro/presentation/components/components.dart';
import 'package:dro/presentation/cores/cores.dart';
import 'package:dro/presentation/menu/screens/product_details.dart';
import 'package:dro/presentation/menu/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: avoid_unnecessary_containers
      body: Container(
          child: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      const YMargin(20),
                      BlocBuilder<MenuHomeBloc, MenuHomeState>(
                          builder: (context, state) {
                        if (state is DataLoaded) {
                          // ignore: avoid_unnecessary_containers
                          return Container(
                              child: Text(
                            "${state.products.length} Item(s)",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ));
                        }
                        return const Text(
                          "0 Item(s)",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }),
                      HeaderButton(
                        filter: () {},
                        search: (text) {
                          context
                              .read<MenuHomeBloc>()
                              .add(SearchDataEvent(text: text.toString()));
                        },
                        sort: () {},
                      ),
                      const YMargin(15),
                      // ignore: avoid_unnecessary_containers
                      Container(
                        child: BlocBuilder<MenuHomeBloc, MenuHomeState>(
                            builder: (context, state) {
                          if (state is MenuHomeInitial) {
                            Future.delayed(const Duration(seconds: 1), () {
                              context
                                  .read<BaglistBloc>()
                                  .add(GetBagListEvent());
                            });
                          }
                          if (state is DataLoaded) {
                            return Wrap(
                              children: state.products
                                  .map((e) => GestureDetector(
                                        onTap: () => changeScreen(
                                          context,
                                          ProductDetails(
                                            details: e,
                                          ),
                                        ),
                                        behavior: HitTestBehavior.opaque,
                                        child: ProductCard(
                                          productEntity: e,
                                        ),
                                      ))
                                  .toList(),
                            );
                          }
                          if (state is MenuHomeInitial) {
                            Future.delayed(const Duration(seconds: 1), () {
                              context
                                  .read<MenuHomeBloc>()
                                  .add(FetchDataEvent());
                            });
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }),
                      ),
                      YMargin(Responsive.screenWidth(120, context))
                    ],
                  ),
                ],
              ),
            ),
          ),
          BlocBuilder<BaglistBloc, BaglistState>(
            builder: (context, state) {
              if (state is BaglistLoaded) {
                return Positioned(
                  bottom: 0,
                  child: Container(
                    height: Responsive.screenHeight(8, context),
                    width: Responsive.screenWidth(100, context),
                    decoration: BoxDecoration(
                        color: AppColor.purple,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Column(
                      children: [
                        const YMargin(5),
                        Container(
                          alignment: Alignment.center,
                          width: Responsive.screenWidth(15, context),
                          height: Responsive.screenHeight(0.6, context),
                          decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const XMargin(10),
                                  Icon(
                                    Icons.shopping_bag_outlined,
                                    color: AppColor.white,
                                  ),
                                  const XMargin(15),
                                  Text(
                                    "Bag",
                                    style: TextStyle(
                                        color: AppColor.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () => bagBottomSheet(context),
                              child: Container(
                                alignment: Alignment.center,
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: AppColor.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  state.bags.length.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }
              return Container();
            },
          )
        ],
      )),
    );
  }
}
