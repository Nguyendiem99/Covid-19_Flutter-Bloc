import 'package:covid19_traker_bloc/models/country_detail.dart';
import 'package:equatable/equatable.dart';

 abstract class CountryDetailState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class CountryDetailLoading extends CountryDetailState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class CountryDetailLoaded extends CountryDetailState{
  final List<CountryDetail>? countryDetail;
  CountryDetailLoaded({required this.countryDetail});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class CountryDetailFailure extends CountryDetailState{
   @override
  // TODO: implement props
  List<Object?> get props => [];
}
class FillterCountryDetail extends CountryDetailState{
  final List<CountryDetail> countryDetail;
  FillterCountryDetail({required this.countryDetail});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class NoCountriesFound extends CountryDetailState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}