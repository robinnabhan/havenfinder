import 'package:flutter/material.dart';
import '../widget_helper/scale_tap.dart';
import 'package:havenfinder/src/core/theme/constants.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.onTap,
    required this.text,
    required this.loading,
    required this.disabled,
    required this.margin,
    required this.width,
  }) : super(key: key);

  final void Function()? onTap;
  final String text;
  final bool loading;
  final bool disabled;
  final bool margin;
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
        height: 50,
        decoration: BoxDecoration(
          color: disabled
              ? Theme.of(context).disabledColor
              : Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: loading
              ? CircularProgressIndicator(
                  color: Theme.of(context).backgroundColor,
                )
              : Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
