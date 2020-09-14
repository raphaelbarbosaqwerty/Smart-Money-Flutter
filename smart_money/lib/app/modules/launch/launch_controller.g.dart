// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LaunchController on _LaunchControllerBase, Store {
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

  final _$dropDownCategoriesIdAtom =
      Atom(name: '_LaunchControllerBase.dropDownCategoriesId');

  @override
  int get dropDownCategoriesId {
    _$dropDownCategoriesIdAtom.reportRead();
    return super.dropDownCategoriesId;
  }

  @override
  set dropDownCategoriesId(int value) {
    _$dropDownCategoriesIdAtom.reportWrite(value, super.dropDownCategoriesId,
        () {
      super.dropDownCategoriesId = value;
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

  final _$loadingAtom = Atom(name: '_LaunchControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$checkIfExistsEntryAsyncAction =
      AsyncAction('_LaunchControllerBase.checkIfExistsEntry');

  @override
  Future checkIfExistsEntry(dynamic genericObject) {
    return _$checkIfExistsEntryAsyncAction
        .run(() => super.checkIfExistsEntry(genericObject));
  }

  final _$changeValueTypeAsyncAction =
      AsyncAction('_LaunchControllerBase.changeValueType');

  @override
  Future changeValueType() {
    return _$changeValueTypeAsyncAction.run(() => super.changeValueType());
  }

  final _$populateLaunchAsyncAction =
      AsyncAction('_LaunchControllerBase.populateLaunch');

  @override
  Future populateLaunch() {
    return _$populateLaunchAsyncAction.run(() => super.populateLaunch());
  }

  final _$checkArrayCategoryAsyncAction =
      AsyncAction('_LaunchControllerBase.checkArrayCategory');

  @override
  Future checkArrayCategory() {
    return _$checkArrayCategoryAsyncAction
        .run(() => super.checkArrayCategory());
  }

  final _$findCategoryIdAsyncAction =
      AsyncAction('_LaunchControllerBase.findCategoryId');

  @override
  Future<dynamic> findCategoryId(int id) {
    return _$findCategoryIdAsyncAction.run(() => super.findCategoryId(id));
  }

  final _$changeCategoriesAsyncAction =
      AsyncAction('_LaunchControllerBase.changeCategories');

  @override
  Future changeCategories(dynamic newDropDownCategories) {
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

  final _$_LaunchControllerBaseActionController =
      ActionController(name: '_LaunchControllerBase');

  @override
  dynamic changeMoneyMaskValue(double value) {
    final _$actionInfo = _$_LaunchControllerBaseActionController.startAction(
        name: '_LaunchControllerBase.changeMoneyMaskValue');
    try {
      return super.changeMoneyMaskValue(value);
    } finally {
      _$_LaunchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic isNewEntryNegative() {
    final _$actionInfo = _$_LaunchControllerBaseActionController.startAction(
        name: '_LaunchControllerBase.isNewEntryNegative');
    try {
      return super.isNewEntryNegative();
    } finally {
      _$_LaunchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDebit() {
    final _$actionInfo = _$_LaunchControllerBaseActionController.startAction(
        name: '_LaunchControllerBase.changeDebit');
    try {
      return super.changeDebit();
    } finally {
      _$_LaunchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeValueTypeNegative() {
    final _$actionInfo = _$_LaunchControllerBaseActionController.startAction(
        name: '_LaunchControllerBase.changeValueTypeNegative');
    try {
      return super.changeValueTypeNegative();
    } finally {
      _$_LaunchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeValueTypePositive() {
    final _$actionInfo = _$_LaunchControllerBaseActionController.startAction(
        name: '_LaunchControllerBase.changeValueTypePositive');
    try {
      return super.changeValueTypePositive();
    } finally {
      _$_LaunchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDropDownCategoriesId(int value) {
    final _$actionInfo = _$_LaunchControllerBaseActionController.startAction(
        name: '_LaunchControllerBase.changeDropDownCategoriesId');
    try {
      return super.changeDropDownCategoriesId(value);
    } finally {
      _$_LaunchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeValueButtonText(String value) {
    final _$actionInfo = _$_LaunchControllerBaseActionController.startAction(
        name: '_LaunchControllerBase.changeValueButtonText');
    try {
      return super.changeValueButtonText(value);
    } finally {
      _$_LaunchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeLocalizationActivate(bool value) {
    final _$actionInfo = _$_LaunchControllerBaseActionController.startAction(
        name: '_LaunchControllerBase.changeLocalizationActivate');
    try {
      return super.changeLocalizationActivate(value);
    } finally {
      _$_LaunchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

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
  dynamic changeCategorieList(List<dynamic> value) {
    final _$actionInfo = _$_LaunchControllerBaseActionController.startAction(
        name: '_LaunchControllerBase.changeCategorieList');
    try {
      return super.changeCategorieList(value);
    } finally {
      _$_LaunchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDescription(String value) {
    final _$actionInfo = _$_LaunchControllerBaseActionController.startAction(
        name: '_LaunchControllerBase.changeDescription');
    try {
      return super.changeDescription(value);
    } finally {
      _$_LaunchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
categoriesModels: ${categoriesModels},
dropDownCategoriesId: ${dropDownCategoriesId},
debit: ${debit},
moneyMask: ${moneyMask},
valueType: ${valueType},
valueButtonText: ${valueButtonText},
localizationActivate: ${localizationActivate},
loading: ${loading}
    ''';
  }
}
