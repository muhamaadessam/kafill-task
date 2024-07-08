part of 'nav_bar_cubit.dart';

@immutable
abstract class NavBarState {}
class NavBarInitial extends NavBarState {}
class ChangeNavBarState extends NavBarState {}

class GetAdLoadingState extends NavBarState {}

class GetAdSuccessState extends NavBarState {}

class GetAdErrorState extends NavBarState {
  final String error;

  GetAdErrorState(this.error);
}
