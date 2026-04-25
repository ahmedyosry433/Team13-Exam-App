import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/features/results/data/models/exam_result_collection.dart';
import 'package:exam_app/features/results/domain/use_cases/get_all_results_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'results_states.dart';
part 'results_events.dart';

@injectable
class ResultsCubit extends Cubit<ResultsStates> {
  final GetAllResultsUseCase _getAllResultsUseCase;

  ResultsCubit(this._getAllResultsUseCase) : super(const ResultsStates());

  void doIndented(ResultsEvents event) {
    if (event is GetAllResultsEvent) {
      _getAllResults();
    }
  }

  Future<void> _getAllResults() async {
    emit(state.copyWith(getAllResultsState: const BaseState.loading()));
    final result = await _getAllResultsUseCase.call();
    result.when(
      success: (data) {
        log(data.toString());
        emit(state.copyWith(getAllResultsState: BaseState.success(data)));
      },
      error: (exception) {
        emit(state.copyWith(getAllResultsState: BaseState.error(exception)));
      },
    );
  }
}
