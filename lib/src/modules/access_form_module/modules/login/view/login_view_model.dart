// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// //import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:form_field_validator/form_field_validator.dart';
// import 'package:havenfinder/src/core/components/responsive/responsive_layout_builder.dart';
// import 'package:havenfinder/src/core/components/widget/primary_button.dart';
// import 'package:havenfinder/src/core/components/widget/primary_text_form_field%20copy.dart';
// import 'package:havenfinder/src/core/components/widget/secondary_button.dart';
// import 'package:havenfinder/src/core/theme/constants.dart';
// import 'package:havenfinder/src/modules/access_form_module/modules/login/controller/login_controller.dart';
// import 'package:havenfinder/src/modules/access_form_module/modules/login/view/form_view/password_widget.dart';
// import 'package:havenfinder/src/realm/app_services.dart';

// class SigninViewModel extends ConsumerStatefulWidget {
//   SigninViewModel({Key? key}) : super(key: key);

//   @override
//   ConsumerState<SigninViewModel> createState() => _SigninViewModelState();
// }

// class _SigninViewModelState extends ConsumerState<SigninViewModel> {
//   bool _logIn = true;
//   String? _errorMessage;

//   void _setLogInSignUpState() {
//     setState(() {
//       _logIn = !_logIn;
//     });
//   }

//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = LoginController();

//   @override
//   void dispose() {
//     _emailController.dispose();
//     // _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     //   final app = Provider<AppServices>();
//     // void _logInUser() async {
//     //   setState(() {
//     //     _errorMessage = null;
//     //   });
//     //   try {
//     //     await app.logInUserEmailPw(
//     //         _emailController.text, _passwordController.text);
//     //     Navigator.pushNamed(context, '/');
//     //   } catch (err) {
//     //     setState(() {
//     //       _errorMessage = err.toString();
//     //     });
//     //   }
//     // }

//     // void _signUpUser() async {
//     //   setState(() {
//     //     _errorMessage = null;
//     //   });
//     //   try {
//     //     await app.registerUserEmailPw(
//     //         _emailController.text, _passwordController.text);
//     //     Navigator.pushNamed(context, '/');
//     //   } catch (err) {
//     //     setState(() {
//     //       _errorMessage = err.toString();
//     //     });
//     //   }
//     // }

//     return ResponsiveLayoutBuilder(
//         child: (isWeb, isMobile, width, height) => Scaffold(
//                 body: Column(
//               children: [
//                 Expanded(
//                   child: Image.asset(
//                     'assets/images/logotest.png',
//                     fit: BoxFit.cover,
//                     // height: 200,
//                     // width: 200,
//                     alignment: Alignment.center,
//                   ),
//                 ),
//                 // Padding(
//                 //   padding: Constant.xSmallBottomPadding(height: height),
//                 //   child:
//                 Text(
//                   "Sign In to your account",
//                   style: Theme.of(context).textTheme.headlineSmall,
//                   textAlign: TextAlign.center,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     // Perform sign up action
//                   },
//                   child: const Text(
//                     'or Sign Up',
//                     style: TextStyle(
//                         fontSize: 15,
//                         color: Constant.primaryColor,
//                         decoration: TextDecoration.underline),
//                   ),
//                 ),
//                 // ),
//                 SizedBox(
//                   height: 170,
//                   child: Padding(
//                     padding: const EdgeInsetsDirectional.only(
//                       start: 10,
//                       end: 10,
//                     ),
//                     child: ListView(
//                       // mainAxisAlignment: MainAxisAlignment.start,
//                       // crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Email",
//                           style: Theme.of(context).textTheme.bodyLarge,
//                         ),
//                         PrimaryTextFormField(
//                           margin: false,
//                           context: context,
//                           hintText: 'Email',
//                           labelText: 'Email',
//                           controller: _emailController,
//                           //focusNode: controller.profileEmailNode,
//                           width: width,
//                           height: height,
//                           inputFormatter: const [],
//                           keyboard: TextInputType.name,
//                           formValidator: RequiredValidator(errorText: 'red'),
//                           obscure: false,
//                           onSubmitted: (val) {
//                             // log(val);
//                           },
//                           textInputAction: TextInputAction.done,
//                           suffix: false,
//                         ),
//                         Text(
//                           "Password",
//                           style: Theme.of(context).textTheme.bodyLarge,
//                         ),
//                         PasswordFormView(
//                           controller: _passwordController,
//                           width: width,
//                           height: height,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   child: Padding(
//                     padding: const EdgeInsetsDirectional.only(
//                       start: 50,
//                       end: 50,
//                     ),
//                     child: Column(
//                       children: [
//                         PrimaryButton(
//                             onTap: () => {},
//                             text: "Login",
//                             loading: false,
//                             disabled: false,
//                             margin: false,
//                             width: width),
//                         Padding(
//                           padding: Constant.xSmallTopPadding(height: height),
//                           child: const Text(
//                             'Or continue with',
//                             style: TextStyle(
//                               fontSize: 15,
//                               color: Constant.primaryColor,
//                               //decoration: TextDecoration.underline
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 250,
//                   child: ListView(
//                     children: [
//                       // Padding(
//                       //   padding: Constant.baseTopPadding(
//                       //     height: height,
//                       //   ),
//                       //   child:
//                       SecondaryButton(
//                         onTap: () => {},
//                         icon: const ImageIcon(
//                           AssetImage('assets/icons/smartphone_device_icon.png'),
//                           size: 25,
//                         ),
//                         loading: false,
//                         disabled: false,
//                         margin: false,
//                         width: width,
//                         text: 'Phone',
//                         borderColor: Theme.of(context).colorScheme.secondary,
//                       ),
//                       //),
//                       Padding(
//                         padding: Constant.xSmallTopPadding(
//                           height: height,
//                         ),
//                         child: SecondaryButton(
//                             onTap: () => {},
//                             icon: const ImageIcon(
//                               AssetImage(
//                                 'assets/icons/apple_icon.png',
//                               ),
//                               size: 25,
//                             ),
//                             borderColor:
//                                 Theme.of(context).colorScheme.secondary,
//                             loading: false,
//                             disabled: false,
//                             margin: false,
//                             width: width,
//                             text: 'Apple'),
//                       ),
//                       Padding(
//                         padding: Constant.xSmallTopPadding(
//                           height: height,
//                         ),
//                         child: SecondaryButton(
//                           onTap: () => {},
//                           icon: Image.asset(
//                             'assets/icons/facebook_icon.png',
//                             width: 25,
//                             fit: BoxFit.contain,
//                           ),
//                           borderColor: Theme.of(context).colorScheme.secondary,
//                           loading: false,
//                           disabled: false,
//                           margin: false,
//                           width: width,
//                           text: 'Facebook',
//                         ),
//                       ),
//                       Padding(
//                         padding: Constant.xSmallTopPadding(
//                           height: height,
//                         ),
//                         child: SecondaryButton(
//                           onTap: () => {},
//                           icon: Image.asset(
//                             'assets/icons/google_icon.png',
//                             width: 25,
//                             fit: BoxFit.contain,
//                           ),
//                           borderColor: Theme.of(context).colorScheme.secondary,
//                           loading: false,
//                           disabled: false,
//                           margin: false,
//                           width: width,
//                           text: 'Google',
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             )));
//   }
// }

