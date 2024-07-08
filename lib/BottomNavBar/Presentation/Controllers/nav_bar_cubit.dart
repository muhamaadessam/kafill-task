import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_task/Countries/Presentation/Screens/countries_screen.dart';
import 'package:hiring_task/Services/Presentation/Screens/services_screen.dart';
import 'package:hiring_task/WhoAmI/Presentation/Screens/who_am_i_screen.dart';

import '../Components/bottom_nav_bar_item.dart';

part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(NavBarInitial());
  int currentIndex = 0;

  static NavBarCubit get(context) => BlocProvider.of(context);

  List<Widget> items = [
    const BottomNavBarItem(
      index: 0,
      title: 'Who Am I',
      icon: 'whoAmI',
    ),
    const BottomNavBarItem(
      index: 1,
      title: 'Countries',
      icon: 'countries',
    ),

    const BottomNavBarItem(
      index: 2,
      title: 'Services',
      icon: 'services',
    ),
  ];
  List<Widget> screens = [
    const WhoAmIScreen(),
    const CountriesScreen(),
    const ServicesScreen(),

  ];

  Future<void> changeNavBar(int currentIndex, context) async {
    this.currentIndex = currentIndex;
    emit(ChangeNavBarState());
  }
}
