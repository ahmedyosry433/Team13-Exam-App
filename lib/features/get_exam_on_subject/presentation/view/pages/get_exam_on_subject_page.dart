import 'package:exam_app/features/get_exam_on_subject/presentation/view/widgets/get_exam_on_subject_body.dart';
import 'package:exam_app/features/get_exam_on_subject/presentation/view_model/cubit/get_exam_on_subject_cubit.dart';
import 'package:exam_app/features/get_exam_on_subject/presentation/view_model/cubit/get_exam_on_subject_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class GetExamOnSubjectPage extends StatelessWidget {
  final String pageTitle;
  final String subjectId;

  const GetExamOnSubjectPage({
    super.key,
    required this.pageTitle,
    required this.subjectId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          GetIt.I<GetExamOnSubjectCubit>()
            ..doevent(GetExamOnSubjectEvent(subjectId: subjectId)),
      child: GetExamOnSubjectBody(pageTitle: pageTitle),
    );
  }
}
