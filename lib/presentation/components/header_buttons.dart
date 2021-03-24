import 'package:dro/application/menu/home/menu_home_bloc.dart';
import 'package:dro/application/menu/showSearch/showsearch_bloc.dart';
import 'package:dro/presentation/components/button_icon.dart';
import 'package:dro/presentation/cores/cores.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../container_injection.dart' as sl;

class HeaderButton extends StatelessWidget {
  final Function sort;
  final Function filter;
  final Function search;

  const HeaderButton({
    Key? key,
    required this.sort,
    required this.filter,
    required this.search,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonIcon(
              onTap: sort,
              iconData: Icons.sort,
            ),
            const XMargin(20),
            ButtonIcon(
              onTap: filter,
              iconData: Icons.filter,
            ),
            const XMargin(20),
            ButtonIcon(
              onTap: () {
                context.read<ShowsearchBloc>().add(DisplaySearchEvent());
              },
              iconData: Icons.search,
            ),
          ],
        ),
        const YMargin(20),
        BlocBuilder<ShowsearchBloc, ShowsearchState>(
          builder: (context, state) {
            if (state is! ShowsearchInitial) {
              return InpuTextForm(
                search: search,
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}

class InpuTextForm extends StatelessWidget {
  final Function search;
  // ignore: avoid_field_initializers_in_const_classes
  final TextEditingController controller = TextEditingController();

  InpuTextForm({Key? key, required this.search}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowsearchBloc, ShowsearchState>(
      builder: (context, state) {
        if (state is HideIconState) {
          controller.text = "";
        }
        print(state);
        // if(context.read<MenuHomeBloc>().state == DataLoaded){controller.text =
        // ignore: sized_box_for_whitespace
        return Container(
          width: Responsive.screenWidth(90, context),
          height: Responsive.screenHeight(7, context),
          child: FocusScope(
            onFocusChange: (focus) {
              print(focus);
              context.read<ShowsearchBloc>().add(ShowCancelIcon(text: "jj"));
            },
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              child: TextFormField(
                controller: controller,
                onChanged: (str) {
                  print(str);
                  context.read<MenuHomeBloc>().add(SearchDataEvent(text: str));
                  // if (str.length.isEven && str.length > 1) search(str);
                  // context.read<ShowsearchBloc>().add(ShowCancelIcon(text: "jj"));
                  // search(str);
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColor.grey,
                  ),
                  suffix: state is ShowIconState
                      ? IconButton(
                          icon: Icon(
                            Icons.cancel_outlined,
                            color: AppColor.grey,
                          ),
                          onPressed: () {
                            //  FetchDataEvent
                            context.read<MenuHomeBloc>().add(FetchDataEvent());

                            FocusScope.of(context).unfocus();
                            context.read<ShowsearchBloc>().add(
                                  HideIconAndClearText(),
                                );
                          },
                        )
                      : const SizedBox.shrink(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
