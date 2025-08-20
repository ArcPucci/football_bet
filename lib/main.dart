import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_bet/features/home/home.dart';
import 'package:football_bet/features/mails/mails.dart';
import 'package:go_router/go_router.dart';

import 'features/navigation/navigation.dart';
import 'features/profile/profile.dart';

void main() {
  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();

      runApp(
        ScreenUtilInit(
          designSize: Size(390, 844),
          builder: (context, child) => const MyApp(),
        ),
      );
    },
    (error, stack) {
      print(error);
      print(stack);
    },
  );
}

CustomTransitionPage buildPageWithDefaultTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  bool opaque = true,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: Duration.zero,
    opaque: opaque,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final router = GoRouter(
    initialLocation: '/profile/edit',
    routes: [
      GoRoute(path: '/welcome', builder: (context, state) => HomeScreen()),
      ShellRoute(
        builder: (context, state, child) =>
            NavigationScreen(path: state.fullPath ?? '/', child: child),
        routes: [
          GoRoute(
            path: '/',
            pageBuilder: (context, state) => buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: HomeScreen(),
            ),
            routes: [
              GoRoute(
                path: 'details',
                pageBuilder: (context, state) => buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: DetailsScreen(),
                ),
              ),
              GoRoute(
                path: 'settings',
                pageBuilder: (context, state) => buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: SettingsScreen(),
                ),
              ),
              GoRoute(
                path: 'profile',
                pageBuilder: (context, state) => buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: ProfileScreen(),
                ),
                routes: [
                  GoRoute(
                    path: 'edit',
                    pageBuilder: (context, state) =>
                        buildPageWithDefaultTransition(
                          context: context,
                          state: state,
                          child: ProfileEditScreen(),
                        ),
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: '/category',
            pageBuilder: (context, state) => buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: SizedBox(),
            ),
            routes: [
              GoRoute(
                path: 'settings',
                pageBuilder: (context, state) => buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: SettingsScreen(),
                ),
              ),
              GoRoute(
                path: 'profile',
                pageBuilder: (context, state) => buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: ProfileScreen(),
                ),
              ),
            ],
          ),
          GoRoute(
            path: '/chart',
            pageBuilder: (context, state) => buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: SizedBox(),
            ),
            routes: [
              GoRoute(
                path: 'settings',
                pageBuilder: (context, state) => buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: SettingsScreen(),
                ),
              ),
              GoRoute(
                path: 'profile',
                pageBuilder: (context, state) => buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: ProfileScreen(),
                ),
              ),
            ],
          ),
          GoRoute(
            path: '/mail',
            pageBuilder: (context, state) => buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: MailsScreen(),
            ),
            routes: [
              GoRoute(
                path: 'settings',
                pageBuilder: (context, state) => buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: SettingsScreen(),
                ),
              ),
              GoRoute(
                path: 'profile',
                pageBuilder: (context, state) => buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: ProfileScreen(),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: router,
    );
  }
}
