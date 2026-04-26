import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_text_style.dart';
import 'package:exam_app/core/values/app_images.dart';
import 'package:exam_app/features/questions/presentation/view_model/cubit/questions_cubit.dart';
import 'package:flutter/material.dart';

class ResultHistoryItem extends StatelessWidget {
  final QuestionsResult result;

  const ResultHistoryItem({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: AppColors.grayEA),
      ),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 80,
                height: 80,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.grayEA.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(AppImages.profitImage),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.primeAccent,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(2),
                child: const Icon(
                  Icons.check,
                  color: AppColors.white,
                  size: 14,
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        result.questions.firstOrNull?.exam?.title ?? "Exam",
                        style: 16.bold.copyWith(color: AppColors.black),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (result.durationMinutes != null)
                      Text(
                        "${result.durationMinutes} Minutes",
                        style: 12.regular.copyWith(color: AppColors.gray87),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  "${result.totalQuestions ?? 0} Question",
                  style: 14.regular.copyWith(color: AppColors.gray87),
                ),
                const SizedBox(height: 8),
                Text(
                  "${result.correctCount ?? 0} corrected answers in ${result.takenDurationMinutes ?? 0} min.",
                  style: 14.medium.copyWith(color: AppColors.blue2C),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
