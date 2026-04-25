import 'package:easy_localization/easy_localization.dart';
import 'package:exam_app/core/languages/locale_keys.g.dart';
import 'package:exam_app/core/routes/routes.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/theme/app_text_style.dart';
import 'package:exam_app/features/home/presentation/view/widgets/home_card.dart';
import 'package:exam_app/features/home/presentation/view/widgets/home_search.dart';
import 'package:exam_app/features/home/presentation/view_model/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeSearch(),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 24),
            child: Text(
              LocaleKeys.home_title.tr(),
              style: 18.medium.copyWith(color: AppColors.onBackgroundLight),
            ),
          ),
          BlocBuilder<HomeCubit, SubjectsState>(
            builder: (context, state) {
              return state.getsubjectsState.when(
                initial: () => const Center(child: CircularProgressIndicator()),
                loading: () => const Center(child: CircularProgressIndicator()),

                success: (_) {
                  final subjects = state.filteredSubjects;
                  if (subjects.isEmpty) {
                    return const Center(child: Text("No subjects"));
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final subject = subjects[index];
                      return CardSubjects(
                        title: subject.name ?? "",
                        imagePath: subject.icon ?? '',
                        onTap: () {
                          context.push(
                            Routes.getExamOnSubject,
                            extra: {
                              "title": subject.name,
                              "subjectId": subject.id,
                            },
                          );
                        },
                      );
                    },
                    itemCount: subjects.length,
                  );
                },
                error: (e) => Center(child: Text(e.toString())),
              );
            },
          ),
        ],
      ),
    );
  }
}
