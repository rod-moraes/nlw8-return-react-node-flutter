import 'package:flutter/material.dart';

import '../../../../../../core/core.dart';
import '../../../model/type_model.dart';

class OptionTypeWidget extends StatelessWidget {
  final TypeModel feedbackType;
  final void Function(String) onSelectType;
  const OptionTypeWidget({
    Key? key,
    required this.feedbackType,
    required this.onSelectType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelectType(feedbackType.type),
      borderRadius: BorderRadius.circular(8),
      splashColor: AppTheme.colors.brand,
      highlightColor: AppTheme.colors.brand.withOpacity(0.2),
      child: Ink(
        width: 104,
        height: 112,
        decoration: BoxDecoration(
          color: AppTheme.colors.surfaceSecondary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
                tag: feedbackType.sourceImage,
                child: Image.asset(feedbackType.sourceImage,
                    height: 40, width: 40)),
            const SizedBox(height: 8),
            Text(feedbackType.title,
                style: AppTheme.textStyles.textPrimaryMedium),
          ],
        ),
      ),
    );
  }
}
