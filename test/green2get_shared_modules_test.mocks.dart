// Mocks generated by Mockito 5.4.3 from annotations
// in green2get_shared_modules/test/green2get_shared_modules_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:typed_data' as _i5;
import 'dart:ui' as _i9;

import 'package:get/get.dart' as _i2;
import 'package:get/get_state_manager/src/simple/list_notifier.dart' as _i8;
import 'package:green2get_shared_modules/modules/__test__/test/logic/picsum_photos_instructions.dart'
    as _i3;
import 'package:green2get_shared_modules/modules/__test__/test/models/picsum_photos_models.dart'
    as _i6;
import 'package:green2get_shared_modules/modules/__test__/test_02/models/picsum_photos_models.dart'
    as _i10;
import 'package:mockito/mockito.dart' as _i1;

import 'modules/__test__/controllers/app_controller.dart' as _i7;

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

class _FakeInternalFinalCallback_0<T> extends _i1.SmartFake
    implements _i2.InternalFinalCallback<T> {
  _FakeInternalFinalCallback_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [PicsumPhotosInstructions].
///
/// See the documentation for Mockito's code generation for more information.
class MockPicsumPhotosInstructions extends _i1.Mock
    implements _i3.PicsumPhotosInstructions {
  MockPicsumPhotosInstructions() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i5.Uint8List?> getPicsumImageBytes({
    required int? width,
    int? height,
    int? id,
    String? randomSeed,
    bool? grayscale,
    int? blur,
    String? fileType,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPicsumImageBytes,
          [],
          {
            #width: width,
            #height: height,
            #id: id,
            #randomSeed: randomSeed,
            #grayscale: grayscale,
            #blur: blur,
            #fileType: fileType,
          },
        ),
        returnValue: _i4.Future<_i5.Uint8List?>.value(),
      ) as _i4.Future<_i5.Uint8List?>);

  @override
  _i4.Future<_i6.PicsumPhotosItemList?> getPicsumImageList({
    int? page,
    int? limit,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPicsumImageList,
          [],
          {
            #page: page,
            #limit: limit,
          },
        ),
        returnValue: _i4.Future<_i6.PicsumPhotosItemList?>.value(),
      ) as _i4.Future<_i6.PicsumPhotosItemList?>);
}

/// A class which mocks [AppController].
///
/// See the documentation for Mockito's code generation for more information.
class MockAppController extends _i1.Mock implements _i7.AppController {
  @override
  _i2.InternalFinalCallback<void> get onStart => (super.noSuchMethod(
        Invocation.getter(#onStart),
        returnValue: _FakeInternalFinalCallback_0<void>(
          this,
          Invocation.getter(#onStart),
        ),
        returnValueForMissingStub: _FakeInternalFinalCallback_0<void>(
          this,
          Invocation.getter(#onStart),
        ),
      ) as _i2.InternalFinalCallback<void>);

  @override
  _i2.InternalFinalCallback<void> get onDelete => (super.noSuchMethod(
        Invocation.getter(#onDelete),
        returnValue: _FakeInternalFinalCallback_0<void>(
          this,
          Invocation.getter(#onDelete),
        ),
        returnValueForMissingStub: _FakeInternalFinalCallback_0<void>(
          this,
          Invocation.getter(#onDelete),
        ),
      ) as _i2.InternalFinalCallback<void>);

  @override
  bool get initialized => (super.noSuchMethod(
        Invocation.getter(#initialized),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  int get listeners => (super.noSuchMethod(
        Invocation.getter(#listeners),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);

  @override
  void update([
    List<Object>? ids,
    bool? condition = true,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #update,
          [
            ids,
            condition,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onInit() => super.noSuchMethod(
        Invocation.method(
          #onInit,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onReady() => super.noSuchMethod(
        Invocation.method(
          #onReady,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onClose() => super.noSuchMethod(
        Invocation.method(
          #onClose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void $configureLifeCycle() => super.noSuchMethod(
        Invocation.method(
          #$configureLifeCycle,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i8.Disposer addListener(_i8.GetStateUpdate? listener) => (super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValue: () {},
        returnValueForMissingStub: () {},
      ) as _i8.Disposer);

  @override
  void removeListener(_i9.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void refresh() => super.noSuchMethod(
        Invocation.method(
          #refresh,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void refreshGroup(Object? id) => super.noSuchMethod(
        Invocation.method(
          #refreshGroup,
          [id],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyChildrens() => super.noSuchMethod(
        Invocation.method(
          #notifyChildrens,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListenerId(
    Object? id,
    _i9.VoidCallback? listener,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #removeListenerId,
          [
            id,
            listener,
          ],
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
  _i8.Disposer addListenerId(
    Object? key,
    _i8.GetStateUpdate? listener,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addListenerId,
          [
            key,
            listener,
          ],
        ),
        returnValue: () {},
        returnValueForMissingStub: () {},
      ) as _i8.Disposer);

  @override
  void disposeId(Object? id) => super.noSuchMethod(
        Invocation.method(
          #disposeId,
          [id],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.Future<_i5.Uint8List?> getPicsumImageBytes({
    required int? width,
    int? height,
    int? id,
    String? randomSeed,
    bool? grayscale,
    int? blur,
    String? fileType,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPicsumImageBytes,
          [],
          {
            #width: width,
            #height: height,
            #id: id,
            #randomSeed: randomSeed,
            #grayscale: grayscale,
            #blur: blur,
            #fileType: fileType,
          },
        ),
        returnValue: _i4.Future<_i5.Uint8List?>.value(),
        returnValueForMissingStub: _i4.Future<_i5.Uint8List?>.value(),
      ) as _i4.Future<_i5.Uint8List?>);

  @override
  _i4.Future<_i10.PicsumPhotosItemList?> getPicsumImageList({
    int? page,
    int? limit,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPicsumImageList,
          [],
          {
            #page: page,
            #limit: limit,
          },
        ),
        returnValue: _i4.Future<_i10.PicsumPhotosItemList?>.value(),
        returnValueForMissingStub:
            _i4.Future<_i10.PicsumPhotosItemList?>.value(),
      ) as _i4.Future<_i10.PicsumPhotosItemList?>);
}
