import 'dart:convert';
import 'package:http/http.dart' show Client;

import '../../../core/core.dart';

abstract class IFeedbackApi {
  Future<String> sendFeedback(String comment, String screenshot, String type);
  void dispose();
}

class FeedbackApi implements IFeedbackApi {
  final Client client = Client();
  final String server = UtilsConst.server;

  @override
  void dispose() {
    client.close();
  }

  @override
  Future<String> sendFeedback(
      String comment, String screenshot, String type) async {
    try {
      final response = await client
          .post(
            Uri.parse(server + "feedbacks"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              'comment': comment,
              'type': type,
              'screenshot': "data:image/png;base64," + screenshot,
            }),
          )
          .timeout(const Duration(seconds: 10));

      print(response.body);
      if (response.statusCode == 201 || response.statusCode == 200) {
        return response.body;
      } else if (response.statusCode == 400 || response.statusCode == 401) {
        throw json.decode(response.body);
      } else {
        throw "Erro na conexão da API (Status: ${response.statusCode})";
      }
    } catch (e) {
      rethrow;
    }
  }
}
