import 'package:easy_localization/easy_localization.dart';
import 'package:exam_app/core/languages/locale_keys.g.dart';
import 'package:exam_app/core/shared/widgets/custom_button.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_text_style.dart';
import 'package:exam_app/core/values/app_animations.dart';
import 'package:exam_app/features/questions/presentation/view/widgets/questions_body.dart';
import 'package:exam_app/features/questions/presentation/view_model/cubit/questions_events.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class QuestionTimeoutDialogBody extends StatelessWidget {
  const QuestionTimeoutDialogBody({super.key, required this.widget});

  final QuestionsPageBody widget;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      title: Center(
        child: Text(
          LocaleKeys.global_time_out.tr(),
          style: 18.medium.copyWith(color: AppColors.redCC),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(AppAnimations.timeAnimation, width: 170, height: 170),
          CustomButton(
            height: 35,
            title: LocaleKeys.global_view_score.tr(),
            onTap: () {
              context.pop(context);
              widget.cubit.doIndented(SubmitExamEvent());
            },
          ),
        ],
      ),
    );
  }
}
