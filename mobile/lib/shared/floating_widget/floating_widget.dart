import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:screenshot/screenshot.dart';

import '../../core/core.dart';
import 'widget_form/widget_form.dart';

class FloatingWidget extends StatelessWidget {
  final ScreenshotController screenshotController;
  const FloatingWidget({
    Key? key,
    required this.screenshotController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,
      child: FloatingActionButton(
        backgroundColor: AppTheme.colors.brand,
        child: Icon(
          PhosphorIcons.chatTeardropDotsBold,
          color: AppTheme.colors.textOnBrandColor,
          size: 24,
        ),
        onPressed: () {
          Widget sheet = WidgetForm(
              key: UniqueKey(), screenshotController: screenshotController);
          showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (BuildContext context) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: sheet,
              );
            },
          );
        },
      ),
    );
  }
}
