// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LaunchController on _LaunchControllerBase, Store {
  final _$valueAtom = Atom(name: '_LaunchControllerBase.value');

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

  final _$categoriesModelsAtom =
      Atom(name: '_LaunchControllerBase.categoriesModels');

  @override
  List<dynamic> get categoriesModels {
    _$categoriesModelsAtom.reportRead();
    return super.categoriesModels;
  }

  @override
  set categoriesModels(List<dynamic> value) {
    _$categoriesModelsAtom.reportWrite(value, super.categoriesModels, () {
      super.categoriesModels = value;
    });
  }

  final _$dropDownCategoriesAtom =
      Atom(name: '_LaunchControllerBase.dropDownCategories');

  @override
  String get dropDownCategories {
    _$dropDownCategoriesAtom.reportRead();
    return super.dropDownCategories;
  }

  @override
  set dropDownCategories(String value) {
    _$dropDownCategoriesAtom.reportWrite(value, super.dropDownCategories, () {
      super.dropDownCategories = value;
    });
  }

  final _$positionAtom = Atom(name: '_LaunchControllerBase.position');

  @override
  Position get position {
    _$positionAtom.reportRead();
    return super.position;
  }

  @override
  set position(Position value) {
    _$positionAtom.reportWrite(value, super.position, () {
      super.position = value;
    });
  }

  final _$debitAtom = Atom(name: '_LaunchControllerBase.debit');

  @override
  bool get debit {
    _$debitAtom.reportRead();
    return super.debit;
  }

  @override
  set debit(bool value) {
    _$debitAtom.reportWrite(value, super.debit, () {
      super.debit = value;
    });
  }

  final _$moneyMaskAtom = Atom(name: '_LaunchControllerBase.moneyMask');

  @override
  MoneyMaskedTextController get moneyMask {
    _$moneyMaskAtom.reportRead();
    return super.moneyMask;
  }

  @override
  set moneyMask(MoneyMaskedTextController value) {
    _$moneyMaskAtom.reportWrite(value, super.moneyMask, () {
      super.moneyMask = value;
    });
  }

  final _$valueTypeAtom = Atom(name: '_LaunchControllerBase.valueType');

  @override
  String get valueType {
    _$valueTypeAtom.reportRead();
    return super.valueType;
  }

  @override
  set valueType(String value) {
    _$valueTypeAtom.reportWrite(value, super.valueType, () {
      super.valueType = value;
    });
  }

  final _$valueButtonTextAtom =
      Atom(name: '_LaunchControllerBase.valueButtonText');

  @override
  String get valueButtonText {
    _$valueButtonTextAtom.reportRead();
    return super.valueButtonText;
  }

  @override
  set valueButtonText(String value) {
    _$valueButtonTextAtom.reportWrite(value, super.valueButtonText, () {
      super.valueButtonText = value;
    });
  }

  final _$latitudeAtom = Atom(name: '_LaunchControllerBase.latitude');

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

  final _$longitudeAtom = Atom(name: '_LaunchControllerBase.longitude');

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
      Atom(name: '_LaunchControllerBase.localizationActivate');

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

  final _$editEntryAsyncAction = AsyncAction('_LaunchControllerBase.editEntry');

  @override
  Future editEntry(dynamic entryModel) {
    return _$editEntryAsyncAction.run(() => super.editEntry(entryModel));
  }

  final _$getDebitAsyncAction = AsyncAction('_LaunchControllerBase.getDebit');

  @override
  Future getDebit() {
    return _$getDebitAsyncAction.run(() => super.getDebit());
  }

  final _$getCreditAsyncAction = AsyncAction('_LaunchControllerBase.getCredit');

  @override
  Future getCredit() {
    return _$getCreditAsyncAction.run(() => super.getCredit());
  }

  final _$changeCategoriesAsyncAction =
      AsyncAction('_LaunchControllerBase.changeCategories');

  @override
  Future changeCategories(String newDropDownCategories) {
    return _$changeCategoriesAsyncAction
        .run(() => super.changeCategories(newDropDownCategories));
  }

  final _$activateLocalizationAsyncAction =
      AsyncAction('_LaunchControllerBase.activateLocalization');

  @override
  Future<dynamic> activateLocalization() {
    return _$activateLocalizationAsyncAction
        .run(() => super.activateLocalization());
  }

  final _$setDebitCreditAsyncAction =
      AsyncAction('_LaunchControllerBase.setDebitCredit');

  @override
  Future setDebitCredit() {
    return _$setDebitCreditAsyncAction.run(() => super.setDebitCredit());
  }

  final _$deleteEntryAsyncAction =
      AsyncAction('_LaunchControllerBase.deleteEntry');

  @override
  Future<dynamic> deleteEntry(int id) {
    return _$deleteEntryAsyncAction.run(() => super.deleteEntry(id));
  }

  final _$_LaunchControllerBaseActionController =
      ActionController(name: '_LaunchControllerBase');

  @override
  dynamic changeValue(double newValue) {
    final _$actionInfo = _$_LaunchControllerBaseActionController.startAction(
        name: '_LaunchControllerBase.changeValue');
    try {
      return super.changeValue(newValue);
    } finally {
      _$_LaunchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeValueType() {
    final _$actionInfo = _$_LaunchControllerBaseActionController.startAction(
        name: '_LaunchControllerBase.changeValueType');
    try {
      return super.changeValueType();
    } finally {
      _$_LaunchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
categoriesModels: ${categoriesModels},
dropDownCategories: ${dropDownCategories},
position: ${position},
debit: ${debit},
moneyMask: ${moneyMask},
valueType: ${valueType},
valueButtonText: ${valueButtonText},
latitude: ${latitude},
longitude: ${longitude},
localizationActivate: ${localizationActivate}
    ''';
  }
}
