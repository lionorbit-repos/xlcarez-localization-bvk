
import 'package:flutter/material.dart';

void navigationSlide(context, tap, {x = 0.0, y = 0.0}) {
  Navigator.push(context, PageRouteBuilder(pageBuilder: (_, a, s) {
    return SlideTransition(
        position: Tween<Offset>(begin:  Offset(x, y), end: Offset.zero)
            .animate(a),
        child: tap);
  }));
}

void navigationSlideAndRemoveUntil(BuildContext context, Widget newPage,
    {isroute=false,x = 0.0, y = 0.0}) {
  Navigator.pushAndRemoveUntil(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return SlideTransition(
          position: Tween<Offset>(begin: Offset(x, y), end: Offset.zero)
              .animate(animation),
          child: newPage,
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    ),
        (route) => isroute,
  );
}

void navigationSlideAndReplace(BuildContext context, Widget newPage,
    {isroute=false,x = 0.0, y = 0.0}) {
  Navigator.pushReplacement(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return SlideTransition(
          position: Tween<Offset>(begin: Offset(x, y), end: Offset.zero)
              .animate(animation),
          child: newPage,
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    ),
  );
}

void navigateToNewPage(BuildContext context,Widget newPage, {x = 0.0, y = 1.0}) {
  Navigator.push(context, PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return ScaleTransition(
        scale: Tween<double>(
          begin: x,
          end: y,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut, // Ease in and out for smoother transition
          ),
        ),
        child: newPage,
      );
    },
    transitionDuration: const Duration(milliseconds: 300),
  ));
}
