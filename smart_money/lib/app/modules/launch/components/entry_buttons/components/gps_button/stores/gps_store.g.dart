// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gps_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GpsStore on _GpsStoreBase, Store {
  final _$latitudeAtom = Atom(name: '_GpsStoreBase.latitude');

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

  final _$longitudeAtom = Atom(name: '_GpsStoreBase.longitude');

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
      Atom(name: '_GpsStoreBase.localizationActivate');

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

  final _$addressesAtom = Atom(name: '_GpsStoreBase.addresses');

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

  final _$getCoordinatesAsyncAction =
      AsyncAction('_GpsStoreBase.getCoordinates');

  @override
  Future<dynamic> getCoordinates() {
    return _$getCoordinatesAsyncAction.run(() => super.getCoordinates());
  }

  final _$decodeCoordinatesAsyncAction =
      AsyncAction('_GpsStoreBase.decodeCoordinates');

  @override
  Future<dynamic> decodeCoordinates() {
    return _$decodeCoordinatesAsyncAction.run(() => super.decodeCoordinates());
  }

  @override
  String toString() {
    return '''
latitude: ${latitude},
longitude: ${longitude},
localizationActivate: ${localizationActivate},
addresses: ${addresses}
    ''';
  }
}
