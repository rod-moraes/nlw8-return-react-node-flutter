import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:sizer/sizer.dart';

import '../../../core/core.dart';
import 'animated_cross_fade_widget.dart';
import 'steps/copyright/copyright_widget.dart';
import 'steps/feed_content_step/feedback_content_step.dart';
import 'steps/feedback_success_step/feedback_success_step.dart';
import 'steps/feedback_type_step/feedback_type_step.dart';
import 'widget_form_controller.dart';

class WidgetForm extends StatefulWidget {
  final ScreenshotController screenshotController;
  const WidgetForm({
    Key? key,
    required this.screenshotController,
  }) : super(key: key);

  @override
  State<WidgetForm> createState() => _WidgetFormState();
}

class _WidgetFormState extends State<WidgetForm> {
  late WidgetFormController _widgetFormController;

  @override
  void initState() {
    _widgetFormController =
        WidgetFormController(screenshotController: widget.screenshotController);
    _widgetFormController.onUpdate = () {
      if (mounted) {
        setState(() {
          FocusScope.of(context).unfocus();
        });
      }
    };
    super.initState();
  }

  @override
  void dispose() {
    _widgetFormController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      decoration: BoxDecoration(
          color: AppTheme.colors.surfacePrimary,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 12),
          Container(
            width: 15.w,
            height: 4,
            decoration: BoxDecoration(
              color: AppTheme.colors.textPrimary.withOpacity(.25),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Expanded(
            child: AnimatedCrossFadeWidget(
              firstChild: FeedbackTypeStep(
                onSelectType: (type) =>
                    _widgetFormController.onSelectType(type),
              ),
              secondChild: FeedbackContentStep(
                typeModel: _widgetFormController.selectedTypeModel,
                handleRestartFeedback:
                    _widgetFormController.handleRestartFeedback,
                feedbackText: _widgetFormController.feedbackText,
                handleFeedbackText: _widgetFormController.handleFeedbackText,
                isLoadingScreenshot: _widgetFormController.isLoadingScreenshot,
                onRemoveShot: _widgetFormController.onRemoveShot,
                onTakeShot: _widgetFormController.onTakeShot,
                screenshot: _widgetFormController.screenshot,
                onSaved: _widgetFormController.onSavedSubmitFeedback,
                disable: _widgetFormController.disableForm,
              ),
              isFirst: _widgetFormController.selectedTypeModel == null,
            ),
          ),
          const CopyrightWidget(),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
