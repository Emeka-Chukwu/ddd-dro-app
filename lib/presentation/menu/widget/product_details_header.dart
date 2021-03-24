import 'package:dro/presentation/bags/widget/bottom_sheet.dart';
import 'package:dro/presentation/cores/cores.dart';
import 'package:flutter/material.dart';
import 'package:dro/application/bag/baglist/baglist_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: AppColor.grey),
            onPressed: () => Navigator.pop(context),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              // context.read<BaglistBloc>().add(GetBagListEvent());

              bagBottomSheet(context);
            },
            child: BlocBuilder<BaglistBloc, BaglistState>(
              builder: (context, state) {
                return Container(
                    width: Responsive.screenWidth(15, context),
                    height: Responsive.screenHeight(7, context),
                    decoration: BoxDecoration(
                      color: AppColor.droPurple,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.shopping_bag_outlined,
                          color: AppColor.white,
                        ),
                        Text(
                          state is BaglistLoaded ? "${state.bags.length}" : "0",
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ));
              },
            ),
          )
        ],
      ),
    );
  }
}
