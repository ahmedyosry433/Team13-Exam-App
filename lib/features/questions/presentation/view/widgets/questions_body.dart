import 'package:exam_app/core/shared/widgets/custom_button.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_text_style.dart';
import 'package:exam_app/core/values/app_size.dart';
import 'package:exam_app/features/questions/presentation/view/widgets/question_item.dart';
import 'package:exam_app/features/questions/presentation/view/widgets/question_stepper.dart';
import 'package:exam_app/features/questions/presentation/view_model/cubit/questions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionsPageBody extends StatelessWidget {
  const QuestionsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionsCubit, QuestionsStates>(
      builder: (context, state) {
        if (state is QuestionsLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is QuestionsError) {
          return Center(child: Text(state.message));
        }
        if (state is QuestionsLoaded) {
          final cubit = context.read<QuestionsCubit>();
          return SafeArea(
            bottom: true,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.s16,
                    vertical: AppSize.s16,
                  ),
                  child: QuestionStepper(
                    current: state.currentIndex + 1,
                    total: state.questions.length,
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    controller: cubit.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.questions.length,
                    itemBuilder: (context, index) {
                      final question = state.questions[index];
                      return QuestionItem(
                        question: question,
                        selectedAnswerKeys: state.selectedAnswers[index] ?? [],
                        onAnswerSelected: (key) =>
                            cubit.selectAnswer(index, key),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(AppSize.s16),
                  child: Row(
                    children: [
                      if (state.currentIndex > 0) ...[
                        Expanded(
                          child: CustomButton(
                            radius: AppSize.s8,
                            borderColor: AppColors.prime,
                            isFilled: false,
                            backGroundColor: Colors.white,
                            title: 'Back',
                            titleStyle: 14.regular.copyWith(
                              color: AppColors.primaryLight,
                            ),
                            onTap: state.currentIndex > 0
                                ? () => cubit.previousQuestion()
                                : null,
                          ),
                        ),
                        SizedBox(width: AppSize.s16),
                      ],
                      Expanded(
                        child: CustomButton(
                          onTap: () => cubit.nextQuestion(),
                          radius: AppSize.s8,

                          title:
                              state.currentIndex == state.questions.length - 1
                              ? 'Finish'
                              : 'Next',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
