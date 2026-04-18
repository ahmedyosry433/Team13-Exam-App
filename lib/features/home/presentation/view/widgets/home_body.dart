import 'package:easy_localization/easy_localization.dart';
import 'package:exam_app/core/languages/locale_keys.g.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_text_style.dart';
import 'package:exam_app/core/values/app_images.dart';
import 'package:exam_app/features/home/presentation/view/widgets/home_card.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 24),
          child: Text(
            LocaleKeys.home_title.tr(),
            style: 18.medium.copyWith(color: AppColors.onBackgroundLight),
          ),
        ),
        CardSubjects(
          title: LocaleKeys.home_language.tr(),
          imagePath: AppImages.language,
        ),
        CardSubjects(
          title: LocaleKeys.home_math.tr(),
          imagePath: AppImages.draftingtools,
        ),
        CardSubjects(
          title: LocaleKeys.home_art.tr(),
          imagePath: AppImages.colorpalette,
        ),
        CardSubjects(
          title: LocaleKeys.home_science.tr(),
          imagePath: AppImages.microscope,
        ),
      ],
    );
  }
}
