import 'package:exam_app/config/di/injectable_config.dart';
import 'package:exam_app/core/routes/routes.dart';
import 'package:exam_app/features/edit_profile/presentation/view/pages/edit_profile_screen.dart';
import 'package:exam_app/features/edit_profile/presentation/view_model/cubit/edit_profile_cubit.dart';
import 'package:exam_app/features/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: Routes.splash,
  navigatorKey: navigatorKey,
  routes: [
    _customAnimatedGoRoute(
      route: Routes.splash,
      page: (state, context) => const SplashPage(),
    ),
    _customAnimatedGoRoute(
      route: Routes.editProfile,
      page: (state, context) => BlocProvider(
        create: (_) => getIt<EditProfileCubit>(),
        child: const EditProfileScreen(),
      ),
    ),
  ],
);

GoRoute _customAnimatedGoRoute({
  required String route,
  required Widget Function(GoRouterState state, BuildContext context) page,
  Duration duration = const Duration(milliseconds: 450),
  Offset beginOffset = const Offset(1, 0),
  Offset endOffset = Offset.zero,
  Curve curve = Curves.easeInOut,
  List<GoRoute> routes = const [],
}) => GoRoute(
  path: route,
  routes: routes,
  pageBuilder: (context, state) => CustomTransitionPage(
    key: state.pageKey,
    child: page(state, context),
    transitionDuration: duration,
    reverseTransitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: beginOffset,
          end: endOffset,
        ).animate(CurvedAnimation(parent: animation, curve: curve)),
        child: child,
      );
    },
  ),
);
