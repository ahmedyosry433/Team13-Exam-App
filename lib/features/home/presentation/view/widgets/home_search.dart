import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/home/presentation/view_model/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
   return Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  child: TextField(
    onChanged: (value) {
      context.read<HomeCubit>().searchSubjects(value);
    },
    decoration: InputDecoration(
      hintText: 'Search subject',
      prefixIcon: const Icon(Icons.search),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColors.grayCF),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: AppColors.blue02),
      ),
    ),
  ),
);
  }
}
