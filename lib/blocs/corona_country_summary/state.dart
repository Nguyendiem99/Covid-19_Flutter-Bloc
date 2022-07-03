
import 'package:covid19_traker_bloc/models/country_summary.dart';
import 'package:equatable/equatable.dart';
abstract class CoronaCountriesSummaryState extends Equatable{}
class CoronaCountriesSummaryLoading extends CoronaCountriesSummaryState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class CoronaCountriesSummaryLoaded extends CoronaCountriesSummaryState{
  final List<CountrySummaryChartModel>? countries;
  CoronaCountriesSummaryLoaded({required this.countries});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class CoronaCountriesSummaryLoadFailure extends CoronaCountriesSummaryState{
  String message;
  CoronaCountriesSummaryLoadFailure({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

