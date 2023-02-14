import 'package:flutter/material.dart';
import 'package:havenfinder/src/core/theme/constants.dart';

class MenuListButton extends StatelessWidget {
  const MenuListButton({
    Key? key,
    this.image,
    this.showArrow = false,
    this.icon,
    this.flag,
    required this.text,
    required this.onPressed,
    required this.width,
    required this.height,
    this.borderRadius,
    this.buttonHeight,
    this.margin = true,
    this.color,
  }) : super(key: key);

  final String? image;
  final bool showArrow;

  final String? icon;
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double? buttonHeight;
  final String? flag;
  final bool margin;
  final double? borderRadius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin
          ? Constant.smallHorizontalPadding(width: width)
          : EdgeInsets.zero,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 15.0),
            ),
          ),
        ),
        onPressed: onPressed,
        child: SizedBox(
          height: buttonHeight ?? 50,
          child: Row(
            mainAxisAlignment: flag != null
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.start,
            children: [
              if (icon != null)
                ImageIcon(
                  AssetImage(icon!),
                  color: color ?? Constant.blackColor,
                  size: 20,
                ),
              if (image != null)
                Image.asset(
                  image!,
                  width: 20,
                  height: 20,
                ),
              Expanded(
                child: Padding(
                  padding: flag != null
                      ? Constant.xSmallEndPadding(width: width)
                      : showArrow
                          ? Constant.xSmallEndPadding(width: width)
                          : Constant.baseStartPadding(width: width),
                  child: Text(
                    text,
                    style: color != null
                        ? Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: color)
                        : Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              if (showArrow) const Icon(Icons.chevron_right_rounded),
              if (flag != null)
                Container(
                  constraints: BoxConstraints(
                    minWidth: 0,
                    maxWidth: width * 0.2,
                  ),
                  child: Text(
                    flag!,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.end,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
