import 'package:dro/application/bag/baglist/baglist_bloc.dart';
import 'package:dro/application/bag/orderwidget_bloc.dart';
import 'package:dro/domain/bag/bag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cores/cores.dart';

class OrderCard extends StatelessWidget {
  final BagEntity entity;
  final List<BagEntity> entities;
  // ll
  const OrderCard({
    Key? key,
    required this.entity,
    required this.entities,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderwidgetBloc, OrderwidgetState>(
      listener: (context, state) {
        if (state is OrderWidgetShowState) {
          context
              .read<BaglistBloc>()
              .add(CalculateTotalEvent(entity: entities));
        }
      },
      builder: (context, state) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            context
                .read<OrderwidgetBloc>()
                .add(ShowBagOptions(entity: entity, id: entity.id));
          },
          child: Column(
            children: [
              Row(
                children: [
                  // ignore: prefer_if_elements_to_conditional_expressions
                  state is OrderwidgetInitial
                      ? CircleAvatar(
                          radius: Responsive.screenWidth(8, context),
                          backgroundImage:
                              AssetImage(entity.productEntity.imageUrl.png),
                        )
                      : CircleAvatar(
                          radius: Responsive.screenWidth(8, context),
                          backgroundColor: AppColor.purple,
                        ),

                  XMargin(Responsive.screenWidth(5, context)),

                  Text(
                    "${entity.quantity}X ",
                    style: TextStyle(
                      color: AppColor.white,
                    ),
                  ),
                  XMargin(Responsive.screenWidth(5, context)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entity.productEntity.title,
                          style: TextStyle(
                            color: AppColor.white,
                          ),
                        ),
                        const YMargin(5),
                        Text(
                          entity.productEntity.type,
                          style: TextStyle(
                            color: AppColor.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "N${entity.productEntity.price} ",
                    style: TextStyle(
                      color: AppColor.white,
                    ),
                  ),
                  XMargin(Responsive.screenWidth(5, context)),
                ],
              ),
              if (state is OrderWidgetShowState && state.id == entity.id)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: AppColor.white,
                          ),
                          onPressed: () => context
                              .read<BaglistBloc>()
                              .add(DeleteFromBagListEvent(entity: entity)),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AddSubtrsactButton(
                          addSub: "-",
                          onTap: () => entity.quantity > 1
                              ? context.read<OrderwidgetBloc>().add(
                                  AddSubtractBagOption(
                                      add: false,
                                      entity: entity,
                                      id: entity.id))
                              : null,
                        ),
                        const XMargin(7),
                        Text(
                          "${entity.quantity}",
                          style: TextStyle(
                            color: AppColor.white,
                          ),
                        ),
                        const XMargin(7),
                        AddSubtrsactButton(
                          addSub: "+",
                          onTap: () => context.read<OrderwidgetBloc>().add(
                              AddSubtractBagOption(
                                  add: true, entity: entity, id: entity.id)),
                        ),
                      ],
                    )
                  ],
                ),
              BlocConsumer<BaglistBloc, BaglistState>(
                listener: (context, state) {
                  if (state is BaglistLoaded) {
                    // print(state.bags[0].quantity);
                    // print(state.bags[0].quantity);
                  }
                },
                builder: (context, state) {
                  return Container();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class AddSubtrsactButton extends StatelessWidget {
  final String addSub;
  final Function onTap;

  const AddSubtrsactButton(
      {Key? key, required this.addSub, required this.onTap})
      : super(key: key);
  @override
  Widget build(Object context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        alignment: Alignment.center,
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.white,
        ),
        child: Text(
          addSub,
          style: TextStyle(
            fontSize: 18,
            color: AppColor.grey,
          ),
        ),
      ),
    );
  }
}
