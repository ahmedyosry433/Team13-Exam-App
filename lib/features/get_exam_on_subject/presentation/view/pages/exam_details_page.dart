import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/values/app_images.dart';
import 'package:exam_app/core/values/app_size.dart';
import 'package:flutter/material.dart';

class QuizDetailScreen extends StatelessWidget {
  final String title;
  final int duration;
  final int numberOfQuestions;
  final String pageTitle;

  const QuizDetailScreen({
    super.key,
    required this.title,
    required this.duration,
    required this.numberOfQuestions,
    required this.pageTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundLight,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.onBackgroundLight, size: AppSize.s20),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.s20, vertical: AppSize.s8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(AppImages.profitImage, width: AppSize.s40, height: AppSize.s48),
                Container(
                  width: AppSize.s10,
                  height: AppSize.s48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s4),
                  ),
                ),
                const SizedBox(width: AppSize.s8),
                Expanded(
                  child: Text(pageTitle,
                      style: const TextStyle(
                          fontSize: AppSize.s22, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: AppSize.s4),
                  child: Text('$duration Minutes',
                      style: const TextStyle(
                          fontSize: AppSize.s14, color: AppColors.primaryLight)),
                ),
              ],
            ),
            const SizedBox(height: AppSize.s10),
            Row(
              children: [
                const Text('High level',
                    style: TextStyle(
                        fontSize: AppSize.s15, fontWeight: FontWeight.bold)),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: AppSize.s10),
                  width: AppSize.s1,
                  height: AppSize.s16,
                  color: AppColors.gray53,
                ),
                Text('$numberOfQuestions Question',
                    style:
                        const TextStyle(fontSize: AppSize.s15, color: AppColors.gray53)),
              ],
            ),
            const Divider(height: AppSize.s24),
            const Text('Instructions',
                style:
                    TextStyle(fontSize: AppSize.s17, fontWeight: FontWeight.bold)),
            const SizedBox(height: AppSize.s12),
            ...[
              'Lorem ipsum dolor sit amet consectetur.',
              'Lorem ipsum dolor sit amet consectetur.',
              'Lorem ipsum dolor sit amet consectetur.',
              'Lorem ipsum dolor sit amet consectetur.',
            ].map(
              (e) => Padding(
                padding: const EdgeInsets.only(bottom: AppSize.s8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('• ', style: TextStyle(fontSize: AppSize.s15)),
                    Expanded(
                        child: Text(e,
                            style: const TextStyle(fontSize: AppSize.s15))),
                  ],
                ),
              ),
            ),
            SizedBox(height: AppSize.s40),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: AppSize.s50,
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(AppSize.s30),
                ),
                alignment: Alignment.center,
                child: const Text('Start',
                    style: TextStyle(
                        color: AppColors.onPrimaryLight,
                        fontSize: AppSize.s16,
                        fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}