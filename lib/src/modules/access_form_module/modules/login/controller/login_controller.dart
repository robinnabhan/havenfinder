import 'package:flutter/widgets.dart';

class LoginController {
  final GlobalKey<FormState> _formKeyLogin = GlobalKey<FormState>();
  GlobalKey<FormState> get formKeyLogin => _formKeyLogin;

  final GlobalKey<FormFieldState> _loginPasswordFieldKey =
      GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> get loginPasswordFieldKey => _loginPasswordFieldKey;

  final FocusNode _loginPasswordNode = FocusNode();
  FocusNode get loginPasswordNode => _loginPasswordNode;

  final TextEditingController _loginPasswordController =
      TextEditingController();
  TextEditingController get loginPasswordController => _loginPasswordController;
}
