import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:havenfinder/src/core/theme/constants.dart';
import 'package:havenfinder/src/modules/main_module/router/main_router.dart';

import 'package:havenfinder/src/modules/main_module/view/onboarding_page.dart';
import 'package:go_router/go_router.dart';
import 'package:havenfinder/src/modules/profile_module/view/profile_view_module.dart';

void main() => runApp(const ProviderScope(child: App()));

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(
//       SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
//     );

//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Constant.materialBrandColor,
//       ),
//       // title: 'Introduction screen',
//       debugShowCheckedModeBanner: false,
//       // theme: ThemeData(primarySwatch: Constant.materialBrandColor),
//       home: const OnBoardingPage(),
//     );
//   }
// }

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Constant.materialBrandColor,
      ),
    );
  }
}
