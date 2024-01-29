import 'package:flutter/material.dart';

PageRouteBuilder buildTransitionAnimation({
  required Widget page,
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, anotherAnimation) => page,
    transitionDuration: Duration(milliseconds: 500),
    reverseTransitionDuration: Duration(milliseconds: 250),
    settings: settings,
    transitionsBuilder: (context, animation, anotherAnimation, child) {
      animation = CurvedAnimation(
        curve: Curves.easeInOutQuad,
        parent: animation,
        reverseCurve: Curves.fastOutSlowIn,
      );
      return Align(
        alignment: Alignment.topLeft,
        child: SizeTransition(
          axis: Axis.horizontal,
          sizeFactor: animation,
          axisAlignment: 0,
          child: child,
        ),
      );
    },
  );
}
