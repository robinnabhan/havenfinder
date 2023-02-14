import 'package:flutter/material.dart';
import 'package:havenfinder/src/core/components/widget_helper/scale_tap.dart';
import 'package:havenfinder/src/core/theme/constants.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    Key? key,
    required this.onTap,
    this.text,
    this.icon,
    this.buttonColor,
    required this.borderColor,
    required this.loading,
    required this.disabled,
    required this.margin,
    required this.width,
  }) : super(key: key);

  final void Function()? onTap;
  final String? text;
  final Widget? icon;
  final bool loading;
  final bool disabled;
  final bool margin;
  final Color borderColor;
  final Color? buttonColor;
  final double width;

  /* *** *** Build *** *** */
  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      onTap: disabled
          ? null
          : loading
              ? null
              : onTap,
      child: Container(
        margin: margin
            ? Constant.smallHorizontalPadding(
                width: width,
              )
            : null,
        height: Theme.of(context).buttonTheme.height,
        decoration: BoxDecoration(
          color: buttonColor ?? Colors.transparent,
          border: Border.all(
            color: disabled ? Theme.of(context).disabledColor : borderColor,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            if (icon != null)
              Align(
                alignment: text == null
                    ? AlignmentDirectional.center
                    : AlignmentDirectional.centerStart,
                child: Padding(
                  padding: text != null
                      ? Constant.baseStartPadding(width: width)
                      : Constant.baseHorizontalPadding(width: width),
                  child: icon,
                ),
              ),
            if (text != null)
              Align(
                alignment: AlignmentDirectional.center,
                child: loading
                    ? CircularProgressIndicator(
                        color: borderColor,
                      )
                    : Text(
                        text!,
                        style: disabled
                            ? Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    color: Theme.of(context).disabledColor)
                            : borderColor != Constant.blackColor
                                ? Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(color: borderColor)
                                : Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.end,
                      ),
              ),
          ],
        ),
      ),
    );
  }
}
