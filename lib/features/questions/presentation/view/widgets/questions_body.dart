import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/core/languages/locale_keys.g.dart';
import 'package:exam_app/core/routes/app_router.dart';
import 'package:exam_app/core/shared/widgets/custom_button.dart';
import 'package:exam_app/core/shared/widgets/custom_page_loading.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_text_style.dart';
import 'package:exam_app/core/values/app_size.dart';
import 'package:exam_app/features/questions/presentation/view/widgets/question_item.dart';
import 'package:exam_app/features/questions/presentation/view/widgets/question_stepper.dart';
import 'package:exam_app/features/questions/presentation/view/widgets/question_timeout_dialog_body.dart';
import 'package:exam_app/features/questions/presentation/view_model/cubit/questions_cubit.dart';
import 'package:exam_app/features/questions/presentation/view_model/cubit/questions_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionsPageBody extends StatefulWidget {
  const QuestionsPageBody({super.key, required this.cubit});
  final QuestionsCubit cubit;

  @override
  State<QuestionsPageBody> createState() => _QuestionsPageBodyState();
}

class _QuestionsPageBodyState extends State<QuestionsPageBody> {
  late PageController pageController;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (widget.cubit.state.secondsRemaining > 0) {
        widget.cubit.doIndented(
          UpdateTimerEvent(seconds: widget.cubit.state.secondsRemaining - 1),
        );
      } else {
        if (!mounted) return;
        showDialog(
          context: navigatorKey.currentContext!,
          barrierDismissible: false,
          builder: (context) => QuestionTimeoutDialogBody(widget: widget),
        );

        _timer?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<QuestionsCubit, QuestionsStates>(
      listenWhen: (previous, current) =>
          previous.getQuestionsState?.state !=
              current.getQuestionsState?.state ||
          previous.submitExamState?.state != current.submitExamState?.state ||
          previous.updatePageIndex?.state != current.updatePageIndex?.state,
      listener: (context, state) {
        if (state.getQuestionsState?.state == StateType.success) {
          _startTimer();
        }

        if (state.submitExamState?.state == StateType.success) {
          _timer?.cancel();
        }

        if (state.updatePageIndex?.state == StateType.success) {
          pageController.animateToPage(
            state.currentIndex,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      },
      child: BlocBuilder<QuestionsCubit, QuestionsStates>(
        builder: (context, state) {
          final getQuestions = state.getQuestionsState;

          if (getQuestions?.state == StateType.loading) {
            return const CustomPageLoading();
          } else if (getQuestions?.state == StateType.error) {
            return Center(
              child: Text(getQuestions?.exception.toString() ?? ''),
            );
          } else if (getQuestions?.state == StateType.success) {
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
                      controller: pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.questions.length,
                      itemBuilder: (context, index) {
                        final question = state.questions[index];
                        return QuestionItem(
                          question: question,
                          selectedAnswerKeys:
                              state.selectedAnswers[index] ?? [],
                          onAnswerSelected: (key) => widget.cubit.doIndented(
                            SelectAnswerEvent(
                              questionIndex: index,
                              answerKey: key,
                            ),
                          ),
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
                              title: LocaleKeys.global_Back.tr(),
                              titleStyle: 14.regular.copyWith(
                                color: AppColors.primaryLight,
                              ),
                              onTap: state.currentIndex > 0
                                  ? () => widget.cubit.doIndented(
                                      UpdateIndexEvent(
                                        index: state.currentIndex - 1,
                                      ),
                                    )
                                  : null,
                            ),
                          ),
                          SizedBox(width: AppSize.s16),
                        ],
                        Expanded(
                          child: CustomButton(
                            onTap: () {
                              if (state.currentIndex ==
                                  state.questions.length - 1) {
                                widget.cubit.doIndented(SubmitExamEvent());
                              } else {
                                widget.cubit.doIndented(
                                  UpdateIndexEvent(
                                    index: state.currentIndex + 1,
                                  ),
                                );
                              }
                            },
                            radius: AppSize.s8,
                            title:
                                state.currentIndex == state.questions.length - 1
                                ? LocaleKeys.global_finish.tr()
                                : LocaleKeys.global_Next.tr(),
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
      ),
    );
  }
}
