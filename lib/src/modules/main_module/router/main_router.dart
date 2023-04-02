import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:havenfinder/src/core/components/responsive/responsive_layout_builder.dart';
import 'package:havenfinder/src/modules/access_form_module/modules/login/view/form_view/password_widget.dart';
import 'package:havenfinder/src/modules/access_form_module/modules/login/view/login_view_model.dart';
import 'package:havenfinder/src/modules/app_module/screen/error/route_error_screen.dart';
import 'package:havenfinder/src/modules/home_module/view/home_view_model.dart';
import 'package:havenfinder/src/modules/main_module/presenter/provider/dashboard_provider.dart';
import 'package:havenfinder/src/modules/main_module/view/dashboard_screen.dart';

import 'package:havenfinder/src/modules/profile_module/view/profile_view_module.dart';
import 'package:havenfinder/src/modules/upload_module/view/upload_view_model.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey(debugLabel: 'shell');

final goRouterProvider = Provider<GoRouter>((ref) {
  final notifier = ref.read(goRouterNotifierProvider);

  return GoRouter(
    initialLocation: '/login',
    navigatorKey: _rootNavigatorKey,
    refreshListenable: notifier,
    // redirect: (context, state) => '/',
    routes: [
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => SigninViewModel(
            // key: state.pageKey,
            ),
      ),
      // GoRoute(
      //   path: '/signup',
      //   name: 'signup',
      //   builder: (context, state) => SignupFormView(key: state.pageKey),
      // ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        // pageBuilder: (context, state, child) {
        //   print(state.location);
        //   return NoTransitionPage(
        //       child: ScaffoldWithNavBar(
        //     key: state.pageKey,
        //     //location: state.location,
        //     child: child,
        //   ));
        // },
        builder: (context, state, child) =>
            DashboardScreen(key: state.pageKey, child: child),
        routes: [
          GoRoute(
            path: '/',
            //parentNavigatorKey: _shellNavigatorKey,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                  child: HomeView(
                key: state.pageKey,
              ));
            },
          ),
          GoRoute(
            path: '/search',
            //parentNavigatorKey: _shellNavigatorKey,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: Scaffold(
                  body: Center(child: Text("Search")),
                ),
              );
            },
          ),
          GoRoute(
            path: '/upload',
            //parentNavigatorKey: _shellNavigatorKey,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                  child:
                      // Scaffold(
                      //   body: Center(child: Text("Upload")),
                      // ),
                      PropertyUploadPage(
                          // key: state.pageKey,
                          ));
            },
          ),
          GoRoute(
              //parentNavigatorKey: _shellNavigatorKey,
              path: '/favorite',
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: Scaffold(
                    body: Center(child: Text("Favorite")),
                  ),
                );
              }),
          GoRoute(
            //parentNavigatorKey: _rootNavigatorKey,
            path: '/profile',
            pageBuilder: (context, state) {
              return NoTransitionPage(
                  child: ProfileView(
                key: state.pageKey,
              ));
            },
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => RouteErrorScreen(
      errorMsg: state.error.toString(),
      key: state.pageKey,
    ),
  );
});
