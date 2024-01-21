import 'package:client_manager/core/models/client_model.dart';
import 'package:client_manager/core/models/http_response.dart';
import 'package:client_manager/core/services/client_service_impl.dart';

abstract class ClientService {
  Future<HttpResponse> addClient(ClientModel clientModel);
  Future<HttpResponse> removeClient(int index);
  Future<HttpResponse> loadAllAndSearchClients(String? text);
  Future<HttpResponse> editClient(ClientModel selectedClient);

  factory ClientService() {
    return ClientServiceImpl();
  }
}
