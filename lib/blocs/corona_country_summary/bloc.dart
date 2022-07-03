import 'package:covid19_traker_bloc/blocs/corona_country_summary/event.dart';
import 'package:covid19_traker_bloc/blocs/corona_country_summary/state.dart';
import 'package:covid19_traker_bloc/models/country_summary.dart';
import 'package:covid19_traker_bloc/servers/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'dart:async';
class CoronaCountriesSummaryBloc extends Bloc<CoronaCountriesSummaryEvent,CoronaCountriesSummaryState>{
  CoronaRepository coronaRepository;
  CoronaCountriesSummaryBloc({required this.coronaRepository}): super(CoronaCountriesSummaryLoading()){
    on<fetchCoronaCountriesSummaryEvent>(_mapCoronaCountriesEventtoState);
  }
  void  _mapCoronaCountriesEventtoState(
      fetchCoronaCountriesSummaryEvent event,
      Emitter<CoronaCountriesSummaryState> emit,
      )async {
    emit(CoronaCountriesSummaryLoading());
    try {
      List<CountrySummaryChartModel>? list= await coronaRepository.fetchCoronaCountriesSummary();
      emit(CoronaCountriesSummaryLoaded(countries: list));
    } catch (e) {
      emit(CoronaCountriesSummaryLoadFailure(message: e.toString()));
    }
  }
}