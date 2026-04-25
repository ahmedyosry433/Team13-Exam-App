import 'package:exam_app/core/values/app_animations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomPageLoading extends StatelessWidget {
  const CustomPageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset(AppAnimations.loadingAnimation));
  }
}
