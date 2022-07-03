
import 'package:covid19_traker_bloc/models/global_summary.dart';
import 'package:equatable/equatable.dart';

abstract class CoronaSummaryState extends Equatable{}

class CoronaSummaryInitial extends CoronaSummaryState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class CoronaSummaryLoading extends CoronaSummaryState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class CoronaSummaryLoaded extends CoronaSummaryState{
  final GlobalSummaryModel summary;
  CoronaSummaryLoaded({required this.summary});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class CoronaSummaryLoadingFailure extends CoronaSummaryState{
  String message;
  CoronaSummaryLoadingFailure({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}