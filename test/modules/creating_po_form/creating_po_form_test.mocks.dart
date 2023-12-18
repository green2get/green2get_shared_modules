// Mocks generated by Mockito 5.4.3 from annotations
// in green2get_shared_modules/test/modules/creating_po_form/creating_po_form_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;
import 'dart:ui' as _i10;

import 'package:flutter/services.dart' as _i4;
import 'package:flutter/widgets.dart' as _i3;
import 'package:get/get.dart' as _i2;
import 'package:get/get_state_manager/src/simple/list_notifier.dart' as _i9;
import 'package:green2get_shared_modules/green2get_shared_modules.dart' as _i7;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i6;

import 'controllers/creating_po_form_controller.dart' as _i5;

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

class _FakeTextEditingController_1 extends _i1.SmartFake
    implements _i3.TextEditingController {
  _FakeTextEditingController_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTextInputFormatter_2 extends _i1.SmartFake
    implements _i4.TextInputFormatter {
  _FakeTextInputFormatter_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [CreatingPoFormController].
///
/// See the documentation for Mockito's code generation for more information.
class MockCreatingPoFormController extends _i1.Mock
    implements _i5.CreatingPoFormController {
  @override
  double get maximumPricePerUnit => (super.noSuchMethod(
        Invocation.getter(#maximumPricePerUnit),
        returnValue: 0.0,
        returnValueForMissingStub: 0.0,
      ) as double);

  @override
  double get maximumTotalAcceptedAmount => (super.noSuchMethod(
        Invocation.getter(#maximumTotalAcceptedAmount),
        returnValue: 0.0,
        returnValueForMissingStub: 0.0,
      ) as double);

  @override
  int get remainingCoins => (super.noSuchMethod(
        Invocation.getter(#remainingCoins),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);

  @override
  String get unit => (super.noSuchMethod(
        Invocation.getter(#unit),
        returnValue: _i6.dummyValue<String>(
          this,
          Invocation.getter(#unit),
        ),
        returnValueForMissingStub: _i6.dummyValue<String>(
          this,
          Invocation.getter(#unit),
        ),
      ) as String);

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
  _i7.CreatingPoFormType get type => (super.noSuchMethod(
        Invocation.getter(#type),
        returnValue: _i7.CreatingPoFormType.freeToSell,
        returnValueForMissingStub: _i7.CreatingPoFormType.freeToSell,
      ) as _i7.CreatingPoFormType);

  @override
  bool get confirmButtonEnabled => (super.noSuchMethod(
        Invocation.getter(#confirmButtonEnabled),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  bool get taxPriceIncluded => (super.noSuchMethod(
        Invocation.getter(#taxPriceIncluded),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  bool get vehiclePictureRequired => (super.noSuchMethod(
        Invocation.getter(#vehiclePictureRequired),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  bool get weighingSlipRequired => (super.noSuchMethod(
        Invocation.getter(#weighingSlipRequired),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  bool get onlyFollowingCustomersAccepted => (super.noSuchMethod(
        Invocation.getter(#onlyFollowingCustomersAccepted),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  bool get aggreementAccepted => (super.noSuchMethod(
        Invocation.getter(#aggreementAccepted),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  String get details => (super.noSuchMethod(
        Invocation.getter(#details),
        returnValue: _i6.dummyValue<String>(
          this,
          Invocation.getter(#details),
        ),
        returnValueForMissingStub: _i6.dummyValue<String>(
          this,
          Invocation.getter(#details),
        ),
      ) as String);

  @override
  _i3.TextEditingController get totalAcceptedAmountController =>
      (super.noSuchMethod(
        Invocation.getter(#totalAcceptedAmountController),
        returnValue: _FakeTextEditingController_1(
          this,
          Invocation.getter(#totalAcceptedAmountController),
        ),
        returnValueForMissingStub: _FakeTextEditingController_1(
          this,
          Invocation.getter(#totalAcceptedAmountController),
        ),
      ) as _i3.TextEditingController);

  @override
  _i3.TextEditingController get minimumAmountPerRoundController =>
      (super.noSuchMethod(
        Invocation.getter(#minimumAmountPerRoundController),
        returnValue: _FakeTextEditingController_1(
          this,
          Invocation.getter(#minimumAmountPerRoundController),
        ),
        returnValueForMissingStub: _FakeTextEditingController_1(
          this,
          Invocation.getter(#minimumAmountPerRoundController),
        ),
      ) as _i3.TextEditingController);

  @override
  _i3.TextEditingController get pricePerUnitController => (super.noSuchMethod(
        Invocation.getter(#pricePerUnitController),
        returnValue: _FakeTextEditingController_1(
          this,
          Invocation.getter(#pricePerUnitController),
        ),
        returnValueForMissingStub: _FakeTextEditingController_1(
          this,
          Invocation.getter(#pricePerUnitController),
        ),
      ) as _i3.TextEditingController);

  @override
  _i3.TextEditingController get usedCoinsController => (super.noSuchMethod(
        Invocation.getter(#usedCoinsController),
        returnValue: _FakeTextEditingController_1(
          this,
          Invocation.getter(#usedCoinsController),
        ),
        returnValueForMissingStub: _FakeTextEditingController_1(
          this,
          Invocation.getter(#usedCoinsController),
        ),
      ) as _i3.TextEditingController);

  @override
  _i3.TextEditingController get detailsController => (super.noSuchMethod(
        Invocation.getter(#detailsController),
        returnValue: _FakeTextEditingController_1(
          this,
          Invocation.getter(#detailsController),
        ),
        returnValueForMissingStub: _FakeTextEditingController_1(
          this,
          Invocation.getter(#detailsController),
        ),
      ) as _i3.TextEditingController);

  @override
  _i4.TextInputFormatter get usedCoinsFormatter => (super.noSuchMethod(
        Invocation.getter(#usedCoinsFormatter),
        returnValue: _FakeTextInputFormatter_2(
          this,
          Invocation.getter(#usedCoinsFormatter),
        ),
        returnValueForMissingStub: _FakeTextInputFormatter_2(
          this,
          Invocation.getter(#usedCoinsFormatter),
        ),
      ) as _i4.TextInputFormatter);

  @override
  _i4.TextInputFormatter get totalAcceptedAmountFormatter =>
      (super.noSuchMethod(
        Invocation.getter(#totalAcceptedAmountFormatter),
        returnValue: _FakeTextInputFormatter_2(
          this,
          Invocation.getter(#totalAcceptedAmountFormatter),
        ),
        returnValueForMissingStub: _FakeTextInputFormatter_2(
          this,
          Invocation.getter(#totalAcceptedAmountFormatter),
        ),
      ) as _i4.TextInputFormatter);

  @override
  _i4.TextInputFormatter get minimumAmountPerRoundFormatter =>
      (super.noSuchMethod(
        Invocation.getter(#minimumAmountPerRoundFormatter),
        returnValue: _FakeTextInputFormatter_2(
          this,
          Invocation.getter(#minimumAmountPerRoundFormatter),
        ),
        returnValueForMissingStub: _FakeTextInputFormatter_2(
          this,
          Invocation.getter(#minimumAmountPerRoundFormatter),
        ),
      ) as _i4.TextInputFormatter);

  @override
  _i4.TextInputFormatter get pricePerUnitFormatter => (super.noSuchMethod(
        Invocation.getter(#pricePerUnitFormatter),
        returnValue: _FakeTextInputFormatter_2(
          this,
          Invocation.getter(#pricePerUnitFormatter),
        ),
        returnValueForMissingStub: _FakeTextInputFormatter_2(
          this,
          Invocation.getter(#pricePerUnitFormatter),
        ),
      ) as _i4.TextInputFormatter);

  @override
  void onClose() => super.noSuchMethod(
        Invocation.method(
          #onClose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i8.Future<dynamic> submit({
    void Function(dynamic)? onSuccessful,
    void Function()? onFailed,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #submit,
          [],
          {
            #onSuccessful: onSuccessful,
            #onFailed: onFailed,
          },
        ),
        returnValue: _i8.Future<dynamic>.value(),
        returnValueForMissingStub: _i8.Future<dynamic>.value(),
      ) as _i8.Future<dynamic>);

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
  void $configureLifeCycle() => super.noSuchMethod(
        Invocation.method(
          #$configureLifeCycle,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i9.Disposer addListener(_i9.GetStateUpdate? listener) => (super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValue: () {},
        returnValueForMissingStub: () {},
      ) as _i9.Disposer);

  @override
  void removeListener(_i10.VoidCallback? listener) => super.noSuchMethod(
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
    _i10.VoidCallback? listener,
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
  _i9.Disposer addListenerId(
    Object? key,
    _i9.GetStateUpdate? listener,
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
      ) as _i9.Disposer);

  @override
  void disposeId(Object? id) => super.noSuchMethod(
        Invocation.method(
          #disposeId,
          [id],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void disposeAllCreatingPoFormResources() => super.noSuchMethod(
        Invocation.method(
          #disposeAllCreatingPoFormResources,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setType(_i7.CreatingPoFormType? type) => super.noSuchMethod(
        Invocation.method(
          #setType,
          [type],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void toggleAgreementAccepted() => super.noSuchMethod(
        Invocation.method(
          #toggleAgreementAccepted,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void toggleOnlyFollowingCustomersAccepted() => super.noSuchMethod(
        Invocation.method(
          #toggleOnlyFollowingCustomersAccepted,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void toggleWeighingSlipRequired() => super.noSuchMethod(
        Invocation.method(
          #toggleWeighingSlipRequired,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void toggleVehiclePictureRequired() => super.noSuchMethod(
        Invocation.method(
          #toggleVehiclePictureRequired,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void toggleTaxPriceIncluded() => super.noSuchMethod(
        Invocation.method(
          #toggleTaxPriceIncluded,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setStartDate(DateTime? date) => super.noSuchMethod(
        Invocation.method(
          #setStartDate,
          [date],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setEndDate(DateTime? date) => super.noSuchMethod(
        Invocation.method(
          #setEndDate,
          [date],
        ),
        returnValueForMissingStub: null,
      );
}
