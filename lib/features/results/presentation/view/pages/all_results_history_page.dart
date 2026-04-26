import 'package:exam_app/config/di/injectable_config.dart';
import 'package:exam_app/core/routes/routes.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_text_style.dart';
import 'package:exam_app/features/results/presentation/view_model/cubit/results_cubit.dart';
import 'package:exam_app/features/results/presentation/view/widgets/result_history_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AllResultsHistoryPage extends StatelessWidget {
  const AllResultsHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ResultsCubit>()..doIndented(GetAllResultsEvent()),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          title: Text(
            "Results",
            style: 20.bold.copyWith(color: AppColors.black),
          ),
          centerTitle: false,
        ),
        body: BlocBuilder<ResultsCubit, ResultsStates>(
          builder: (context, state) {
            final results = state.getAllResultsState?.data;
            if (results == null) {
              return const Center(child: CircularProgressIndicator());
            }
            if (results.isEmpty) {
              return const Center(child: Text("No Results Found"));
            }
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: results.length,
              itemBuilder: (context, index) {
                final result = results[index];
                return GestureDetector(
                  onTap: () {
                    context.push(Routes.results, extra: result);
                  },
                  child: ResultHistoryItem(result: result),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
