import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:football_bet/providers/providers.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'screens/screens.dart';
import 'services/services.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      final sqlService = SqlService();
      await sqlService.init();

      runApp(
        ScreenUtilInit(
          designSize: Size(390, 844),
          builder: (context, child) => MyApp(sqlService: sqlService),
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
  const MyApp({super.key, required this.sqlService});

  final SqlService sqlService;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final router = GoRouter(
    initialLocation: '/',
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
            path: '/events',
            pageBuilder: (context, state) => buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: EventsScreen(),
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
                path: 'create',
                pageBuilder: (context, state) => buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: CreateEventScreen(),
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
                    path: 'teams',
                    pageBuilder: (context, state) =>
                        buildPageWithDefaultTransition(
                          context: context,
                          state: state,
                          child: TeamsScreen(),
                        ),
                  ),
                ],
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
    return MultiProvider(
      providers: [
        Provider(create: (context) => TeamsService(widget.sqlService.database)),
        ChangeNotifierProvider(
          create: (context) =>
              TeamsProvider(Provider.of(context, listen: false), router),
        ),
        ChangeNotifierProvider(create: (context) => RouterProvider(router)),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        routerConfig: router,
      ),
    );
  }
}
