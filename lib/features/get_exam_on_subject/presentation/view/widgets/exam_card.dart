import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/values/app_images.dart';
import 'package:exam_app/core/values/app_size.dart';
import 'package:flutter/material.dart';

class ExamCard extends StatelessWidget {
  final String title;
  final int duration;
  final int numberOfQuestions;
  final VoidCallback? onTap;

  const ExamCard({
    super.key,
    required this.title,
    required this.duration,
    required this.numberOfQuestions,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppSize.s14),
        decoration: BoxDecoration(
          color: AppColors.backgroundLight,
          borderRadius: BorderRadius.circular(AppSize.s12),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.15),
              blurRadius: 20,
              spreadRadius: 3,
              offset: const Offset(0, AppSize.s10),
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(AppImages.profitImage, width: AppSize.s50, height: AppSize.s50),
            Container(
              width: AppSize.s20,
              height: AppSize.s75,
              decoration: BoxDecoration(
                color: AppColors.backgroundLight,
                borderRadius: BorderRadius.circular(AppSize.s8),
              ),
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: AppSize.s16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '$duration Minutes',
                        style: const TextStyle(
                          fontSize: AppSize.s13,
                          color: AppColors.primaryLight,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSize.s4),
                  Text(
                    '$numberOfQuestions Question',
                    style: const TextStyle(
                      fontSize: AppSize.s13,
                      color: AppColors.gray53,
                    ),
                  ),
                  const SizedBox(height: AppSize.s6),
                  const Text(
                    'High level',
                    style: TextStyle(fontSize: AppSize.s12, color: AppColors.gray53),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
