import 'package:flutter/material.dart';
import 'package:widget_nlw8/core/core.dart';

class FeedbackSuccessStep extends StatelessWidget {
  final Function() handleRestartFeedback;
  const FeedbackSuccessStep({
    Key? key,
    required this.handleRestartFeedback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppTheme.images.success, width: 36, height: 36),
        const SizedBox(height: 10),
        Text("Agradecemos o feedback!",
            style: AppTheme.textStyles.titleTextPrimary),
        const SizedBox(height: 24),
        Material(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: handleRestartFeedback,
                borderRadius: BorderRadius.circular(4),
                child: Ink(
                  decoration: BoxDecoration(
                    color: AppTheme.colors.surfaceSecondary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Center(
                      child: Text(
                    "Quero enviar outro",
                    style: AppTheme.textStyles.buttonTextPrimary,
                  )),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
