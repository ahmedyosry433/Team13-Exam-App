import 'package:easy_localization/easy_localization.dart';

import 'package:exam_app/config/di/injectable_config.dart';
import 'package:exam_app/core/languages/locale_keys.g.dart';
import 'package:exam_app/core/shared/widgets/custom_app_bar.dart';
import 'package:exam_app/features/forget_password/presentation/view_model/cubit/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/forget_password_body.dart';

class ForgetPasswordPage extends StatelessWidget {
  ForgetPasswordPage({super.key});
  final ForgetPasswordCubit forgetPasswordCubit = getIt
      .get<ForgetPasswordCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => forgetPasswordCubit,
      child: Scaffold(
        appBar: CustomAppBar(title: LocaleKeys.forget_password_title.tr()),
        body: ForgetPasswordBody(),
      ),
    );
  }
}
