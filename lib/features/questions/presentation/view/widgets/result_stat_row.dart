import 'package:exam_app/core/theme/app_text_style.dart';
import 'package:exam_app/core/values/app_size.dart';
import 'package:flutter/material.dart';

class ResultStatRow extends StatelessWidget {
  final String label;
  final int count;
  final Color color;

  const ResultStatRow({
    super.key,
    required this.label,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(label, style: 16.regular.copyWith(color: color)),
        SizedBox(width: AppSize.s16),
        Container(
          width: AppSize.s30,
          height: AppSize.s30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: color),
          ),
          child: Center(
            child: Text('$count', style: 14.regular.copyWith(color: color)),
          ),
        ),
      ],
    );
  }
}
