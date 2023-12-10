import 'package:flutter/material.dart';

modalBottomSheet(
    {required BuildContext context,
      canBeClosed = true,
      required Widget children,
      void Function()? whenCompleteFunction,
      AnimationController? transitionAnimationController,
      Color? backgroundColor}) {
  showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      isDismissible: canBeClosed,
      enableDrag: canBeClosed,
      transitionAnimationController: transitionAnimationController,
      backgroundColor: backgroundColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (BuildContext context) {
        return children;
      }).whenComplete(whenCompleteFunction ?? () {});
}
