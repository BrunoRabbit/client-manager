import 'dart:convert';

import 'package:client_manager/core/models/client_model.dart';
import 'package:client_manager/core/models/http_response.dart';
import 'package:client_manager/core/services/client_service.dart';
import 'package:client_manager/core/utils/http_util.dart';

class ClientServiceImpl implements ClientService {
  static const String url = "http://SeuIP:3000/api/client";
  final HttpUtil http = HttpUtil();

  @override
  Future<HttpResponse> addClient(ClientModel clientModel) async {
    final Map<String, dynamic> response = await http
        .post(url: url, body: clientModel.toJson())
        .then((value) => json.decode(value.body));

    if (response['message'] != null) {
      return HttpResponse(response['message'], response['status_code']);
    }

    return HttpResponse(response['data'], response['status_code']);
  }

  @override
  Future<HttpResponse> removeClient(int id) async {
    final response = await http.delete(url: "$url/$id").then(
          (value) => json.decode(value.body),
        );

    if (response['message'] != null) {
      return HttpResponse(response['message'], response['status_code']);
    }

    return HttpResponse(null, response['status_code']);
  }

  @override
  Future<HttpResponse> loadAllAndSearchClients(String? text) async {
    final queryUrl = "$url?${text != null ? "name=$text" : ""}";
    final response = await http.get(url: queryUrl).then(
          (value) => json.decode(value.body),
        );
    if (response['message'] != null) {
      print(response);
      return HttpResponse(response['message'], response['status_code']);
    }

    final responseData = List<Map<String, dynamic>>.from(response["data"]);

    final client = responseData
        .map((clientModel) => ClientModel.fromMap(clientModel))
        .toList();
    return HttpResponse(client, response['status_code']);
  }

  @override
  Future<HttpResponse> editClient(ClientModel selectedClient) async {
    final id = selectedClient.id;
    final jsonObj = jsonEncode({
      "name": selectedClient.name,
      "email": selectedClient.email,
      "tags": selectedClient.tags.join(';'),
    });

    final response = await http
        .put(url: "$url/$id", body: jsonObj)
        .then((value) => json.decode(value.body));

    if (response['message'] != null) {
      return HttpResponse(response['message'], response['status_code']);
    }

    return HttpResponse(response['data'], response['status_code']);
  }
}
