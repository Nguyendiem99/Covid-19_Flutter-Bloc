import 'package:covid19_traker_bloc/blocs/country_detail/event.dart';
import 'package:covid19_traker_bloc/blocs/country_detail/state.dart';
import 'package:covid19_traker_bloc/models/country_detail.dart';
import 'package:covid19_traker_bloc/servers/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
class CountryDetailBloc extends Bloc<CountryDetailEvent,CountryDetailState>{
  CoronaRepository coronaRepository;
  CountryDetailBloc({required this.coronaRepository}): super(CountryDetailLoading()){
    on<fetchCountryDetail>(_mapCountryDetailEventtoState);
    on<FilterCountry>(_mapFiltterCountryEventoState);
  }
  void  _mapCountryDetailEventtoState(
      fetchCountryDetail event,
      Emitter<CountryDetailState> emit,
      )async {
    emit(CountryDetailLoading());
    try {
      List<CountryDetail>? list= await coronaRepository.fetchCountryDetail();
      emit(CountryDetailLoaded(countryDetail: list));
    } catch (e) {
      emit(CountryDetailFailure());
    }
  }
  void  _mapFiltterCountryEventoState(
      FilterCountry event,
      Emitter<CountryDetailState> emit,
      )async {
    emit(CountryDetailLoading());
    try {
      List<CountryDetail> countries= await coronaRepository.fetchFilteredCountries(event.text,event.countries);
      emit(FillterCountryDetail(countryDetail: countries));
    } catch (e) {
      emit(CountryDetailFailure());
    }
  }
}