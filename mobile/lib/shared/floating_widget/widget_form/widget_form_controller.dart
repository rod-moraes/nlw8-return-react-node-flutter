import 'dart:convert';
import 'dart:typed_data';

import 'package:screenshot/screenshot.dart';
import 'package:widget_nlw8/domain/feedback/usecase/feedback_usecase.dart';

import 'model/type_model.dart';

class WidgetFormController {
  FeedbackUseCase feedbackUseCase = FeedbackUseCase();
  ScreenshotController screenshotController;
  void Function()? onUpdate;
  void Function()? onDisableKeypad;
  bool disposeBool = false;
  bool sendFeedback = false;
  String feedbackText = '';

  bool disableForm = false;
  TypeModel? selectedTypeModel;
  String screenshot = '';

  bool isLoadingScreenshot = false;
  WidgetFormController({
    required this.screenshotController,
  });

  void onSelectType(String type) {
    selectedTypeModel = TypeModel.listFeedbackTypes().firstWhere(
        (element) => element.type == type,
        orElse: () => TypeModel.listFeedbackTypes().first);
    update();
  }

  void handleRestartFeedback() {
    selectedTypeModel = null;
    feedbackText = '';
    screenshot = '';
    sendFeedback = false;
    update();
  }

  void handleFeedbackText(String text) {
    feedbackText = text;
    update(disableKeypad: false);
  }

  void onRemoveShot() {
    isLoadingScreenshot = true;
    update();
    screenshot = '';
    isLoadingScreenshot = false;
    update();
  }

  void onTakeShot() async {
    isLoadingScreenshot = true;
    update();
    try {
      Uint8List? capture = await screenshotController.capture();
      if (capture != null) screenshot = uint8ListTob64(capture);
    } catch (e) {
      print(e);
    }
    isLoadingScreenshot = false;
    update();
  }

  void onSavedSubmitFeedback() async {
    disableForm = true;
    update();
    await Future.delayed(Duration(seconds: 2));
    if (!disposeBool) {
      try {
        await feedbackUseCase.sendFeedback(
            feedbackText, screenshot, selectedTypeModel!.type);

        sendFeedback = true;
      } catch (e) {
        print(e);
      }

      disableForm = false;
      update();
      print(screenshot);
      print(feedbackText);
    }
  }

  String uint8ListTob64(Uint8List uint8list) {
    String base64String = base64Encode(uint8list);
    String header = "";
    return header + base64String;
  }

  void update({bool disableKeypad = true}) {
    if (onUpdate != null) onUpdate!();
    if (disableKeypad && onDisableKeypad != null) onDisableKeypad!();
  }

  void dispose() {
    disposeBool = true;
  }
}
