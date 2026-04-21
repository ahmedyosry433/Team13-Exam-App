import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class CardSubjects extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback? onTap;
  const CardSubjects({
    super.key,
    required this.title,
    required this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.96,
            height: MediaQuery.of(context).size.height * 0.11,
            child: Card(
              elevation: 2,
              shadowColor: AppColors.grayCF,
              color: AppColors.backgroundLight,
              child: Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Row(
                  children: [
                    Image.network(
                      imagePath,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.image_not_supported);
                      },
                    ),
                    SizedBox(width: 8),
                    Text(
                      title,
                      style: 16.regular.copyWith(
                        color: AppColors.onBackgroundLight,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
