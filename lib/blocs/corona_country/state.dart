
import 'package:covid19_traker_bloc/models/country_summary.dart';
import 'package:equatable/equatable.dart';
abstract class CoronaCountriesState extends Equatable{}
class CoronaCountriesLoading extends CoronaCountriesState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class CoronaCountriesLoaded extends CoronaCountriesState{
  final CountrySummaryModel countries;
  CoronaCountriesLoaded({required this.countries});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class CoronaCountriesLoadFailure extends CoronaCountriesState{
  String message;
  CoronaCountriesLoadFailure({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


