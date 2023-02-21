import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:havenfinder/src/core/components/widget/primary_text_form_field.dart';
import 'package:havenfinder/src/core/theme/constants.dart';
import 'package:havenfinder/src/modules/access_form_module/modules/login/controller/login_controller.dart';

class PasswordFormView extends ConsumerStatefulWidget {
  const PasswordFormView({
    Key? key,
    required this.controller,
    required this.width,
    required this.height,
  }) : super(key: key);

  final LoginController controller;
  final double height;
  final double width;

  @override
  PasswordFormViewState createState() => PasswordFormViewState();
}

class PasswordFormViewState extends ConsumerState<PasswordFormView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final bool loginObscure = ref.watch(loginObscureProvider);
    return Form(
      //key: widget.controller.formKeyLogin,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          // Password
          Padding(
            padding: Constant.smallBottomPadding(
              height: widget.height,
            ),
            child: PrimaryTextFormField(
                margin: false,
                context: context,
                hintText: 'Passsword',
                labelText: 'Password',
                controller: widget.controller.loginPasswordController,
                //focusNode: widget.controller.loginPasswordNode,
                width: widget.width,
                height: widget.height,
                inputFormatter: const [],
                keyboard: TextInputType.visiblePassword,
                formValidator: RequiredValidator(errorText: 'red'),
                //obscure: loginObscure,
                onSubmitted: (val) {
                  widget.controller.loginPasswordNode.unfocus();
                },
                textInputAction: TextInputAction.done,
                suffix: true,
                suffixWidget:
                    //loginObscure?
                    IconButton(
                  onPressed: () => {},
                  // ref
                  //     .read(loginObscureProvider.notifier)
                  //     .update((state) => state = !state),
                  icon: const ImageIcon(
                      AssetImage('assets/icons/eye_close_icon.png'),
                      color: Constant.blackColor,
                      size: 24),
                  splashRadius: 12,
                )
                // : IconButton(
                //     onPressed: () => {},
                //     //  ref
                //     //     .read(loginObscureProvider.notifier)
                //     //     .update((state) => state = !state),
                //     icon: const ImageIcon(
                //         AssetImage('assets/icons/eye_alt_icon.png'),
                //         color: Constant.blackColor,
                //         size: 24),
                //     splashRadius: 12,
                //   ),
                ),
          ),
        ],
      ),
    );
  }
}
