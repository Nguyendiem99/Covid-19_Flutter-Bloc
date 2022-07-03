import 'package:covid19_traker_bloc/models/country_detail.dart';
import 'package:equatable/equatable.dart';

abstract class CountryDetailEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class fetchCountryDetail extends CountryDetailEvent{}
class FilterCountry extends CountryDetailEvent {

  final String text;
  final List<CountryDetail> countries;

  FilterCountry({required this.text, required this.countries});

  @override
  // TODO: implement props
  List<Object> get props => [];
}