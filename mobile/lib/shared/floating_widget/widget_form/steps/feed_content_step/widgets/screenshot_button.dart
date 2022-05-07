import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../../../core/core.dart';

class ScreenshotButton extends StatelessWidget {
  final String screenshot;
  final bool isLoading;
  final Function() onTakeShot;
  final Function() onRemoveShot;
  const ScreenshotButton({
    Key? key,
    required this.screenshot,
    required this.isLoading,
    required this.onTakeShot,
    required this.onRemoveShot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading
          ? null
          : screenshot.isEmpty
              ? onTakeShot
              : onRemoveShot,
      borderRadius: BorderRadius.circular(4),
      child: Ink(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppTheme.colors.surfaceSecondary,
          borderRadius: BorderRadius.circular(4),
        ),
        child: isLoading
            ? Padding(
                padding: EdgeInsets.all(14),
                child: CircularProgressIndicator(
                  color: AppTheme.colors.textPrimary,
                  strokeWidth: 2,
                ),
              )
            : Stack(
                children: [
                  screenshot.isEmpty
                      ? Container()
                      : Ink.image(
                          image: MemoryImage(
                            Base64Decoder().convert(screenshot),
                          ),
                          fit: BoxFit.fitWidth,
                        ),
                  screenshot.isEmpty
                      ? Center(
                          child: Icon(PhosphorIcons.camera,
                              color: AppTheme.colors.textPrimary))
                      : Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Icon(PhosphorIcons.trashFill,
                                size: 16, color: AppTheme.colors.textSecondary),
                          ),
                        ),
                ],
              ),
      ),
    );
  }
}
