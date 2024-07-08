import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Core/constants/colors.dart';
import '../../../Core/constants/text.dart';
import '../../../core/constants/responsive.dart';
import '../Controllers/nav_bar_cubit.dart';

bool flag = true;

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({
    super.key,
    required this.index,
    required this.title,
    required this.icon,
  });

  final int index;
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    NavBarCubit cubit = NavBarCubit.get(context);
    return BlocBuilder<NavBarCubit, NavBarState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            cubit.changeNavBar(index, context);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/png/$icon.png',
                height: heightRation(context, 28),
                color: cubit.currentIndex == index ? mainColor : Colors.grey,
              ),
              cubit.currentIndex == index
                  ? TextBody12(
                      title,
                      color: mainColor,
                    )
                  : TextBody12(
                      title,
                      color: Colors.grey,
                    ),
            ],
          ),
        );
      },
    );
  }
}
