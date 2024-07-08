import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Core/components/CustomWidgets/custom_scaffold.dart';
import '../Controllers/nav_bar_cubit.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    NavBarCubit cubit =NavBarCubit.get(context);

    return BlocConsumer<NavBarCubit, NavBarState>(
      builder: (BuildContext context, state) => CustomScaffold(
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: cubit.items,
          ),
        ),
        body: Column(
          children: [
            Expanded(child: cubit.screens[cubit.currentIndex]),
          ],
        ),
      ),
      listener: (BuildContext context, state) {},
    );
  }
}
