import 'package:easy_localization/easy_localization.dart';
import 'package:exam_app/config/di/injectable_config.dart';
import 'package:exam_app/core/languages/locale_keys.g.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/home/domain/use_cases/home_use_case.dart';
import 'package:exam_app/features/home/presentation/view/widgets/home_body.dart';
import 'package:exam_app/features/home/presentation/view_model/cubit/home_cubit.dart';
import 'package:exam_app/features/home/presentation/view_model/cubit/home_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit(getIt<HomeUseCase>())..doEvent(GetAllSubjectsEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            LocaleKeys.custom_widget_survey.tr(),
            style: TextStyle(color: AppColors.prime),
          ),
        ),
        body: HomeBody(),
      ),
    );
  }
}
