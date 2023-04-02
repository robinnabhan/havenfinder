import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:havenfinder/src/core/components/responsive/responsive_layout_builder.dart';
import 'package:havenfinder/src/core/components/widget/secondary_button.dart';
import 'package:havenfinder/src/core/components/widget/widgets.dart';
import 'package:havenfinder/src/core/theme/constants.dart';
import 'package:havenfinder/src/core/theme/theme.dart';
import 'package:havenfinder/src/realm/app_services.dart';
import 'package:provider/provider.dart';

class SigninViewModel extends StatefulWidget {
  const SigninViewModel({Key? key}) : super(key: key);

  @override
  State<SigninViewModel> createState() => _SigninViewModelState();
}

class _SigninViewModelState extends State<SigninViewModel> {
  bool _islogin = true;
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
    return ResponsiveLayoutBuilder(
        child: (isWeb, isMobile, width, height) => Scaffold(
                body: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/images/logotest.png',
                    fit: BoxFit.cover,
                    height: 50,
                    // width: 200,
                    alignment: Alignment.center,
                  ),
                ),
                Form(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(_islogin ? 'Log In' : 'Sign Up',
                            style: const TextStyle(fontSize: 25)),
                        loginField(_emailController,
                            labelText: "Email",
                            hintText: "Enter valid email like abc@gmail.com"),
                        loginField(_passwordController,
                            labelText: "Password",
                            hintText: "Enter secure password",
                            obscure: true),
                        loginButton(context,
                            child: Text(_islogin ? "Log in" : "Sign up"),
                            onPressed: () => _logInOrSignUpUser(
                                context,
                                _emailController.text,
                                _passwordController.text)),
                        TextButton(
                            onPressed: () =>
                                setState(() => _islogin = !_islogin),
                            child: Text(
                              _islogin
                                  ? "New to HavenFinder? Sign up"
                                  : 'Already have an account? Log in.',
                            )),
                        // Padding(
                        //   padding: const EdgeInsets.all(25),
                        //   child: Text(_errorMessage ?? "",
                        //       style: errorTextStyle(context),
                        //       textAlign: TextAlign.center),
                        // ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      // Padding(
                      //   padding: Constant.baseTopPadding(
                      //     height: height,
                      //   ),
                      //   child:
                      SecondaryButton(
                        onTap: () => {},
                        icon: const ImageIcon(
                          AssetImage('assets/icons/smartphone_device_icon.png'),
                          size: 25,
                        ),
                        loading: false,
                        disabled: false,
                        margin: false,
                        width: width,
                        text: 'Phone',
                        borderColor: Theme.of(context).colorScheme.secondary,
                      ),
                      //),
                      Padding(
                        padding: Constant.xSmallTopPadding(
                          height: height,
                        ),
                        child: SecondaryButton(
                            onTap: () => {},
                            icon: const ImageIcon(
                              AssetImage(
                                'assets/icons/apple_icon.png',
                              ),
                              size: 25,
                            ),
                            borderColor:
                                Theme.of(context).colorScheme.secondary,
                            loading: false,
                            disabled: false,
                            margin: false,
                            width: width,
                            text: 'Apple'),
                      ),
                      Padding(
                        padding: Constant.xSmallTopPadding(
                          height: height,
                        ),
                        child: SecondaryButton(
                          onTap: () => {},
                          icon: Image.asset(
                            'assets/icons/facebook_icon.png',
                            width: 25,
                            fit: BoxFit.contain,
                          ),
                          borderColor: Theme.of(context).colorScheme.secondary,
                          loading: false,
                          disabled: false,
                          margin: false,
                          width: width,
                          text: 'Facebook',
                        ),
                      ),
                      Padding(
                        padding: Constant.xSmallTopPadding(
                          height: height,
                        ),
                        child: SecondaryButton(
                          onTap: () => {},
                          icon: Image.asset(
                            'assets/icons/google_icon.png',
                            width: 25,
                            fit: BoxFit.contain,
                          ),
                          borderColor: Theme.of(context).colorScheme.secondary,
                          loading: false,
                          disabled: false,
                          margin: false,
                          width: width,
                          text: 'Google',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
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
      if (_islogin) {
        await appServices.logInUserEmailPassword(email, password);
        print("Current user ID");
        print(appServices.app.currentUser?.id);
      } else {
        await appServices.registerUserEmailPassword(email, password);
        print("Current user ID");
        print(appServices.app.currentUser?.id);
      }
      context.go('/');
    } catch (err) {
      setState(() {
        _errorMessage = err.toString();
      });
    }
  }
}
