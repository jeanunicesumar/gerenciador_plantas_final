// Mocks generated by Mockito 5.4.4 from annotations
// in gerenciador_planta/test/service/planta_service_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:gerenciador_planta/core/http_client.dart' as _i2;
import 'package:gerenciador_planta/models/planta.dart' as _i3;
import 'package:gerenciador_planta/service/planta_service.dart' as _i4;
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

class _FakeIHttpClient_0 extends _i1.SmartFake implements _i2.IHttpClient {
  _FakeIHttpClient_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePlanta_1 extends _i1.SmartFake implements _i3.Planta {
  _FakePlanta_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PlantaService].
///
/// See the documentation for Mockito's code generation for more information.
class MockPlantaService extends _i1.Mock implements _i4.PlantaService {
  @override
  _i2.IHttpClient get httpClient => (super.noSuchMethod(
        Invocation.getter(#httpClient),
        returnValue: _FakeIHttpClient_0(
          this,
          Invocation.getter(#httpClient),
        ),
        returnValueForMissingStub: _FakeIHttpClient_0(
          this,
          Invocation.getter(#httpClient),
        ),
      ) as _i2.IHttpClient);

  @override
  _i5.Future<List<_i3.Planta>> fetch() => (super.noSuchMethod(
        Invocation.method(
          #fetch,
          [],
        ),
        returnValue: _i5.Future<List<_i3.Planta>>.value(<_i3.Planta>[]),
        returnValueForMissingStub:
            _i5.Future<List<_i3.Planta>>.value(<_i3.Planta>[]),
      ) as _i5.Future<List<_i3.Planta>>);

  @override
  _i5.Future<_i3.Planta> fetchById(String? id) => (super.noSuchMethod(
        Invocation.method(
          #fetchById,
          [id],
        ),
        returnValue: _i5.Future<_i3.Planta>.value(_FakePlanta_1(
          this,
          Invocation.method(
            #fetchById,
            [id],
          ),
        )),
        returnValueForMissingStub: _i5.Future<_i3.Planta>.value(_FakePlanta_1(
          this,
          Invocation.method(
            #fetchById,
            [id],
          ),
        )),
      ) as _i5.Future<_i3.Planta>);

  @override
  _i5.Future<bool> insert(_i3.Planta? planta) => (super.noSuchMethod(
        Invocation.method(
          #insert,
          [planta],
        ),
        returnValue: _i5.Future<bool>.value(false),
        returnValueForMissingStub: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  _i5.Future<bool> update(_i3.Planta? planta) => (super.noSuchMethod(
        Invocation.method(
          #update,
          [planta],
        ),
        returnValue: _i5.Future<bool>.value(false),
        returnValueForMissingStub: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  _i5.Future<bool> delete(String? id) => (super.noSuchMethod(
        Invocation.method(
          #delete,
          [id],
        ),
        returnValue: _i5.Future<bool>.value(false),
        returnValueForMissingStub: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
}