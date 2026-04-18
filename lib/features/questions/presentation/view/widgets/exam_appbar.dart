import 'package:easy_localization/easy_localization.dart';
import 'package:exam_app/config/base_state/base_state.dart';
import 'package:exam_app/core/languages/locale_keys.g.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_text_style.dart';
import 'package:exam_app/core/values/app_animations.dart';
import 'package:exam_app/core/values/app_icons.dart';
import 'package:exam_app/core/values/app_size.dart';
import 'package:exam_app/features/questions/presentation/view_model/cubit/questions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class ExamAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  const ExamAppbar({super.key, this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0,
      title: Text(
        title ?? LocaleKeys.global_exam.tr(),
        style: 18.bold.copyWith(color: AppColors.black),
      ),
      centerTitle: false,
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.s16),
          child: BlocBuilder<QuestionsCubit, QuestionsStates>(
            builder: (context, state) {
              final isLoaded =
                  state.getQuestionsState?.state == StateType.success;
              final isResult =
                  state.submitExamState?.state == StateType.success;

              if (isLoaded && !isResult) {
                final minutes = (state.secondsRemaining / 60).floor();
                final seconds = state.secondsRemaining % 60;
                return state.secondsRemaining < 11 && state.secondsRemaining > 0
                    ? Lottie.asset(AppAnimations.timerDownAnimation)
                    : Row(
                        children: [
                          SvgPicture.asset(AppIcons.iconsClock),
                          SizedBox(width: AppSize.s4),
                          Text(
                            '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                            style: 18.medium.copyWith(
                              color:
                                  state.secondsRemaining <
                                      (state.questions.first.exam?.duration ??
                                              0) /
                                          2
                                  ? AppColors.redCC
                                  : AppColors.green0C,
                            ),
                          ),
                        ],
                      );
              }
              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}
