import 'dart:async';

import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

/// Shows a modal material design bottom sheet.
Future<T?> showMaterialModalBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool enableAnimated = true,
  Color? barrierColor,
  bool bounce = false,
  bool expand = false,
  AnimationController? secondAnimation,
  Curve? animationCurve,
  bool useRootNavigator = false,
  bool isDismissible = true,
  bool enableDrag = true,
  Duration? duration,
  RouteSettings? settings,
  double? closeProgressThreshold,
}) async {
  assert(debugCheckHasMediaQuery(context));
  assert(debugCheckHasMaterialLocalizations(context));
  final result = await Navigator.of(context, rootNavigator: useRootNavigator)
      .push(ModalSheetRoute<T>(
    builder: builder,
    closeProgressThreshold: closeProgressThreshold,
    containerBuilder: _materialContainerBuilder(),
    secondAnimationController: secondAnimation,
    bounce: bounce,
    expanded: expand,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    isDismissible: isDismissible,
    modalBarrierColor: barrierColor,
    enableDrag: enableDrag,
    animationCurve: animationCurve,
    duration: duration,
    settings: settings,
  ));
  return result;
}

//Default container builder is the Material Appearance
WidgetWithChildBuilder _materialContainerBuilder() {
  Widget result(context, animation, child) => child;
  return result;
}
