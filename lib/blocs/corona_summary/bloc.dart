import 'package:covid19_traker_bloc/blocs/corona_summary/event.dart';
import 'package:covid19_traker_bloc/blocs/corona_summary/state.dart';
import 'package:covid19_traker_bloc/models/global_summary.dart';
import 'package:covid19_traker_bloc/servers/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoronaSummaryBloc extends Bloc<CoronaSummaryEvent,CoronaSummaryState>{
  final CoronaRepository coronaRepositotry;
  CoronaSummaryBloc({required this.coronaRepositotry})
      : super(CoronaSummaryInitial()){
    on<CoronaSummaryEvent>(_mapCoronaSummaryEventtostate);
  }
  Future<void>  _mapCoronaSummaryEventtostate(
      CoronaSummaryEvent event,
      Emitter<CoronaSummaryState> emit,
      )async {
    emit(CoronaSummaryLoading());
    try {
      GlobalSummaryModel summary =await coronaRepositotry.fetchCorona();
      emit(CoronaSummaryLoaded(summary: summary));
    } catch (e) {
      emit(CoronaSummaryLoadingFailure(message: e.toString()));
    }
  }
}
