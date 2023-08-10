import 'dart:convert';

import 'package:course_player/src/source_input/models/response_messages_model.dart';
import 'package:dio/dio.dart';

class SourceInputRepository {
  Future<ResponseMessagesModel> getMessages(String source) async {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: source,
        connectTimeout: const Duration(seconds: 5),
      ),
    );

    final options = Options(
      method: r'GET',
    );

    final resp = await dio.request(
      "",
      options: options,
    );

    return ResponseMessagesModel.jsonFactory(resp.data);
  }
}
