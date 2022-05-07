import 'package:flutter/material.dart';

import '../../../../../core/core.dart';

class CopyrightWidget extends StatelessWidget {
  const CopyrightWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Text("Feito com ♥ pela Rocketseat",
          style: AppTheme.textStyles.textSecondarySmall),
    );
  }
}
