import 'package:easy_localization/easy_localization.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_text_style.dart';
import 'package:exam_app/core/values/app_animations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../languages/locale_keys.g.dart';

void showDialogLoading(
  BuildContext context, {
  bool barrierDismissible = false,
}) async {
  await showGeneralDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, anim1, anim2) => ShowDialogLoading(),
    transitionBuilder: (context, anim1, anim2, child) {
      return Transform.scale(
        scale: anim1.value,
        child: Opacity(opacity: anim1.value, child: child),
      );
    },
  );
}

class ShowDialogLoading extends StatelessWidget {
  const ShowDialogLoading({super.key});
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AlertDialog(
        backgroundColor: AppColors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(AppAnimations.animationsLoadingAnimationBlue),
            Text(
              LocaleKeys.custom_widget_loading.tr(),
              style: 16.medium.copyWith(color: AppColors.onBackgroundLight),
            ),
          ],
        ),
      ),
    );
  }
}
