import 'package:client_manager/core/models/client_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'mock_client_model.mocks.dart';

@GenerateNiceMocks([
  MockSpec<ClientModel>(),
])
void main() {
  group('ClientModel', () {
    test('toJson returns a valid JSON string', () {
      final clientModel = MockClientModel();

      when(clientModel.toJson()).thenAnswer((_) => "{jsonString}");

      expect(clientModel.toJson(), "{jsonString}");
    });

    test('copyWith creates a new instance with updated values', () {
      final mockUpdatedClient = MockClientModel();

      when(mockUpdatedClient.copyWith(name: 'updated', email: 'oldEmail', tags: ['tag6']))
          .thenAnswer((_) => mockUpdatedClient);

      when(mockUpdatedClient.name).thenReturn('updated');
      when(mockUpdatedClient.email).thenReturn('oldEmail');
      when(mockUpdatedClient.tags).thenReturn(['tag6']);

      expect(mockUpdatedClient.id, null);
      expect(mockUpdatedClient.name, equals('updated'));
      expect(mockUpdatedClient.email, equals('oldEmail'));
      expect(mockUpdatedClient.tags, ['tag6']);

    });

    test('toMap returns a valid map', () {
      final clientModel = MockClientModel();

      when(clientModel.toMap()).thenAnswer((_) => {});

      expect(clientModel.toMap(), isA<Map<String, dynamic>>());
    });
  });
}
