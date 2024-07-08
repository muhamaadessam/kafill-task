part of 'countries_cubit.dart';

@immutable
sealed class CountriesState {}

final class CountriesInitial extends CountriesState {}
final class ChangePageState extends CountriesState {}
