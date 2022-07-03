import 'package:covid19_traker_bloc/blocs/corona_country/event.dart';
import 'package:covid19_traker_bloc/blocs/corona_country/state.dart';
import 'package:covid19_traker_bloc/models/country_summary.dart';
import 'package:covid19_traker_bloc/servers/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
class CoronaCountriesBloc extends Bloc<CoronaCountriesEvent,CoronaCountriesState>{
  CoronaRepository coronaRepository;
  CoronaCountriesBloc({required this.coronaRepository}): super(CoronaCountriesLoading()){
    on<fetchCoronaCountriesEvent>(_mapCoronaCountriesEventtoState);
  }

  void  _mapCoronaCountriesEventtoState(
      fetchCoronaCountriesEvent event,
      Emitter<CoronaCountriesState> emit,
      )async {
    emit(CoronaCountriesLoading());
    try {
      CountrySummaryModel summarylist= await coronaRepository.fetchCoronaCountries();
      emit(CoronaCountriesLoaded(countries: summarylist));
    } catch (e) {
      emit(CoronaCountriesLoadFailure(message: e.toString()));
    }
  }
}