// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditStore on _EditStoreBase, Store {
  final _$valueAtom = Atom(name: '_EditStoreBase.value');

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

  final _$newEntryAtom = Atom(name: '_EditStoreBase.newEntry');

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

  final _$descriptionAtom = Atom(name: '_EditStoreBase.description');

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

  final _$changeEntryAsyncAction = AsyncAction('_EditStoreBase.changeEntry');

  @override
  Future changeEntry(dynamic genericObject) {
    return _$changeEntryAsyncAction.run(() => super.changeEntry(genericObject));
  }

  final _$createObjectEntryAsyncAction =
      AsyncAction('_EditStoreBase.createObjectEntry');

  @override
  Future<dynamic> createObjectEntry() {
    return _$createObjectEntryAsyncAction.run(() => super.createObjectEntry());
  }

  @override
  String toString() {
    return '''
value: ${value},
newEntry: ${newEntry},
description: ${description}
    ''';
  }
}
