// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditStore on _EditStoreBase, Store {
  final _$amountAtom = Atom(name: '_EditStoreBase.amount');

  @override
  double get amount {
    _$amountAtom.reportRead();
    return super.amount;
  }

  @override
  set amount(double value) {
    _$amountAtom.reportWrite(value, super.amount, () {
      super.amount = value;
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

  final _$addressSplittedAtom = Atom(name: '_EditStoreBase.addressSplitted');

  @override
  dynamic get addressSplitted {
    _$addressSplittedAtom.reportRead();
    return super.addressSplitted;
  }

  @override
  set addressSplitted(dynamic value) {
    _$addressSplittedAtom.reportWrite(value, super.addressSplitted, () {
      super.addressSplitted = value;
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

  final _$updateAdressSplittedAsyncAction =
      AsyncAction('_EditStoreBase.updateAdressSplitted');

  @override
  Future updateAdressSplitted() {
    return _$updateAdressSplittedAsyncAction
        .run(() => super.updateAdressSplitted());
  }

  final _$_EditStoreBaseActionController =
      ActionController(name: '_EditStoreBase');

  @override
  dynamic changeDescription(String value) {
    final _$actionInfo = _$_EditStoreBaseActionController.startAction(
        name: '_EditStoreBase.changeDescription');
    try {
      return super.changeDescription(value);
    } finally {
      _$_EditStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeValue(double value) {
    final _$actionInfo = _$_EditStoreBaseActionController.startAction(
        name: '_EditStoreBase.changeValue');
    try {
      return super.changeValue(value);
    } finally {
      _$_EditStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeImagePreview() {
    final _$actionInfo = _$_EditStoreBaseActionController.startAction(
        name: '_EditStoreBase.changeImagePreview');
    try {
      return super.changeImagePreview();
    } finally {
      _$_EditStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  double getAmount() {
    final _$actionInfo = _$_EditStoreBaseActionController.startAction(
        name: '_EditStoreBase.getAmount');
    try {
      return super.getAmount();
    } finally {
      _$_EditStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCategoryDropDownObject(dynamic value) {
    final _$actionInfo = _$_EditStoreBaseActionController.startAction(
        name: '_EditStoreBase.changeCategoryDropDownObject');
    try {
      return super.changeCategoryDropDownObject(value);
    } finally {
      _$_EditStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
amount: ${amount},
newEntry: ${newEntry},
description: ${description},
addressSplitted: ${addressSplitted}
    ''';
  }
}
