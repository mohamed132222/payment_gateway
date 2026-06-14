import 'package:dio/dio.dart';

class StripApiServices {
  final Dio dio = Dio();

  Future<Response> post({
    required String url,
    required Map<String, dynamic> data,
    required String token,
    String? contentType,
    Map<String, String>? headers,
  }) async {
    var response = await dio.post(
      url,
      data: data,
      options: Options(
        headers:
            headers ??
            {
              'Content-Type': Headers.formUrlEncodedContentType,
              'Authorization': 'Bearer $token',
            },
      ),
    );
    return response;
  }
}