import 'package:flutter/material.dart';

import 'package:havenfinder/src/core/components/widget/widgets.dart';
import 'package:havenfinder/src/core/theme/theme.dart';
import 'package:havenfinder/src/realm/app_services.dart';
import 'package:provider/provider.dart';

class SigninViewModel extends StatefulWidget {
  @override
  _SigninViewModelState createState() => _SigninViewModelState();
}

class _SigninViewModelState extends State<SigninViewModel> {
  bool _isLogin = true;
  String? _errorMessage;

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController()..addListener(clearError);
    _passwordController = TextEditingController()..addListener(clearError);
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.only(top: 30),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(_isLogin ? 'Log In' : 'Sign Up',
                    style: const TextStyle(fontSize: 25)),
                loginField(_emailController,
                    labelText: "Email",
                    hintText: "Enter valid email like abc@gmail.com"),
                loginField(_passwordController,
                    labelText: "Password",
                    hintText: "Enter secure password",
                    obscure: true),
                const Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Text(
                      "Please login or register with a Device Sync user account. This is separate from your Atlas Cloud login.",
                      textAlign: TextAlign.center),
                ),
                loginButton(context,
                    child: Text(_isLogin ? "Log in" : "Sign up"),
                    onPressed: () => _logInOrSignUpUser(context,
                        _emailController.text, _passwordController.text)),
                TextButton(
                    onPressed: () => setState(() => _isLogin = !_isLogin),
                    child: Text(
                      _isLogin
                          ? "New to Flutter Realm Todo? Sign up"
                          : 'Already have an account? Log in.',
                    )),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Text(_errorMessage ?? "",
                      style: errorTextStyle(context),
                      textAlign: TextAlign.center),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void clearError() {
    if (_errorMessage != null) {
      setState(() {
        // Reset error message when user starts typing
        _errorMessage = null;
      });
    }
  }

  void _logInOrSignUpUser(
      BuildContext context, String email, String password) async {
    final appServices = Provider.of<AppServices>(context, listen: false);
    clearError();
    try {
      if (_isLogin) {
        await appServices.logInUserEmailPassword(email, password);
      } else {
        await appServices.registerUserEmailPassword(email, password);
      }
      Navigator.pushNamed(context, '/');
    } catch (err) {
      setState(() {
        _errorMessage = err.toString();
      });
    }
  }
}
