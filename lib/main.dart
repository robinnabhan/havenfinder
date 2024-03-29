import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:havenfinder/src/core/theme/constants.dart';
import 'package:havenfinder/src/modules/home_module/interactor/search_state.dart';
import 'package:havenfinder/src/modules/main_module/router/main_router.dart';

import 'package:havenfinder/src/realm/app_services.dart';
import 'package:havenfinder/src/realm/realm_services.dart';

import 'package:provider/provider.dart' as provider;
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final realmConfig =
      json.decode(await rootBundle.loadString('assets/config/realm.json'));
  String appId = realmConfig['appId'];
  Uri baseUrl = Uri.parse(realmConfig['baseUrl']);
  // final FirebaseStorage storage = FirebaseStorage.instance;
//  final realmProvider = FutureProvider((ref) async {
//   final realmConfig = json.decode(await rootBundle.loadString('assets/config/realm.json'));
//   final appId = realmConfig['appId'];
//   final baseUrl = Uri.parse(realmConfig['baseUrl']);

//   final appServices = AppServices(appId, baseUrl);
//   // You can initialize any additional properties of appServices here if needed

//   return appServices;
// });

  // return runApp(const ProviderScope(child: App()));
  return runApp(
    ProviderScope(
        child: provider.MultiProvider(providers: [
      provider.ChangeNotifierProvider<AppServices>(
          create: (_) => AppServices(appId, baseUrl)),
      provider.ChangeNotifierProxyProvider<AppServices, RealmServices?>(
          // RealmServices can only be initialized only if the user is logged in.
          create: (context) => null,
          update: (BuildContext context, AppServices appServices,
              RealmServices? realmServices) {
            return appServices.app.currentUser != null
                ? RealmServices(appServices.app)
                : null;
          }),
    ], child: const App())),
  );
}

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
