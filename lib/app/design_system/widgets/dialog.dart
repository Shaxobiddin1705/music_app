import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:music_app/app/design_system/design_system.dart';

class BasicDialog extends StatelessWidget {
  final String? title;
  final Widget? subtitleWidget;
  final String? subtitle;
  final String? confirmButtonText;
  final String? cancelButtonText;
  final Color? confirmButtonColor;
  final Color? cancelButtonColor;
  final VoidCallback? confirmButton;
  final VoidCallback? cancelButton;

  const BasicDialog({
    super.key,
    this.title,
    this.subtitleWidget,
    this.subtitle,
    this.confirmButtonText,
    this.cancelButtonText,
    this.confirmButtonColor,
    this.cancelButtonColor,
    this.confirmButton,
    this.cancelButton,
  });

  @override
  Widget build(BuildContext context) {
    final bool isIOS = Platform.isIOS;

    return isIOS
        ? BasicCupertinoDialog(
            context,
            titleText: title,
            subtitleWidget: subtitleWidget,
            subtitleText: subtitle,
            confirmButtonText: confirmButtonText,
            cancelButtonText: cancelButtonText,
            confirmButton: confirmButton,
            cancelButton: cancelButton,
            confirmButtonColor: confirmButtonColor,
            cancelButtonColor: cancelButtonColor,
          )
        : BasicAndroidDialog(
            context,
            titleText: title,
            subtitleWidget: subtitleWidget,
            subtitleText: subtitle,
            confirmButtonText: confirmButtonText,
            cancelButtonText: cancelButtonText,
            confirmButton: confirmButton,
            cancelButton: cancelButton,
            confirmButtonColor: confirmButtonColor,
            cancelButtonColor: cancelButtonColor,
          );
  }
}

class BasicAndroidDialog extends AlertDialog {
  final String? titleText;
  final Widget? subtitleWidget;
  final String? subtitleText;
  final String? confirmButtonText;
  final String? cancelButtonText;
  final Color? cancelButtonColor;
  final Color? confirmButtonColor;
  final VoidCallback? confirmButton;
  final VoidCallback? cancelButton;
  final BuildContext context;

  BasicAndroidDialog(
    this.context, {
    super.key,
    this.confirmButtonText,
    this.cancelButtonText,
    this.titleText,
    this.subtitleText,
    this.confirmButton,
    this.cancelButton,
    this.confirmButtonColor,
    this.cancelButtonColor,
    this.subtitleWidget,
  }) : super(
          title: titleText != null
              ? Text(
                  titleText,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                )
              : const SizedBox.shrink(),
          content: subtitleWidget ??
              (subtitleText != null
                  ? Text(
                      subtitleText,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  : const SizedBox.shrink()),
          actionsPadding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          actions: [
            if (cancelButtonText != null)
              TextButton(
                onPressed: cancelButton,
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                ),
                child: Text(
                  cancelButtonText,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: cancelButtonColor,
                  ),
                ),
              ),
            if (confirmButtonText != null)
              TextButton(
                onPressed: confirmButton,
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                ),
                child: Text(
                  confirmButtonText,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: confirmButtonColor,
                  ),
                ),
              ),
          ],
        );
}

class BasicCupertinoDialog extends CupertinoAlertDialog {
  final String? titleText;
  final Widget? subtitleWidget;
  final String? subtitleText;
  final String? confirmButtonText;
  final String? cancelButtonText;
  final Color? confirmButtonColor;
  final Color? cancelButtonColor;
  final VoidCallback? confirmButton;
  final VoidCallback? cancelButton;
  final BuildContext context;

  BasicCupertinoDialog(
    this.context, {
    super.key,
    this.titleText,
    this.subtitleWidget,
    this.subtitleText,
    this.confirmButtonText,
    this.cancelButtonText,
    this.confirmButtonColor,
    this.cancelButtonColor,
    this.confirmButton,
    this.cancelButton,
  }) : super(
          title: titleText != null
              ? Text(
                  titleText,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                )
              : const SizedBox.shrink(),
          content: subtitleWidget ??
              (subtitleText != null
                  ? Text(
                      subtitleText,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  : const SizedBox.shrink()),
          actions: [
            if (cancelButtonText != null)
              CupertinoDialogAction(
                onPressed: cancelButton,
                child: Text(
                  cancelButtonText,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: cancelButtonColor,
                  ),
                ),
              ),
            if (confirmButtonText != null)
              CupertinoDialogAction(
                onPressed: confirmButton,
                child: Text(
                  confirmButtonText,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: confirmButtonColor,
                  ),
                ),
              ),
          ],
        );
}
