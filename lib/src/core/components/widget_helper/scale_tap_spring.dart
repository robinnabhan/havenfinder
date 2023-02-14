import 'package:flutter/animation.dart';
import 'package:flutter/physics.dart';

class ScaleTapSpring extends Curve {
  final SpringSimulation sim = SpringSimulation(
    SpringDescription.withDampingRatio(
      mass: 1,
      stiffness: 70,
      ratio: 0.7,
    ),
    0.0,
    1.0,
    0.0,
  );

  @override
  double transform(double t) => sim.x(t) + t * (1 - sim.x(1.0));
}
