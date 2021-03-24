import 'package:dro/presentation/bags/screens/index.dart';
import 'package:dro/presentation/cores/color.dart';
import 'package:dro/presentation/cores/config.dart';
import 'package:flutter/material.dart';

void bagBottomSheet(BuildContext context) {
  showModalBottomSheet(
      // shape: ShapeBorder(),
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            Responsive.screenWidth(10, context),
          ),
          topRight: Radius.circular(
            Responsive.screenWidth(10, context),
          ),
        ),
      ),
      context: context,
      builder: (ccontext) {
        return Container(
          decoration: BoxDecoration(
            color: AppColor.purple,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                Responsive.screenWidth(10, context),
              ),
              topRight: Radius.circular(
                Responsive.screenWidth(10, context),
              ),
            ),
          ),
          child: SingleChildScrollView(child: IndexHomePage()),
        );
      });
}
