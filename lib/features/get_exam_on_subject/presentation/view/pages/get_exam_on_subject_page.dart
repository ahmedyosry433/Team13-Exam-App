import 'package:exam_app/features/get_exam_on_subject/presentation/view/widgets/get_exam_on_subject_body.dart';
import 'package:exam_app/features/get_exam_on_subject/presentation/view_model/cubit/get_exam_on_subject_cubit.dart';
import 'package:exam_app/features/get_exam_on_subject/presentation/view_model/cubit/get_exam_on_subject_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class GetExamOnSubjectPage extends StatelessWidget {
  final String pageTitle;

  // TODO: remove when subjects branch is merged
  static const String _tempSubjectId = '69d980107c82914570305dc3';

  const GetExamOnSubjectPage({
    super.key,
    required this.pageTitle,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<GetExamOnSubjectCubit>()
        ..doevent(GetExamOnSubjectEvent(subjectId: _tempSubjectId)),
      child: GetExamOnSubjectBody(pageTitle: pageTitle),
    );
  }
}