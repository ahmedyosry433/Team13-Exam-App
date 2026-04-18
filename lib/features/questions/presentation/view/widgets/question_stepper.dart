import 'package:easy_localization/easy_localization.dart';
import 'package:exam_app/core/languages/locale_keys.g.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_text_style.dart';
import 'package:exam_app/core/values/app_size.dart';
import 'package:flutter/material.dart';

class QuestionStepper extends StatelessWidget {
  final int current;
  final int total;

  const QuestionStepper({
    super.key,
    required this.current,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.questions_question_of_total.tr(
            namedArgs: {
              'current': current.toString(),
              'total': total.toString(),
            },
          ),
          style: 16.medium.copyWith(color: AppColors.gray53),
        ),
        SizedBox(height: AppSize.s12),
        ClipRRect(
          borderRadius: BorderRadius.circular(AppSize.s2),
          child: LinearProgressIndicator(
            value: current / total,
            backgroundColor: AppColors.grayCF,
            color: AppColors.primaryLight,
            minHeight: AppSize.s6,
          ),
        ),
      ],
    );
  }
}
