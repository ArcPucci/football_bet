import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

      final preferences = await SharedPreferences.getInstance();
      final configPreferences = ConfigPreferences(preferences);

      runApp(
        ScreenUtilInit(
          designSize: Size(390, 844),
          builder: (context, child) => MyApp(
            sqlService: sqlService,
            configPreferences: configPreferences,
          ),
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
  const MyApp({
    super.key,
    required this.sqlService,
    required this.configPreferences,
  });

  final SqlService sqlService;
  final ConfigPreferences configPreferences;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GoRouter router;

  @override
  void initState() {
    super.initState();
    router = GoRouter(
      initialLocation: widget.configPreferences.getFirstInit()
          ? '/welcome'
          : '/',
      routes: [
        GoRoute(path: '/welcome', builder: (context, state) => WelcomeScreen()),
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
                  pageBuilder: (context, state) =>
                      buildPageWithDefaultTransition(
                        context: context,
                        state: state,
                        child: EventDetailsScreen(),
                      ),
                ),
                GoRoute(
                  path: 'settings',
                  pageBuilder: (context, state) =>
                      buildPageWithDefaultTransition(
                        context: context,
                        state: state,
                        child: SettingsScreen(),
                      ),
                ),
                GoRoute(
                  path: 'profile',
                  pageBuilder: (context, state) =>
                      buildPageWithDefaultTransition(
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
                      routes: [
                        GoRoute(
                          path: 'settings',
                          pageBuilder: (context, state) =>
                              buildPageWithDefaultTransition(
                                context: context,
                                state: state,
                                child: SettingsScreen(),
                              ),
                        ),
                      ],
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
                child: MyBetsScreen(),
              ),
              routes: [
                GoRoute(
                  path: 'settings',
                  pageBuilder: (context, state) =>
                      buildPageWithDefaultTransition(
                        context: context,
                        state: state,
                        child: SettingsScreen(),
                      ),
                ),
                GoRoute(
                  path: 'profile',
                  pageBuilder: (context, state) =>
                      buildPageWithDefaultTransition(
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
                      routes: [
                        GoRoute(
                          path: 'settings',
                          pageBuilder: (context, state) =>
                              buildPageWithDefaultTransition(
                                context: context,
                                state: state,
                                child: SettingsScreen(),
                              ),
                        ),
                      ],
                    ),
                  ],
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
                  pageBuilder: (context, state) =>
                      buildPageWithDefaultTransition(
                        context: context,
                        state: state,
                        child: SettingsScreen(),
                      ),
                ),
                GoRoute(
                  path: 'profile',
                  pageBuilder: (context, state) =>
                      buildPageWithDefaultTransition(
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
                      routes: [
                        GoRoute(
                          path: 'settings',
                          pageBuilder: (context, state) =>
                              buildPageWithDefaultTransition(
                                context: context,
                                state: state,
                                child: SettingsScreen(),
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
                GoRoute(
                  path: 'create',
                  pageBuilder: (context, state) =>
                      buildPageWithDefaultTransition(
                        context: context,
                        state: state,
                        child: CreateEventScreen(),
                      ),
                  routes: [
                    GoRoute(
                      path: 'settings',
                      pageBuilder: (context, state) =>
                          buildPageWithDefaultTransition(
                            context: context,
                            state: state,
                            child: SettingsScreen(),
                          ),
                    ),
                    GoRoute(
                      path: 'profile',
                      pageBuilder: (context, state) =>
                          buildPageWithDefaultTransition(
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
                          routes: [
                            GoRoute(
                              path: 'settings',
                              pageBuilder: (context, state) =>
                                  buildPageWithDefaultTransition(
                                    context: context,
                                    state: state,
                                    child: SettingsScreen(),
                                  ),
                            ),
                          ],
                        ),
                      ],
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
                GoRoute(
                  path: 'details',
                  pageBuilder: (context, state) =>
                      buildPageWithDefaultTransition(
                        context: context,
                        state: state,
                        child: EventDetailsScreen(),
                      ),
                ),
              ],
            ),
            GoRoute(
              path: '/chart',
              pageBuilder: (context, state) => buildPageWithDefaultTransition(
                context: context,
                state: state,
                child: LeaderboardScreen(),
              ),
              routes: [
                GoRoute(
                  path: 'review',
                  pageBuilder: (context, state) =>
                      buildPageWithDefaultTransition(
                        context: context,
                        state: state,
                        child: EventReviewScreen(),
                      ),
                ),
                GoRoute(
                  path: 'settings',
                  pageBuilder: (context, state) =>
                      buildPageWithDefaultTransition(
                        context: context,
                        state: state,
                        child: SettingsScreen(),
                      ),
                ),
                GoRoute(
                  path: 'profile',
                  pageBuilder: (context, state) =>
                      buildPageWithDefaultTransition(
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
                      routes: [
                        GoRoute(
                          path: 'settings',
                          pageBuilder: (context, state) =>
                              buildPageWithDefaultTransition(
                                context: context,
                                state: state,
                                child: SettingsScreen(),
                              ),
                        ),
                      ],
                    ),
                  ],
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
                  pageBuilder: (context, state) =>
                      buildPageWithDefaultTransition(
                        context: context,
                        state: state,
                        child: SettingsScreen(),
                      ),
                ),
                GoRoute(
                  path: 'profile',
                  pageBuilder: (context, state) =>
                      buildPageWithDefaultTransition(
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
                      routes: [
                        GoRoute(
                          path: 'settings',
                          pageBuilder: (context, state) =>
                              buildPageWithDefaultTransition(
                                context: context,
                                state: state,
                                child: SettingsScreen(),
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => TeamsService(widget.sqlService.database)),
        Provider.value(value: widget.configPreferences),
        Provider(
          create: (context) => PlayersService(widget.sqlService.database),
        ),
        Provider(
          create: (context) => EventsService(widget.sqlService.database),
        ),
        Provider(
          create: (context) => NotificationService(widget.sqlService.database),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileProvider(widget.configPreferences),
        ),
        ChangeNotifierProvider(
          create: (context) => NotificationProvider(
            notificationService: Provider.of(context, listen: false),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => LeaderboardProvider(
            eventsService: Provider.of(context, listen: false),
            router: router,
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => EventsProvider(
            leaderboardProvider: Provider.of(context, listen: false),
            eventsService: Provider.of(context, listen: false),
            playersService: Provider.of(context, listen: false),
            profileProvider: Provider.of(context, listen: false),
            router: router,
          ),
        ),
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
