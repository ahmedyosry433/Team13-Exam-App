import 'package:exam_app/config/di/injectable_config.dart';
import 'package:exam_app/features/questions/presentation/view_model/cubit/questions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionsPage extends StatelessWidget {
  const QuestionsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final QuestionsCubit questionsCubit = getIt<QuestionsCubit>()
      ..getQuestions("670070a830a3c3c1944a9c63");
    return BlocProvider.value(
      value: questionsCubit,
      child: Scaffold(body: Center(child: Text('questions page'))),
    );
  }
}
