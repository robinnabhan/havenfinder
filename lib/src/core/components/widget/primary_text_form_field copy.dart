import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:havenfinder/src/core/theme/constants.dart';

class PrimaryTextFormField extends FormField<String> {
  final double width;
  final double height;
  final FormFieldValidator<String> formValidator;
  final bool obscure;
  final FocusNode? focusNode;
  final TextInputType keyboard;
  final TextInputAction textInputAction;
  final void Function(String) onSubmitted;
  final TextEditingController? controller;
  final List<TextInputFormatter> inputFormatter;
  final String hintText;
  final String labelText;
  final BuildContext context;
  final bool margin;
  final bool multiLine;
  final double? fieldWidth;
  final bool suffix;
  final Widget? suffixWidget;
  PrimaryTextFormField({
    Key? key,
    required this.height,
    required this.context,
    required this.labelText,
    required this.hintText,
    required this.width,
    required this.onSubmitted,
    required this.formValidator,
    required this.obscure,
    this.focusNode,
    required this.keyboard,
    required this.textInputAction,
    required this.controller,
    required this.inputFormatter,
    required this.margin,
    this.multiLine = false,
    this.fieldWidth,
    final String initialValue = '',
    required this.suffix,
    this.suffixWidget,
  }) : super(
          key: key,
          initialValue: initialValue,
          validator: formValidator,
          builder: (FormFieldState state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  child: Container(
                    //height * 0.071
                    height: multiLine ? height * 0.178 : 60,
                    width: fieldWidth != null ? width * fieldWidth : null,
                    margin: margin
                        ? Constant.smallHorizontalPadding(
                            width: width,
                          )
                        : null,
                    padding: Constant.smallHorizontalPadding(
                      width: width,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: state.hasError
                              ? Constant.errorColor
                              : Constant.greyColor,
                          width: 0.5),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Stack(
                      children: [
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     AnimatedPadding(
                        //       padding: EdgeInsets.only(
                        //         top:
                        //             // focused
                        //             controller!.text.isNotEmpty ||
                        //                     focusNode!.hasFocus
                        //                 ? 10
                        //                 : 0,
                        //       ),
                        //       duration: const Duration(milliseconds: 150),
                        //       child: AnimatedScale(
                        //         alignment: Alignment.topLeft,
                        //         duration: const Duration(milliseconds: 150),
                        //         scale:

                        //             //  focused
                        //             controller.text.isNotEmpty ||
                        //                     focusNode!.hasFocus
                        //                 ? 0.857
                        //                 : 1,
                        //         child: AnimatedSlide(
                        //           offset: Offset(
                        //               0.0,
                        //               // focused
                        //               controller.text.isNotEmpty ||
                        //                       focusNode!.hasFocus
                        //                   ? multiLine
                        //                       ? -2.8
                        //                       : -0.8
                        //                   : multiLine
                        //                       ? -2
                        //                       : 0),
                        //           duration: const Duration(milliseconds: 150),
                        //           child: Text(
                        //             labelText,
                        //             style: state.hasError
                        //                 ? Constant.errorHintText
                        //                 : Theme.of(context)
                        //                     .inputDecorationTheme
                        //                     .hintStyle,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // AnimatedSlide(
                        //   offset: Offset(
                        //       0.0,

                        //       //  focused
                        //       controller.text.isNotEmpty || focusNode!.hasFocus
                        //           ? 0.3
                        //           : -0.1),
                        //   duration: const Duration(milliseconds: 150),
                        //   child:
                        // AnimatedOpacity(
                        //   opacity:
                        //       // focused

                        //       controller.text.isNotEmpty ||
                        //               focusNode!.hasFocus
                        //           ? 1.0
                        //           : 0.0,
                        //   duration: const Duration(milliseconds: 150),
                        //   child:

                        TextField(
                          cursorColor: Theme.of(context).primaryColor,
                          // onTap: onTap,
                          inputFormatters: inputFormatter,
                          controller: controller,
                          onSubmitted: onSubmitted,
                          onChanged: state.didChange,
                          focusNode: focusNode,
                          textInputAction: textInputAction,
                          keyboardType: keyboard,
                          obscureText: obscure,
                          maxLines: multiLine ? 3 : 1,
                          minLines: multiLine ? 3 : null,
                          style: Theme.of(context).textTheme.bodyText1,
                          decoration: InputDecoration(
                            label: Text(
                              labelText,
                              style: state.hasError
                                  ? Constant.errorHintText
                                  : Theme.of(context)
                                      .inputDecorationTheme
                                      .labelStyle,
                            ),
                            hintText: hintText,
                            hintStyle: Theme.of(context)
                                .inputDecorationTheme
                                .hintStyle,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            //   suffixIcon: suffix
                            //       ? Padding(
                            //           padding: EdgeInsetsDirectional.only(
                            //               end: width * 0.047),
                            //           child: Row(
                            //             mainAxisSize: MainAxisSize.min,
                            //             mainAxisAlignment: MainAxisAlignment.end,
                            //             children: [suffixWidget!],
                            //           ),
                            //         )
                            //       : null,
                          ),
                        ),
                        // ),
                        // ),
                        if (suffix)
                          Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: suffixWidget),
                      ],
                    ),
                  ),
                ),
                if (state.hasError)
                  Container(
                    height: height * 0.071,
                    margin: margin
                        ? Constant.errorContainerPadding(
                            width: width,
                            height: height,
                          )
                        : Constant.xSmallTopPadding(
                            height: height,
                          ),
                    padding: Constant.smallHorizontalPadding(
                      width: width,
                    ),
                    decoration: const BoxDecoration(
                      color: Constant.containerErrorColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                      children: [
                        Text(
                          state.errorText.toString(),
                          style: Constant.errorText,
                        ),
                      ],
                    ),
                  ),
              ],
            );
          },
        );
}
