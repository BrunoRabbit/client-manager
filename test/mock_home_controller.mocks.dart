// Mocks generated by Mockito 5.4.4 from annotations
// in client_manager/test/mock_home_controller.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:ui' as _i7;

import 'package:client_manager/core/models/client_model.dart' as _i5;
import 'package:client_manager/core/models/http_response.dart' as _i2;
import 'package:client_manager/core/services/client_service.dart' as _i3;
import 'package:client_manager/features/home/home_controller.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeHttpResponse_0 extends _i1.SmartFake implements _i2.HttpResponse {
  _FakeHttpResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeClientService_1 extends _i1.SmartFake implements _i3.ClientService {
  _FakeClientService_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ClientService].
///
/// See the documentation for Mockito's code generation for more information.
class MockClientService extends _i1.Mock implements _i3.ClientService {
  @override
  _i4.Future<_i2.HttpResponse> addClient(_i5.ClientModel? clientModel) =>
      (super.noSuchMethod(
        Invocation.method(
          #addClient,
          [clientModel],
        ),
        returnValue: _i4.Future<_i2.HttpResponse>.value(_FakeHttpResponse_0(
          this,
          Invocation.method(
            #addClient,
            [clientModel],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.HttpResponse>.value(_FakeHttpResponse_0(
          this,
          Invocation.method(
            #addClient,
            [clientModel],
          ),
        )),
      ) as _i4.Future<_i2.HttpResponse>);

  @override
  _i4.Future<_i2.HttpResponse> removeClient(int? index) => (super.noSuchMethod(
        Invocation.method(
          #removeClient,
          [index],
        ),
        returnValue: _i4.Future<_i2.HttpResponse>.value(_FakeHttpResponse_0(
          this,
          Invocation.method(
            #removeClient,
            [index],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.HttpResponse>.value(_FakeHttpResponse_0(
          this,
          Invocation.method(
            #removeClient,
            [index],
          ),
        )),
      ) as _i4.Future<_i2.HttpResponse>);

  @override
  _i4.Future<_i2.HttpResponse> loadAllAndSearchClients(String? text) =>
      (super.noSuchMethod(
        Invocation.method(
          #loadAllAndSearchClients,
          [text],
        ),
        returnValue: _i4.Future<_i2.HttpResponse>.value(_FakeHttpResponse_0(
          this,
          Invocation.method(
            #loadAllAndSearchClients,
            [text],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.HttpResponse>.value(_FakeHttpResponse_0(
          this,
          Invocation.method(
            #loadAllAndSearchClients,
            [text],
          ),
        )),
      ) as _i4.Future<_i2.HttpResponse>);

  @override
  _i4.Future<_i2.HttpResponse> editClient(_i5.ClientModel? selectedClient) =>
      (super.noSuchMethod(
        Invocation.method(
          #editClient,
          [selectedClient],
        ),
        returnValue: _i4.Future<_i2.HttpResponse>.value(_FakeHttpResponse_0(
          this,
          Invocation.method(
            #editClient,
            [selectedClient],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.HttpResponse>.value(_FakeHttpResponse_0(
          this,
          Invocation.method(
            #editClient,
            [selectedClient],
          ),
        )),
      ) as _i4.Future<_i2.HttpResponse>);
}

/// A class which mocks [HomeController].
///
/// See the documentation for Mockito's code generation for more information.
class MockHomeController extends _i1.Mock implements _i6.HomeController {
  @override
  List<_i5.ClientModel> get clients => (super.noSuchMethod(
        Invocation.getter(#clients),
        returnValue: <_i5.ClientModel>[],
        returnValueForMissingStub: <_i5.ClientModel>[],
      ) as List<_i5.ClientModel>);

  @override
  set clients(List<_i5.ClientModel>? _clients) => super.noSuchMethod(
        Invocation.setter(
          #clients,
          _clients,
        ),
        returnValueForMissingStub: null,
      );

  @override
  List<_i5.ClientModel> get searchResult => (super.noSuchMethod(
        Invocation.getter(#searchResult),
        returnValue: <_i5.ClientModel>[],
        returnValueForMissingStub: <_i5.ClientModel>[],
      ) as List<_i5.ClientModel>);

  @override
  set searchResult(List<_i5.ClientModel>? _searchResult) => super.noSuchMethod(
        Invocation.setter(
          #searchResult,
          _searchResult,
        ),
        returnValueForMissingStub: null,
      );

  @override
  Map<String, List<String>> get selectedTags => (super.noSuchMethod(
        Invocation.getter(#selectedTags),
        returnValue: <String, List<String>>{},
        returnValueForMissingStub: <String, List<String>>{},
      ) as Map<String, List<String>>);

  @override
  set selectedTags(Map<String, List<String>>? _selectedTags) =>
      super.noSuchMethod(
        Invocation.setter(
          #selectedTags,
          _selectedTags,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i3.ClientService get service => (super.noSuchMethod(
        Invocation.getter(#service),
        returnValue: _FakeClientService_1(
          this,
          Invocation.getter(#service),
        ),
        returnValueForMissingStub: _FakeClientService_1(
          this,
          Invocation.getter(#service),
        ),
      ) as _i3.ClientService);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  _i4.Future<void> searchClient(String? text) => (super.noSuchMethod(
        Invocation.method(
          #searchClient,
          [text],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<_i2.HttpResponse> addClients(
    String? name,
    String? email,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addClients,
          [
            name,
            email,
          ],
        ),
        returnValue: _i4.Future<_i2.HttpResponse>.value(_FakeHttpResponse_0(
          this,
          Invocation.method(
            #addClients,
            [
              name,
              email,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.HttpResponse>.value(_FakeHttpResponse_0(
          this,
          Invocation.method(
            #addClients,
            [
              name,
              email,
            ],
          ),
        )),
      ) as _i4.Future<_i2.HttpResponse>);

  @override
  _i4.Future<_i2.HttpResponse> removeClient(int? id) => (super.noSuchMethod(
        Invocation.method(
          #removeClient,
          [id],
        ),
        returnValue: _i4.Future<_i2.HttpResponse>.value(_FakeHttpResponse_0(
          this,
          Invocation.method(
            #removeClient,
            [id],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.HttpResponse>.value(_FakeHttpResponse_0(
          this,
          Invocation.method(
            #removeClient,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.HttpResponse>);

  @override
  _i4.Future<void> loadAllClients() => (super.noSuchMethod(
        Invocation.method(
          #loadAllClients,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<_i2.HttpResponse> editClient(
    _i5.ClientModel? client,
    int? indexList,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #editClient,
          [
            client,
            indexList,
          ],
        ),
        returnValue: _i4.Future<_i2.HttpResponse>.value(_FakeHttpResponse_0(
          this,
          Invocation.method(
            #editClient,
            [
              client,
              indexList,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.HttpResponse>.value(_FakeHttpResponse_0(
          this,
          Invocation.method(
            #editClient,
            [
              client,
              indexList,
            ],
          ),
        )),
      ) as _i4.Future<_i2.HttpResponse>);

  @override
  void selectTag(
    String? category,
    String? tag,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #selectTag,
          [
            category,
            tag,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  List<String> getSelectedTags() => (super.noSuchMethod(
        Invocation.method(
          #getSelectedTags,
          [],
        ),
        returnValue: <String>[],
        returnValueForMissingStub: <String>[],
      ) as List<String>);

  @override
  void addListener(_i7.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i7.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}