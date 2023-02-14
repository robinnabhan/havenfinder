import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ResponsiveLayoutBuilder extends StatelessWidget {
  const ResponsiveLayoutBuilder({Key? key, required this.child})
      : super(key: key);
  final Widget Function(bool, bool, double, double) child;
  final double _mobileBreakpoint = 576;
  final bool _isWeb = kIsWeb;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth >= _mobileBreakpoint;
        return child(
          _isWeb,
          isMobile,
          width,
          height,
        );
      },
    );
  }
}
