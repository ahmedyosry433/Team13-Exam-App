import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/core/shared/widgets/custom_button.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_text_style.dart';
import 'package:exam_app/core/values/app_size.dart';
import 'package:exam_app/features/questions/presentation/view/widgets/result_stat_row.dart';
import 'package:exam_app/features/questions/presentation/view/widgets/score_indicator.dart';
import 'package:exam_app/features/questions/presentation/view_model/cubit/questions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultView extends StatelessWidget {
  final QuestionsResult result;

  const ResultView({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuestionsCubit>();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.s16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: AppSize.s24),
            Text(
              'Your score',
              style: 16.medium.copyWith(color: AppColors.black),
            ),
            SizedBox(height: AppSize.s32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ScoreIndicator(
                  percentage: result.scorePercentage,
                  correctCount: result.correctCount,
                  incorrectCount: result.incorrectCount,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ResultStatRow(
                      label: 'Correct',
                      count: result.correctCount,
                      color: AppColors.primaryLight,
                    ),
                    SizedBox(height: AppSize.s16),
                    ResultStatRow(
                      label: 'Incorrect',
                      count: result.incorrectCount,
                      color: AppColors.redCC,
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            CustomButton(
              title: 'Show results',
              onTap: () {
                // Future screen: review questions
              },
            ),
            SizedBox(height: AppSize.s16),
            BlocBuilder<QuestionsCubit, QuestionsStates>(
              builder: (context, state) {
                return CustomButton(
                  isLoading: state.submitExamState?.state == StateType.loading,
                  title: 'Start again',
                  onTap: () => cubit.resetExam(),
                  isFilled: false,
                  borderColor: AppColors.primaryLight,
                  titleStyle: 14.regular.copyWith(
                    color: AppColors.primaryLight,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
