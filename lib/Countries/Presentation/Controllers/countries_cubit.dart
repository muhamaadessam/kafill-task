import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'countries_state.dart';

class CountriesCubit extends Cubit<CountriesState> {
  CountriesCubit() : super(CountriesInitial());

  int currentPage = 5;

  static CountriesCubit get(context) => BlocProvider.of(context);
  changeCurrentPage(int newPage){
    currentPage=newPage;
    emit(ChangePageState());
  }
}
