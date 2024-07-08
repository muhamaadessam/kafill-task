part of 'who_am_i_cubit.dart';

@immutable
abstract class WhoAmIState {}

class WhoAmIInitial extends WhoAmIState {}

class ChangeShowPasswordStatus extends WhoAmIState {}

class PickFileLoadingState extends WhoAmIState {}

class PickFileSuccessState extends WhoAmIState {}

class PickFileErrorState extends WhoAmIState {
  final String error;

  PickFileErrorState(this.error);
}
