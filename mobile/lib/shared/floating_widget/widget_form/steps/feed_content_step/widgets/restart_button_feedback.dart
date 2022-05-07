import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../../../core/core.dart';

class RestartButtonFeedback extends StatelessWidget {
  final void Function() handleRestartFeedback;
  const RestartButtonFeedback({
    Key? key,
    required this.handleRestartFeedback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: InkWell(
        onTap: handleRestartFeedback,
        borderRadius: BorderRadius.circular(24),
        child: Ink(
          width: 40,
          height: 40,
          child: Icon(
            PhosphorIcons.arrowLeftBold,
            color: AppTheme.colors.textSecondary,
            size: 16,
          ),
        ),
      ),
    );
  }
}
