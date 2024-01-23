import 'dart:async';

import 'package:client_manager/core/models/client_model.dart';
import 'package:client_manager/core/models/http_response.dart';
import 'package:client_manager/core/services/client_service.dart';
import 'package:client_manager/core/utils/debouncer.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  List<ClientModel> clients = [];
  List<ClientModel> searchResult = [];
  Map<String, List<String>> selectedTags = {};
  final _debouncer = Debouncer(miliseconds: 500);

  final service = ClientService();

  // HttpResponse
  Future<void> searchClient(String text) async {
    final completer = Completer<HttpResponse>();

    _debouncer.run(() async {
      final httpResponse = await service.loadAllAndSearchClients(text);
      completer.complete(httpResponse);
    });
    List<ClientModel> result =
        await completer.future.then((value) => value.data);

    if (text.isEmpty) {
      searchResult = List.from(clients);
    } else {
      searchResult = result;
    }

    notifyListeners();
  }

  Future<HttpResponse> addClients(String name, String email) async {
    final tags = getSelectedTags();

    final client = ClientModel(name: name, email: email, tags: tags);
    final result = await service.addClient(client);

    if (result.statusCode == 200) {
      clients.add(ClientModel.fromMap(result.data));
      selectedTags.clear();
      notifyListeners();
    }

    return result;
  }

  Future<HttpResponse> removeClient(int id) async {
    final response = await service.removeClient(id);

    if (response.statusCode == 200) {
      clients.removeWhere((client) => client.id == id);
      notifyListeners();
    }

    return response;
  }

  Future<void> loadAllClients() async {
    final response = await service.loadAllAndSearchClients(null);
    clients.addAll(response.data);
    searchResult = clients;
    notifyListeners();
  }

  Future<HttpResponse> editClient(ClientModel? client, int indexList) async {
    ClientModel selectedClient = clients[indexList].copyWith(
      id: client?.id ?? clients[indexList].id,
      name: client?.name ?? clients[indexList].name,
      email: client?.email ?? clients[indexList].email,
      tags: client?.tags ?? clients[indexList].tags,
    );
    final response = await service.editClient(selectedClient);

    if (response.statusCode == 200) {
      clients[indexList] = ClientModel.fromMap(response.data);
      notifyListeners();
    }

    return response;
  }

  void selectTag(String category, String tag) {
    if (!selectedTags.containsKey(category)) {
      selectedTags[category] = [];
    }

    if (selectedTags[category]!.contains(tag)) {
      selectedTags[category]!.remove(tag);
    } else if (category == 'Comunicação Preferida' ||
        selectedTags[category]!.isEmpty) {
      selectedTags[category]!.add(tag);
    } else {
      selectedTags[category] = [tag];
    }
    notifyListeners();
  }

  List<String> getSelectedTags() {
    return selectedTags.values.isNotEmpty
        ? selectedTags.values.reduce((value, el) => value + el)
        : <String>[];
  }
}
