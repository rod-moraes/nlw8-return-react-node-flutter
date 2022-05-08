import '../datasource/feedback_api.dart';

abstract class IFeedbackRepository {
  Future<void> sendFeedback(String comment, String screenshot, String type);
  void dispose();
}

class FeedbackRepository implements IFeedbackRepository {
  final IFeedbackApi _datasource;

  FeedbackRepository({IFeedbackApi? datasource})
      : _datasource = datasource ?? FeedbackApi();

  @override
  Future<void> sendFeedback(
      String comment, String screenshot, String type) async {
    try {
      String response =
          await _datasource.sendFeedback(comment, screenshot, type);
    } catch (e) {
      throw handleErrorReturn(e);
    }
  }

  Object handleErrorReturn(Object e) {
    if (e is String) {
      return e;
    } else if (e is Map<String, dynamic>) {
      if (e["message"] is String) {
        throw e["message"];
      } else if (e["message"] is List) {
        List errors = e["message"];
        String error = "";
        for (var element in errors) {
          Map<String, dynamic> errorMap = element["constraints"];
          errorMap.forEach((key, value) {
            error += value + "\n";
          });
        }
        throw error;
      } else {
        throw "Internal error";
      }
    }
    return e;
  }

  @override
  void dispose() {
    _datasource.dispose();
  }
}
