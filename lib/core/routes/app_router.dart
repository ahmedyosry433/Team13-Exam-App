import 'package:easy_localization/easy_localization.dart';
import 'package:exam_app/core/routes/routes.dart';
import 'package:exam_app/features/home/presentation/view/pages/home_page.dart';
import 'package:exam_app/features/navigation/navbar_page.dart';
import 'package:exam_app/features/questions/presentation/view/pages/questions_page.dart';
import 'package:exam_app/features/get_exam_on_subject/presentation/view/pages/get_exam_on_subject_page.dart';
import 'package:exam_app/features/splash/splash_page.dart';
import 'package:flutter/material.dart';
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
      route: Routes.navbar,
      page: (state, context) => NavbarPage(
        key: ValueKey(context.locale.languageCode.toString()),
      ),)
    _customAnimatedGoRoute(
      route: Routes.question,
      page: (state, context) => const QuestionsPage(),
    ),
    _customAnimatedGoRoute(
      route: Routes.getExamOnSubject,
      page: (state, context) => GetExamOnSubjectPage(
        pageTitle: 'Exam Subjects', // static مؤقتاً
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
