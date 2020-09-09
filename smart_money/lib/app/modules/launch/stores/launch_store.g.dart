// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LaunchStore on _LaunchStoreBase, Store {
  final _$valueAtom = Atom(name: '_LaunchStoreBase.value');

  @override
  double get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(double value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$newEntryAtom = Atom(name: '_LaunchStoreBase.newEntry');

  @override
  dynamic get newEntry {
    _$newEntryAtom.reportRead();
    return super.newEntry;
  }

  @override
  set newEntry(dynamic value) {
    _$newEntryAtom.reportWrite(value, super.newEntry, () {
      super.newEntry = value;
    });
  }

  final _$descriptionAtom = Atom(name: '_LaunchStoreBase.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$latitudeAtom = Atom(name: '_LaunchStoreBase.latitude');

  @override
  double get latitude {
    _$latitudeAtom.reportRead();
    return super.latitude;
  }

  @override
  set latitude(double value) {
    _$latitudeAtom.reportWrite(value, super.latitude, () {
      super.latitude = value;
    });
  }

  final _$longitudeAtom = Atom(name: '_LaunchStoreBase.longitude');

  @override
  double get longitude {
    _$longitudeAtom.reportRead();
    return super.longitude;
  }

  @override
  set longitude(double value) {
    _$longitudeAtom.reportWrite(value, super.longitude, () {
      super.longitude = value;
    });
  }

  final _$localizationActivateAtom =
      Atom(name: '_LaunchStoreBase.localizationActivate');

  @override
  bool get localizationActivate {
    _$localizationActivateAtom.reportRead();
    return super.localizationActivate;
  }

  @override
  set localizationActivate(bool value) {
    _$localizationActivateAtom.reportWrite(value, super.localizationActivate,
        () {
      super.localizationActivate = value;
    });
  }

  final _$addressesAtom = Atom(name: '_LaunchStoreBase.addresses');

  @override
  List<Address> get addresses {
    _$addressesAtom.reportRead();
    return super.addresses;
  }

  @override
  set addresses(List<Address> value) {
    _$addressesAtom.reportWrite(value, super.addresses, () {
      super.addresses = value;
    });
  }

  final _$decodeCoordinatesAsyncAction =
      AsyncAction('_LaunchStoreBase.decodeCoordinates');

  @override
  Future<dynamic> decodeCoordinates() {
    return _$decodeCoordinatesAsyncAction.run(() => super.decodeCoordinates());
  }

  final _$changeEntryAsyncAction = AsyncAction('_LaunchStoreBase.changeEntry');

  @override
  Future changeEntry(dynamic genericObject) {
    return _$changeEntryAsyncAction.run(() => super.changeEntry(genericObject));
  }

  final _$createObjectEntryAsyncAction =
      AsyncAction('_LaunchStoreBase.createObjectEntry');

  @override
  Future<dynamic> createObjectEntry() {
    return _$createObjectEntryAsyncAction.run(() => super.createObjectEntry());
  }

  @override
  String toString() {
    return '''
value: ${value},
newEntry: ${newEntry},
description: ${description},
latitude: ${latitude},
longitude: ${longitude},
localizationActivate: ${localizationActivate},
addresses: ${addresses}
    ''';
  }
}
