import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import '../models/api_res.dart';

class MyApi {
  static final dio = Dio();
  final dioAdapter = DioAdapter(dio: dio);

  Future<ApiRes> test({
    required String user,
    required String password
  }) async {
    dio.httpClientAdapter = dioAdapter;

    const path = 'https://example.com';

    dioAdapter.onGet(
      path,
      (request) => request.reply(
        200,
        user == "test@api.com" && password == "12345" ? {"ok": true, "message": ""} : {"ok": false, "message": "Usuário e/ou senha incorretos"},
        delay: const Duration(seconds: 3)
      ),
    );

    final response = await dio.get(path);

    final data = ApiRes.fromJson(response.data);
    return data;
  }
}
