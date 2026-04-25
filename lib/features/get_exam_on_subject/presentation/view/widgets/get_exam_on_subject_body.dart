import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/values/app_size.dart';
import 'package:exam_app/features/get_exam_on_subject/domain/entities/get_exam_on_subject_entities.dart';
import 'package:exam_app/features/get_exam_on_subject/presentation/view/pages/exam_details_page.dart';
import 'package:exam_app/features/get_exam_on_subject/presentation/view/widgets/exam_card.dart';
import 'package:exam_app/features/get_exam_on_subject/presentation/view_model/cubit/get_exam_on_subject_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetExamOnSubjectBody extends StatelessWidget {
  final String pageTitle;

  const GetExamOnSubjectBody({super.key, required this.pageTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: AppSize.s20,
            color: AppColors.onBackgroundLight,
          ),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: Text(pageTitle),
      ),
      body: BlocBuilder<GetExamOnSubjectCubit, GetExamOnSubjectStates>(
        builder: (context, state) {
          return state.getExamOnSubjectState.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e) => Center(child: Text(e.toString())),
            success: (List<GetExamOnSubjectEntity> exams) {
              if (exams.isEmpty) {
                return const Center(child: Text('No exams available'));
              }
              return ListView.separated(
                padding: const EdgeInsets.all(AppSize.s16),
                itemCount: exams.length,
                separatorBuilder: (_, __) =>
                    const SizedBox(height: AppSize.s10),
                itemBuilder: (context, index) {
                  final exam = exams[index];
                  return ExamCard(
                    title: exam.title ?? '',
                    duration: exam.duration ?? 0,
                    numberOfQuestions: exam.numberOfQuestions ?? 0,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => QuizDetailScreen(
                          title: exam.title ?? '',
                          duration: exam.duration ?? 0,
                          numberOfQuestions: exam.numberOfQuestions ?? 0,
                          pageTitle: pageTitle,
                          examId: exam.id ?? '',
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
