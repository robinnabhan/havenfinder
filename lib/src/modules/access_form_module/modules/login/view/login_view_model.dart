import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:havenfinder/src/core/components/responsive/responsive_layout_builder.dart';
import 'package:havenfinder/src/core/components/widget/primary_button.dart';
import 'package:havenfinder/src/core/components/widget/primary_text_form_field%20copy.dart';
import 'package:havenfinder/src/core/components/widget/secondary_button.dart';
import 'package:havenfinder/src/core/theme/constants.dart';
import 'package:havenfinder/src/modules/access_form_module/modules/login/view/form_view/password_widget.dart';

class SigninViewModel extends StatefulWidget {
  SigninViewModel({Key? key}) : super(key: key);

  @override
  State<SigninViewModel> createState() => _SigninViewModelState();
}

class _SigninViewModelState extends State<SigninViewModel> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
        child: (isWeb, isMobile, width, height) => Scaffold(
                body: Padding(
              padding: Constant.hugeTopPadding(height: height),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logotest.png',
                    fit: BoxFit.cover,
                    height: 200,
                    width: 200,
                    alignment: Alignment.center,
                  ),
                  // Padding(
                  //   padding: Constant.xSmallBottomPadding(height: height),
                  //   child:
                  Text(
                    "Sign In to your account",
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Perform sign up action
                    },
                    child: const Text(
                      'or Sign Up',
                      style: TextStyle(
                          fontSize: 15,
                          color: Constant.primaryColor,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                  // ),
                  SizedBox(
                    height: 270,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 10,
                        end: 10,
                      ),
                      child: ListView(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          PrimaryTextFormField(
                            margin: false,
                            context: context,
                            hintText: 'Email',
                            labelText: 'Email',
                            //controller: controller.profileEmailController,
                            //focusNode: controller.profileEmailNode,
                            width: width,
                            height: height,
                            inputFormatter: const [],
                            keyboard: TextInputType.name,
                            formValidator: RequiredValidator(errorText: 'red'),
                            obscure: false,
                            onSubmitted: (val) {
                              // log(val);
                            },
                            textInputAction: TextInputAction.done,
                            suffix: false,
                          ),
                          Text(
                            "Password",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          PasswordFormView(
                            width: width,
                            height: height,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 50,
                        end: 50,
                      ),
                      child: Column(
                        children: [
                          PrimaryButton(
                              onTap: () => {},
                              text: "Login",
                              loading: false,
                              disabled: false,
                              margin: false,
                              width: width),
                          Padding(
                            padding: Constant.xSmallTopPadding(height: height),
                            child: const Text(
                              'Or continue with',
                              style: TextStyle(
                                fontSize: 15,
                                color: Constant.primaryColor,
                                //decoration: TextDecoration.underline
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    child: ListView(
                      children: [
                        // Padding(
                        //   padding: Constant.baseTopPadding(
                        //     height: height,
                        //   ),
                        //   child:
                        SecondaryButton(
                          onTap: () => {},
                          icon: const ImageIcon(
                            AssetImage(
                                'assets/icons/smartphone_device_icon.png'),
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
                            borderColor:
                                Theme.of(context).colorScheme.secondary,
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
                            borderColor:
                                Theme.of(context).colorScheme.secondary,
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
              ),
            )));
  }
}
