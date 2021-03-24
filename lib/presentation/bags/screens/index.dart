import 'package:dro/application/bag/baglist/baglist_bloc.dart';
import 'package:dro/presentation/bags/widget/order_card.dart';
import 'package:dro/presentation/cores/cores.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IndexHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Responsive.screenHeight(96, context),
      padding:
          EdgeInsets.symmetric(horizontal: Responsive.screenWidth(3, context)),
      child: Column(
        children: [
          const YMargin(5),
          BlocConsumer<BaglistBloc, BaglistState>(
            // context.read<BaglistBloc>().add(GetBagListEvent());

            builder: (context, state) {
              // context.read<BaglistBloc>().add(GetBagListEvent());

              if (state is BaglistInitial) {
                // context.watch<BaglistBloc>().add(GetBagListEvent());
                // Future.delayed(const Duration(seconds: 1),
                //     () => context.read<BaglistBloc>().add(GetBagListEvent()));
                // context.read<BaglistBloc>().add(GetBagListEvent());

                return Center(
                    child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () =>
                            context.read<BaglistBloc>().add(GetBagListEvent()),
                        child: CircularProgressIndicator(
                            backgroundColor: AppColor.white)));
              } else if (state is BaglistLoaded) {
                // ignore: avoid_unnecessary_containers
                return Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            alignment: Alignment.center,
                            width: Responsive.screenWidth(15, context),
                            height: Responsive.screenHeight(0.6, context),
                            decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
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
                            Container(
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
                            )
                          ],
                        ),
                        const YMargin(10),
                        Container(
                          alignment: Alignment.center,
                          width: Responsive.screenWidth(70, context),
                          height: Responsive.screenHeight(4, context),
                          decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                              "Tap on an item for add, remove, delete options",
                              style: TextStyle(fontSize: 10)),
                        ),
                        const YMargin(10),
                        if (state.bags.isNotEmpty)
                          // ignore: sized_box_for_whitespace
                          Container(
                            width: Responsive.screenWidth(100, context),
                            height: Responsive.screenHeight(68, context),
                            child: ListView.builder(
                                itemCount: state.bags.length,
                                itemBuilder: (context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: OrderCard(
                                      entity: state.bags[index],
                                      entities: state.bags,
                                    ),
                                  );
                                }),
                          ),
                        if (state.bags.isEmpty)
                          YMargin(Responsive.screenWidth(20, context)),
                        if (state.bags.isEmpty)
                          Text("No product in the bag",
                              style: TextStyle(
                                color: AppColor.white,
                              )),
                        if (state.bags.isEmpty)
                          YMargin(Responsive.screenWidth(20, context)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                  color: AppColor.white, fontSize: 18),
                            ),
                            YMargin(Responsive.screenHeight(3, context)),
                            Text(
                              "N${state.totalCost.toInt()}",
                              style: TextStyle(
                                  color: AppColor.white, fontSize: 18),
                            )
                          ],
                        ),
                        YMargin(Responsive.screenHeight(2, context)),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            alignment: Alignment.center,
                            width: Responsive.screenWidth(70, context),
                            height: Responsive.screenHeight(7, context),
                            decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Text("Checkout",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
            listener: (context, state) {
              if (state is BaglistLoaded) {
                // print(state.bags[0].quantity);
                // print(state.bags[1].quantity);
              }
            },
          ),
        ],
      ),
    );
  }
}
