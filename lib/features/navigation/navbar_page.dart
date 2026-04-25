import 'package:easy_localization/easy_localization.dart';
import 'package:exam_app/core/languages/locale_keys.g.dart';
import 'package:exam_app/core/shared/cubit/navigation_cubit.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/core/values/app_images.dart';
import 'package:exam_app/features/edit_profile/presentation/view/pages/edit_profile_screen.dart';
import 'package:exam_app/features/home/presentation/view/pages/home_page.dart';
import 'package:exam_app/features/home/presentation/view/pages/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class NavbarPage extends StatelessWidget {
  NavbarPage({super.key});
  List<Widget> pages = [HomePage(), ResultPage(), EditProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, currentindex) {
        return Scaffold(
          body: pages[currentindex],
          bottomNavigationBar: NavigationBar(
            backgroundColor: AppColors.blueED,
            selectedIndex: currentindex,
            onDestinationSelected: (index) {
              context.read<NavigationCubit>().tapChange(index);
            },
            destinations: [
              NavigationDestination(
                icon: Image.asset(AppImages.explore),
                label: LocaleKeys.home_explore.tr(),
              ),
              NavigationDestination(
                icon: Image.asset(AppImages.results),
                label: LocaleKeys.home_result.tr(),
              ),
              NavigationDestination(
                icon: Image.asset(AppImages.profile),
                label: LocaleKeys.home_profile.tr(),
              ),
            ],
          ),
        );
      },
    );
  }
}
