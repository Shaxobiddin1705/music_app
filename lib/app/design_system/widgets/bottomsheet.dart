import 'dart:io';
import 'package:flutter/services.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../design_system.dart';

// Future<T?> showModalBottomSheetCustomX<T>({
//   required BuildContext context,
//   required Widget Function(BuildContext context) builder,
//   Color backgroundColor = AppColors.mainBackground,
//   Color barrierColor = Colors.black54,
//   double elevation = 0,
//   bool useSafeArea = true,
//   bool maintainBottomViewPadding = false,
//   bool expand = false,
//   ShapeBorder? shape,
//   Clip clipBehavior = Clip.hardEdge,
//   BoxConstraints? constraints,
//   bool useRootNavigator = true,
//   bool isDismissible = true,
//   bool enableDrag = true,
//   RouteSettings? routeSettings,
//   AnimationController? transitionAnimationController,
//   SystemUiOverlayStyle? overlayStyleCupertino,
//   BorderRadius borderRadius = const BorderRadius.only(
//     topRight: Radius.circular(12),
//     topLeft: Radius.circular(12),
//   ),
// }) {
//   /// Wrapping Ios devices with Material for using material widgets
//   Widget contentWidget = Platform.isIOS
//       ? Material(
//           type: MaterialType.transparency,
//           child: builder(context),
//         )
//       : builder(context);
//
//   /// Wrap with Safe Area
//   contentWidget = AnnotatedRegion(
//     value: SystemUiOverlayStyle(
//       systemNavigationBarColor: backgroundColor,
//     ),
//     child: SafeArea(
//       top: false,
//       bottom: useSafeArea,
//       maintainBottomViewPadding: maintainBottomViewPadding,
//       child: contentWidget,
//     ),
//   );
//
//   /// Set Constraints
//   if (constraints != null) {
//     contentWidget = ConstrainedBox(
//       constraints: constraints,
//       child: contentWidget,
//     );
//   }
//   return Platform.isIOS
//       ? showCupertinoModalBottomSheet<T>(
//           context: context,
//           elevation: elevation,
//           enableDrag: enableDrag,
//           isDismissible: isDismissible,
//           expand: expand,
//           settings: routeSettings,
//           secondAnimation: transitionAnimationController,
//           useRootNavigator: useRootNavigator,
//           barrierColor: barrierColor,
//           overlayStyle: overlayStyleCupertino,
//           clipBehavior: clipBehavior,
//           shape: shape ?? RoundedRectangleBorder(borderRadius: borderRadius),
//           backgroundColor: backgroundColor,
//           builder: (contextSheet) => contentWidget,
//         )
//       : showMaterialModalBottomSheet<T>(
//           context: context,
//           elevation: elevation,
//           enableDrag: enableDrag,
//           isDismissible: isDismissible,
//           expand: expand,
//           settings: routeSettings,
//           secondAnimation: transitionAnimationController,
//           useRootNavigator: useRootNavigator,
//           barrierColor: barrierColor,
//           clipBehavior: clipBehavior,
//           shape: shape ?? RoundedRectangleBorder(borderRadius: borderRadius),
//           backgroundColor: backgroundColor,
//           builder: (contextSheet) => contentWidget,
//         );
// }
