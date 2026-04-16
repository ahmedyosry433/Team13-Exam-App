import 'package:exam_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/cubit/forget_password_cubit.dart';
import '../../view_model/cubit/forget_password_states.dart';
import 'forget_password_email_widget.dart';
import 'opt_widget.dart';
import 'reset_password.dart';

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody({super.key});

  @override
  State<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
  final PageController _pageController = PageController(initialPage: 0);
  final List<Widget> _children = [
    const ForgetPasswordEmailWidget(),
    const OtpWidget(),
    const ResetPassword(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordStates>(
      listenWhen: (previous, current) =>
          previous.nextPageState?.currentPage !=
          current.nextPageState?.currentPage,
      listener: (context, state) {
        _pageController.animateToPage(
          state.nextPageState!.currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            SizedBox(
              height: 3,
              child: BlocBuilder<ForgetPasswordCubit, ForgetPasswordStates>(
                buildWhen: (previous, current) =>
                    previous.nextPageState?.currentPage !=
                    current.nextPageState?.currentPage,
                builder: (context, state) {
                  return TweenAnimationBuilder<double>(
                    tween: Tween<double>(
                      begin: 0,
                      end: (state.nextPageState!.currentPage + 1) /
                          _children.length,
                    ),
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    builder: (context, value, child) {
                      return LinearProgressIndicator(
                        value: value,
                        backgroundColor: AppColors.grayCF,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          AppColors.prime,
                        ),
                        minHeight: 3,
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: PageView(
                controller: _pageController,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                children: _children,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
