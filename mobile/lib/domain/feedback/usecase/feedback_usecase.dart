import '../repository/feedback_repository.dart';

abstract class IFeedbackUseCase {
  Future<void> sendFeedback(String comment, String screenshot, String type);
  void dispose();
}

class FeedbackUseCase implements IFeedbackUseCase {
  final IFeedbackRepository _repository;

  FeedbackUseCase({IFeedbackRepository? repository})
      : _repository = repository ?? FeedbackRepository();

  @override
  Future<void> sendFeedback(
      String comment, String screenshot, String type) async {
    try {
      await _repository.sendFeedback(comment, screenshot, type);
    } catch (e) {
      rethrow;
    }
  }

  @override
  void dispose() {
    _repository.dispose();
  }
}
