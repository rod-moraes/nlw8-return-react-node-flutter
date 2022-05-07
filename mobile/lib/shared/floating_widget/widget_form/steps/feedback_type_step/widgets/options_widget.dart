import 'package:flutter/material.dart';
import 'package:widget_nlw8/shared/floating_widget/widget_form/steps/feedback_type_step/widgets/option_widget.dart';

import '../../../model/type_model.dart';

class OptionsWidget extends StatelessWidget {
  final List<TypeModel> feedbacksTypes;
  final void Function(String) onSelectType;
  const OptionsWidget({
    Key? key,
    required this.feedbacksTypes,
    required this.onSelectType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...feedbacksTypes.map((feedbackType) {
            return OptionTypeWidget(
                feedbackType: feedbackType, onSelectType: onSelectType);
          }),
        ],
      ),
    );
  }
}
