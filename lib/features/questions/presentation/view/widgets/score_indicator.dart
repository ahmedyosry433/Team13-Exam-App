import 'dart:math';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_text_style.dart';
import 'package:exam_app/core/values/app_size.dart';
import 'package:flutter/material.dart';

class ScoreIndicator extends StatefulWidget {
  final double percentage;
  final int correctCount;
  final int incorrectCount;

  const ScoreIndicator({
    super.key,
    required this.percentage,
    required this.correctCount,
    required this.incorrectCount,
  });

  @override
  State<ScoreIndicator> createState() => _ScoreIndicatorState();
}

class _ScoreIndicatorState extends State<ScoreIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _animation = Tween<double>(
      begin: 0,
      end: widget.percentage,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return SizedBox(
          width: AppSize.s150,
          height: AppSize.s150,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: const Size(AppSize.s150, AppSize.s150),
                painter: ScorePainter(
                  correctPercentage: _animation.value / 100,
                ),
              ),
              Text(
                '${_animation.value.toInt()}%',
                style: 28.medium.copyWith(color: AppColors.black),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ScorePainter extends CustomPainter {
  final double correctPercentage;

  ScorePainter({required this.correctPercentage});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;
    final strokeWidth = 5.0;

    final rect = Rect.fromCircle(center: center, radius: radius);

    // Background track (Gray/Light)
    final trackPaint = Paint()
      ..color = AppColors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, -pi / 2, 2 * pi, false, trackPaint);

    // Correct arc (Blue)
    if (correctPercentage > 0) {
      final correctPaint = Paint()
        ..color = AppColors.primaryLight
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;

      final startAngle = -pi / 2;
      final sweepAngle = 2 * pi * correctPercentage;

      // Handle the gap only if there are incorrect answers
      final adjustedSweep = (correctPercentage > 0 && correctPercentage < 1)
          ? sweepAngle - 0.2
          : sweepAngle;

      canvas.drawArc(rect, startAngle, adjustedSweep, false, correctPaint);
    }

    // Incorrect arc (Red)
    if (correctPercentage < 1.0) {
      final incorrectPaint = Paint()
        ..color = AppColors.redCC
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;

      final startAngle = -pi / 2;
      final sweepAngle = 2 * pi * correctPercentage;
      final incorrectSweepAngle = 2 * pi * (1 - correctPercentage);

      // Handle the gap only if there are correct answers
      final adjustedStart = (correctPercentage > 0 && correctPercentage < 1)
          ? startAngle + sweepAngle + 0.09
          : startAngle + sweepAngle;

      final adjustedSweep = (correctPercentage > 0 && correctPercentage < 1)
          ? incorrectSweepAngle - 0.4
          : incorrectSweepAngle;

      canvas.drawArc(rect, adjustedStart, adjustedSweep, false, incorrectPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
