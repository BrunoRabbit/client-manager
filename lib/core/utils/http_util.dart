import 'package:http/http.dart' as http;

abstract class HttpUtil {
  Future get({
    required String url,
    Map<String, String>? headers = const {'Content-Type': 'application/json'},
  });

  Future post({
    required String url,
    Map<String, String>? headers = const {'Content-Type': 'application/json'},
    Object? body,
  });

  Future delete({
    required String url,
    Map<String, String>? headers = const {'Content-Type': 'application/json'},
  });

  Future put({
    required String url,
    Map<String, String>? headers = const {'Content-Type': 'application/json'},
    Object? body,
  });

  http.Response onTimeout();

  factory HttpUtil() {
    return HttpUtilImpl();
  }
}

class HttpUtilImpl implements HttpUtil {
  @override
  Future get({
    required String url,
    Map<String, String>? headers = const {'Content-Type': 'application/json'},
  }) async {
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    return response;
  }

  @override
  Future post({
    required String url,
    Map<String, String>? headers = const {'Content-Type': 'application/json'},
    Object? body,
  }) async {
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    return response;
  }

  @override
  Future delete({
    required String url,
    Map<String, String>? headers = const {'Content-Type': 'application/json'},
  }) async {
    final response = await http.delete(
      Uri.parse(url),
      headers: headers,
    );

    return response;
  }

  @override
  Future put({
    required String url,
    Map<String, String>? headers = const {'Content-Type': 'application/json'},
    Object? body,
  }) async {
    final response = await http.put(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    return response;
  }

  @override
  http.Response onTimeout() {
    return http.Response('Connection timeout', 408);
  }
}