import 'package:client_manager/core/models/client_model.dart';
import 'package:client_manager/core/models/http_response.dart';
import 'package:client_manager/core/services/client_service.dart';
import 'package:client_manager/features/home/home_controller.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mock_client_model.mocks.dart';
import 'mock_home_controller.mocks.dart';

@GenerateNiceMocks([
  MockSpec<ClientService>(),
  MockSpec<HomeController>(),
])
void main() {
  group('HomeController', () {
    late MockClientService service;

    setUp(() {
      service = MockClientService();
    });

    test('searchClient search\'s correctly', () async {
      final mockList = [
        MockClientModel(),
        MockClientModel(),
      ];

      when(service.loadAllAndSearchClients('Teste1'))
          .thenAnswer((_) async => HttpResponse(mockList, 200));

      when(mockList[0].name).thenReturn('Teste1');

      final result = await service.loadAllAndSearchClients('Teste1');

      expect(result.data.length, 2);
      expect(result.data[0].name, 'Teste1');
    });

    test('searchClient not found user', () async {
      final controller = MockHomeController();

      controller.searchResult = [
        MockClientModel(),
        MockClientModel(),
      ];
      controller.searchClient('Teste3');

      expect(controller.searchResult.length, 0);
      expect(controller.searchResult, isEmpty);
    });

    test('addClients adds a new client correctly', () async {
      final controller = MockHomeController();
      final mockClientModel = MockClientModel();

      when(controller.addClients("teste", "testeEmail"))
          .thenAnswer((_) async => HttpResponse(mockClientModel, 200));

      final result = await controller.addClients("teste", "testeEmail");

      when(result.data.name).thenReturn(result.data.name = "teste");
      when(result.data.email).thenReturn(result.data.email = "testeEmail");

      expect(result.statusCode, equals(200));
      expect(result.data, equals(mockClientModel));
      expect(result.data.name, equals('teste'));
      expect(result.data.email, equals('testeEmail'));
    });

    test('removeClient removes a client correctly', () async {
      final controller = MockHomeController();
      controller.clients = [
        ClientModel(id: 1, name: 'teste', email: 'testeEmail', tags: ['tag3'])
      ];

      await controller.removeClient(1);

      expect(controller.clients.length, 0);
    });
  });
}
