import 'package:flutter/material.dart';

import '../../../../../../core/core.dart';
import '../../../model/type_model.dart';
import 'restart_button_feedback.dart';

class HeaderTitleWidget extends StatelessWidget {
  final void Function() handleRestartFeedback;
  final TypeModel typeModel;
  const HeaderTitleWidget({
    Key? key,
    required this.handleRestartFeedback,
    required this.typeModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RestartButtonFeedback(handleRestartFeedback: handleRestartFeedback),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                  tag: typeModel.sourceImage,
                  child: Image.asset(typeModel.sourceImage, height: 24)),
              const SizedBox(width: 8),
              Text(typeModel.title,
                  style: AppTheme.textStyles.titleTextPrimary),
            ],
          ),
        )
      ],
    );
  }
}
