import 'package:flutter/widgets.dart';
import 'scale_tap_spring.dart';

class ScaleTap extends StatefulWidget {
  final void Function()? onTap;
  final Widget child;

  const ScaleTap({
    Key? key,
    this.onTap,
    required this.child,
  }) : super(key: key);

  @override
  ScaleTapState createState() => ScaleTapState();
}

class ScaleTapState extends State<ScaleTap>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
    );
    _scale = Tween<double>(
      begin: 1.0,
      end: 1.0,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _container(
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (_, Widget? child) {
          return Transform.scale(
            alignment: Alignment.center,
            scale: _scale.value,
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }

  Widget _container({required Widget child}) {
    if (widget.onTap != null) {
      return Listener(
        onPointerDown: _onTapDown,
        onPointerCancel: _onTapCancel,
        onPointerUp: _onTapUp,
        child: GestureDetector(
          onTap: widget.onTap,
          child: child,
        ),
      );
    }

    return child;
  }

  Curve get _computedScaleCurve {
    return ScaleTapSpring();
  }

  Duration get _computedDuration {
    return const Duration(milliseconds: 300);
  }

  Future<void> _animation({
    required double scale,
    required Duration duration,
  }) {
    _animationController.stop();
    _animationController.duration = duration;

    _scale = Tween<double>(
      begin: _scale.value,
      end: scale,
    ).animate(
      CurvedAnimation(
        curve: _computedScaleCurve,
        parent: _animationController,
      ),
    );
    _animationController.reset();
    return _animationController.forward();
  }

  Future<void> _onTapDown(_) {
    return _animation(
      scale: 0.95,
      duration: _computedDuration,
    );
  }

  Future<void> _onTapUp(_) {
    return _animation(
      scale: 1.0,
      duration: _computedDuration,
    );
  }

  Future<void> _onTapCancel(_) {
    return _onTapUp(_);
  }
}
