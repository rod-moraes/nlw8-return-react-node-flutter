import 'package:flutter/material.dart';

import '../../../../../core/core.dart';
import '../../model/type_model.dart';
import '../copyright/copyright_widget.dart';
import 'widgets/options_widget.dart';

class FeedbackTypeStep extends StatelessWidget {
  final void Function(String) onSelectType;
  const FeedbackTypeStep({Key? key, required this.onSelectType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<TypeModel> feedbacksTypes = TypeModel.listFeedbackTypes();
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          SizedBox(height: 16),
          Text("Deixe seu feedback",
              style: AppTheme.textStyles.titleTextPrimary),
          Expanded(
            child: OptionsWidget(
                feedbacksTypes: feedbacksTypes, onSelectType: onSelectType),
          ),
        ],
      ),
    );
  }
}
