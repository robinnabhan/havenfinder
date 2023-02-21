// import 'package:flutter/material.dart';
// import 'package:realm/realm.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final appServicesProvider = ChangeNotifierProvider.autoDispose((ref) => AppServices(ref.read));

// class AppServices extends ChangeNotifier {
//   final Reader _reader;
//   String id;
//   Uri baseUrl;
//   App _app;
//   User? currentUser;

//   AppServices(this._reader) :
//         id = _reader(appIdProvider),
//         baseUrl = _reader(baseUrlProvider),
//         _app = App(AppConfiguration(id, baseUrl: baseUrl));

//   Future<User> logInUserEmailPw(String email, String password) async {
//     User loggedInUser =
//         await _app.logIn(Credentials.emailPassword(email, password));
//     currentUser = loggedInUser;
//     notifyListeners();
//     return loggedInUser;
//   }

//   Future<User> registerUserEmailPw(String email, String password) async {
//     EmailPasswordAuthProvider authProvider = EmailPasswordAuthProvider(_app);
//     await authProvider.registerUser(email, password);
//     User loggedInUser =
//         await _app.logIn(Credentials.emailPassword(email, password));
//     currentUser = loggedInUser;
//     notifyListeners();
//     return loggedInUser;
//   }

//   Future<void> logOutUser() async {
//     await _app.currentUser?.logOut();
//     currentUser = null;
//     notifyListeners();
//   }
// }

import 'package:flutter/material.dart';
import 'package:realm/realm.dart';

class AppServices with ChangeNotifier {
  String id;
  Uri baseUrl;
  App app;
  User? currentUser;
  AppServices(this.id, this.baseUrl)
      : app = App(AppConfiguration(id, baseUrl: baseUrl));

  Future<User> logInUserEmailPassword(String email, String password) async {
    User loggedInUser =
        await app.logIn(Credentials.emailPassword(email, password));
    currentUser = loggedInUser;
    notifyListeners();
    return loggedInUser;
  }

  Future<User> registerUserEmailPassword(String email, String password) async {
    EmailPasswordAuthProvider authProvider = EmailPasswordAuthProvider(app);
    await authProvider.registerUser(email, password);
    User loggedInUser =
        await app.logIn(Credentials.emailPassword(email, password));
    currentUser = loggedInUser;
    notifyListeners();
    return loggedInUser;
  }

  Future<void> logOut() async {
    await currentUser?.logOut();
    currentUser = null;
  }
}
