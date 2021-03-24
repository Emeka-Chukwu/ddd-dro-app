import 'package:dro/application/bag/baglist/baglist_bloc.dart';
import 'package:dro/application/bag/orderwidget_bloc.dart';
import 'package:dro/presentation/bags/widget/order_card.dart';
import 'package:dro/presentation/cores/cores.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IndexHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.purple,
      body: Column(
        children: [
          BlocConsumer<BaglistBloc, BaglistState>(
            // context.read<BaglistBloc>().add(GetBagListEvent());

            builder: (context, state) {
              print("gggggggggggggggggggg");
              print(state);
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
                print(state.bags);
                print("state of the bages");
                return Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        YMargin(30),
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
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: Responsive.screenWidth(80, context),
                          height: Responsive.screenHeight(4, context),
                          decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                              "Tap on an item for add, remove, delete options",
                              style: TextStyle(fontSize: 12)),
                        ),
                        if (state.bags.isNotEmpty)
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
                          Container(
                              child: Text("No product in the bag",
                                  style: TextStyle(
                                    color: AppColor.white,
                                  ))),
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
                              "N${state.totalCost}",
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
                            height: Responsive.screenHeight(8, context),
                            decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Text("Checkout",
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
                print("jjjjjjjjjjddddddddd");
                print(state.bags);
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
