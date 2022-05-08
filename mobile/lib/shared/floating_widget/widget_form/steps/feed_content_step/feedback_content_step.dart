import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:widget_nlw8/shared/floating_widget/widget_form/model/type_model.dart';

import '../../../../../core/core.dart';
import '../../../../text_form_input/text_form_input.dart';
import 'widgets/header_title.dart';
import 'widgets/screenshot_button.dart';

class FeedbackContentStep extends StatefulWidget {
  final bool disable;
  final void Function() handleRestartFeedback;
  final void Function(String) handleFeedbackText;
  final void Function() onSaved;
  final String feedbackText;
  final void Function() onTakeShot;
  final void Function() onRemoveShot;
  final String screenshot;
  final bool isLoadingScreenshot;
  final TypeModel? typeModel;
  const FeedbackContentStep({
    Key? key,
    required this.handleRestartFeedback,
    required this.handleFeedbackText,
    required this.onSaved,
    required this.feedbackText,
    required this.onTakeShot,
    required this.onRemoveShot,
    required this.screenshot,
    required this.isLoadingScreenshot,
    required this.typeModel,
    this.disable = false,
  }) : super(key: key);

  @override
  State<FeedbackContentStep> createState() => _FeedbackContentStepState();
}

class _FeedbackContentStepState extends State<FeedbackContentStep> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return widget.typeModel == null
        ? Container()
        : Material(
            color: Colors.transparent,
            child: IgnorePointer(
              ignoring: widget.disable,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 8),
                    HeaderTitleWidget(
                        handleRestartFeedback: widget.handleRestartFeedback,
                        typeModel: widget.typeModel!),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          children: [
                            Expanded(
                              child: TextFormInput(
                                text: widget.feedbackText,
                                hintText: widget.typeModel!.placeholder,
                                expands: true,
                                focusedBorderColor: AppTheme.colors.brand,
                                onChanged: (String? feedback) {
                                  if (feedback != null) {
                                    widget.handleFeedbackText(feedback);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        children: [
                          ScreenshotButton(
                            onRemoveShot: widget.onRemoveShot,
                            onTakeShot: widget.onTakeShot,
                            screenshot: widget.screenshot,
                            isLoading: widget.isLoadingScreenshot,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: AnimatedOpacity(
                              opacity: (widget.feedbackText.isEmpty &&
                                      widget.screenshot.isEmpty)
                                  ? 0.5
                                  : 1,
                              duration: Duration(milliseconds: 400),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: AppTheme.colors.brand,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: (widget.feedbackText.isEmpty &&
                                            widget.screenshot.isEmpty)
                                        ? null
                                        : () {
                                            _formKey.currentState!.save();
                                            widget.onSaved();
                                          },
                                    borderRadius: BorderRadius.circular(4),
                                    child: Ink(
                                      height: 40,
                                      child: widget.disable
                                          ? Center(
                                              child: SizedBox(
                                                width: 12,
                                                height: 12,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: AppTheme
                                                      .colors.textOnBrandColor,
                                                  strokeWidth: 2,
                                                ),
                                              ),
                                            )
                                          : Center(
                                              child: Text(
                                              "Enviar feedback",
                                              style: AppTheme.textStyles
                                                  .buttonOnBrandColor,
                                            )),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
